% Load the audio data
load('audio_data.mat'); % Ensure the file is in your workspace

% Extract the audio signal and sampling frequency
audio_data = data.audio_data; % Extract audio data from the structure 'data'
fs = double(fs);              % Convert fs to double for arithmetic operations

% Generate time vector
t = (0:length(audio_data)-1) / fs; % Time vector in seconds

% Plot the time-domain signal
figure;
subplot(2, 1, 1);
plot(t, audio_data);
title('Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

% Frequency-domain analysis
N = length(audio_data); % Length of the audio signal
fft_data = abs(fft(audio_data)); % Compute FFT magnitude
f = linspace(0, fs, floor(N/2)+1); % Frequency vector (one-sided)

% Plot the frequency-domain signal
subplot(2, 1, 2);
plot(f, fft_data(1:floor(N/2)+1));
title('Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude');