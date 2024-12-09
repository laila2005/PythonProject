function audioVisualizationGUI()
    % Create the GUI figure
    fig = uifigure('Name', 'Audio Visualization', 'Position', [100, 100, 800, 600]);

    % Create a grid layout
    layout = uigridlayout(fig, [3, 3]); % 3 rows, 3 columns
    layout.RowHeight = {'1x', 50, 50}; % Top: Plots, Bottom: Buttons
    layout.ColumnWidth = {'1x', '1x', '1x'}; % Equal columns for buttons

    % Time-domain plot (left)
    ax1 = uiaxes(layout);
    ax1.Layout.Row = 1;
    ax1.Layout.Column = 1;
    title(ax1, 'Time Domain');
    xlabel(ax1, 'Time (s)');
    ylabel(ax1, 'Amplitude');

    % Frequency-domain plot (right)
    ax2 = uiaxes(layout);
    ax2.Layout.Row = 1;
    ax2.Layout.Column = 3;
    title(ax2, 'Frequency Domain');
    xlabel(ax2, 'Frequency (Hz)');
    ylabel(ax2, 'Magnitude');

    % Buttons for controls
    loadBtn = uibutton(layout, 'Text', 'Load Audio', 'ButtonPushedFcn', @(~, ~) loadAudio());
    loadBtn.Layout.Row = 2;
    loadBtn.Layout.Column = 1;

    maleBtn = uibutton(layout, 'Text', 'Male Voice', 'ButtonPushedFcn', @(~, ~) changePitch(0.8));
    maleBtn.Layout.Row = 2;
    maleBtn.Layout.Column = 2;

    femaleBtn = uibutton(layout, 'Text', 'Female Voice', 'ButtonPushedFcn', @(~, ~) changePitch(1.2));
    femaleBtn.Layout.Row = 2;
    femaleBtn.Layout.Column = 3;

    childBtn = uibutton(layout, 'Text', 'Child Voice', 'ButtonPushedFcn', @(~, ~) changePitch(1.5));
    childBtn.Layout.Row = 3;
    childBtn.Layout.Column = 1;

    resetBtn = uibutton(layout, 'Text', 'Reset', 'ButtonPushedFcn', @(~, ~) resetAudio());
    resetBtn.Layout.Row = 3;
    resetBtn.Layout.Column = 2;

    playBtn = uibutton(layout, 'Text', 'Play', 'ButtonPushedFcn', @(~, ~) playAudio());
    playBtn.Layout.Row = 3;
    playBtn.Layout.Column = 3;

    % Variables to store audio data
    audio_data = [];
    original_audio = [];
    fs = 0;

    % Load audio function
    function loadAudio()
        [file, path] = uigetfile('*.mat', 'Select an Audio File');
        if isequal(file, 0)
            return; % No file selected
        end
        audio_struct = load(fullfile(path, file));
        if isfield(audio_struct, 'audio_data') && isfield(audio_struct, 'fs')
            audio_data = double(audio_struct.audio_data); % Ensure it's double
            original_audio = audio_data; % Save original audio for reset
            fs = double(audio_struct.fs); % Ensure fs is double
            disp('Audio loaded successfully.');
            updatePlots();
        else
            uialert(fig, 'Invalid file format. Ensure the file contains "audio_data" and "fs".', 'Error');
        end
    end

    % Update plots function
    function updatePlots()
        if ~isempty(audio_data) && fs > 0
            % Time domain plot
            t = (0:length(audio_data)-1) / fs;
            plot(ax1, t, audio_data);
            title(ax1, 'Time Domain');
            xlabel(ax1, 'Time (s)');
            ylabel(ax1, 'Amplitude');

            % Frequency domain plot
            N = length(audio_data);
            fft_data = abs(fft(audio_data)) / N;
            f = linspace(0, fs/2, floor(N/2) + 1);
            plot(ax2, f, fft_data(1:floor(N/2) + 1));
            title(ax2, 'Frequency Domain');
            xlabel(ax2, 'Frequency (Hz)');
            ylabel(ax2, 'Magnitude');
        end
    end

    % Change pitch function
    function changePitch(factor)
        if ~isempty(audio_data) && fs > 0
            audio_data = resample(audio_data, round(fs * factor), fs);
            fs = fs * factor;
            updatePlots();
        else
            uialert(fig, 'No audio loaded to change pitch.', 'Error');
        end
    end

    % Reset audio function
    function resetAudio()
        if ~isempty(original_audio)
            audio_data = original_audio;
            fs = double(fs); % Reset sampling frequency as double
            updatePlots();
        else
            uialert(fig, 'No audio to reset.', 'Error');
        end
    end

    % Play audio function
    function playAudio()
        if ~isempty(audio_data)
            sound(audio_data, fs);
        else
            uialert(fig, 'No audio to play.', 'Error');
        end
    end
end