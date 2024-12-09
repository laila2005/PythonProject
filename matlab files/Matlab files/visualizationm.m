function audioVisualizationGUI()
    % Create a figure for the GUI
    fig = uifigure('Name', 'Audio Visualization with Pitch Control', 'Position', [100, 100, 600, 500]);

    % Load Audio Button
    loadBtn = uibutton(fig, 'Text', 'Load Audio', 'Position', [20, 400, 100, 40], 'ButtonPushedFcn', @(btn, event) loadAudio());

    % Play Audio Button
    playBtn = uibutton(fig, 'Text', 'Play Audio', 'Position', [130, 400, 100, 40], 'ButtonPushedFcn', @(btn, event) playAudio());

    % Pause Audio Button
    pauseBtn = uibutton(fig, 'Text', 'Pause Audio', 'Position', [240, 400, 100, 40], 'ButtonPushedFcn', @(btn, event) pauseAudio());

    % Stop Audio Button
    stopBtn = uibutton(fig, 'Text', 'Stop Audio', 'Position', [350, 400, 100, 40], 'ButtonPushedFcn', @(btn, event) stopAudio());

    % Male Frequency Button
    maleBtn = uibutton(fig, 'Text', 'Male Voice', 'Position', [20, 350, 100, 40], 'ButtonPushedFcn', @(btn, event) changePitch(0.8));

    % Female Frequency Button
    femaleBtn = uibutton(fig, 'Text', 'Female Voice', 'Position', [130, 350, 100, 40], 'ButtonPushedFcn', @(btn, event) changePitch(1.2));

    % Child Frequency Button
    childBtn = uibutton(fig, 'Text', 'Child Voice', 'Position', [240, 350, 100, 40], 'ButtonPushedFcn', @(btn, event) changePitch(1.5));

    % Create axes for plotting the time and frequency domains
    ax1 = axes(fig, 'Position', [0.1, 0.5, 0.35, 0.4]);
    ax2 = axes(fig, 'Position', [0.1, 0.1, 0.35, 0.4]);

    % Variables to hold audio data and player
    audio_data = [];
    fs = [];
    player = [];

    % Function to load audio
    function loadAudio()
        [file, path] = uigetfile({'*.wav', 'Audio Files (*.wav)'});
        if file
            [audio_data, fs] = audioread(fullfile(path, file));
            
            % Update the time-domain and frequency-domain plots
            updatePlots();
        end
    end

    % Function to play audio
    function playAudio()
        if ~isempty(audio_data)
            player = audioplayer(audio_data, fs);
            play(player);
        end
    end

    % Function to pause audio
    function pauseAudio()
        if ~isempty(player)
            pause(player);
        end
    end

    % Function to stop audio
    function stopAudio()
        if ~isempty(player)
            stop(player);
        end
    end

    % Function to change the pitch (frequency)
    function changePitch(factor)
        if ~isempty(audio_data)
            % Call the external function to change pitch
            [audio_data, fs] = changeAudioPitch(audio_data, fs, factor);
            
            % Update the time-domain and frequency-domain plots
            updatePlots();
        end
    end

    % Function to update the plots
    function updatePlots()
        % Time-domain plot
        t = (0:length(audio_data)-1) / fs;
        plot(ax1, t, audio_data);
        title(ax1, 'Time Domain');
        xlabel(ax1, 'Time (s)');
        ylabel(ax1, 'Amplitude');
        
        % Frequency-domain plot
        N = length(audio_data);
        fft_data = abs(fft(audio_data));
        f = linspace(0, fs, floor(N/2)+1);
        plot(ax2, f, fft_data(1:floor(N/2)+1));
        title(ax2, 'Frequency Domain');
        xlabel(ax2, 'Frequency (Hz)');
        ylabel(ax2, 'Magnitude');
    end
end
