## Audio Visualization and Pitch Modification GUI

This project is a MATLAB-based graphical user interface (GUI) designed for visualizing audio signals in both time and frequency domains and modifying their pitch. It provides an intuitive and interactive platform for analyzing and transforming audio data.

<img src="https://github.com/laila2005/PythonProject/blob/master/image.png" width="500" height="300">

### Features

#### Audio Loading
- Load `.mat` files containing:
  - **audio_data**: The audio signal (a vector of samples).
  - **fs**: The sampling frequency (a scalar).
- Ensure the `.mat` file structure includes both `audio_data` and `fs` variables.

#### Visualization
- **Time-Domain Plot**: Visualize the audio signal waveform over time.
- **Frequency-Domain Plot**: Analyze the audio signal's frequency spectrum.

#### Pitch Modification
- Change the audio pitch to simulate different voices:
  - **Male Voice**: Lowers the pitch (factor: 0.8).
  - **Female Voice**: Slightly raises the pitch (factor: 1.2).
  - **Child Voice**: Significantly raises the pitch (factor: 1.5).
- Restore the original pitch with the **Reset** button.

#### Audio Playback
- Play the loaded or modified audio directly from the GUI.

### Requirements

#### Software
- **MATLAB**: R2020b or later (earlier versions may work but are not tested).
- **MATLAB Signal Processing Toolbox**: Required for resampling functionality.

#### File Format
- Input files must be in `.mat` format, containing:
  - **audio_data**: The audio signal (vector of samples).
  - **fs**: The sampling frequency (scalar).

### How to Use

1. **Launch the GUI**
   - Run the `RunAllFiles.m` script in MATLAB.

2. **Load Audio**
   - Click the **Load Audio** button to select a `.mat` file. The GUI will automatically update with:
     - Time-Domain Plot
     - Frequency-Domain Plot

3. **Modify Pitch**
   - Use the voice modification buttons to alter the pitch:
     - **Male Voice**: Lowers the pitch.
     - **Female Voice**: Slightly raises the pitch.
     - **Child Voice**: Significantly raises the pitch.

4. **Reset Audio**
   - Click the **Reset** button to restore the audio to its original pitch.

5. **Play Audio**
   - Click the **Play** button to hear the current audio (original or modified).

### File Structure

| File                      | Description                              |
|---------------------------|------------------------------------------|
| `audioVisualizationGUI.m` | Main MATLAB GUI script.                  |
| `example_audio.mat`       | Example `.mat` file containing audio data. |
| `README.md`               | Documentation for the project.           |

### Error Handling

- **Invalid File Structure**: Displays an error if the `.mat` file does not contain `audio_data` and `fs`.
- **Pitch Factor Limits**: Prevents extreme pitch changes that could result in invalid sample rates.
- **Resampling Errors**: Alerts users if resampling fails due to significant pitch changes.

### Troubleshooting

| Problem                   | Solution                                                                          |
|---------------------------|----------------------------------------------------------------------------------|
| Audio Does Not Play       | Ensure a valid `.mat` file is loaded. Verify `audio_data` and `fs` are properly structured. |
| GUI Not Launching         | Ensure all required files are in the MATLAB working directory. Confirm MATLAB Signal Processing Toolbox is installed. |
| Errors in Pitch Modification | Reduce the pitch modification factor to avoid extreme resampling errors.          |

### Example Usage

To test the application, create and save a sample `.mat` file:

```matlab
audio_data = sin(2 * pi * 440 * (0:1/44100:1)); % Example sine wave
fs = 44100; % Sampling frequency
save('example_audio.mat', 'audio_data', 'fs'); % Save as .mat file
```

Run the GUI and load the `example_audio.mat` file to visualize and modify the audio.

### Future Improvements

- Support for additional audio formats (e.g., `.wav`, `.mp3`).
- Real-time visualization during audio playback.
- Advanced pitch modification algorithms for higher-quality results.
- Integration of additional audio analysis features.

Enjoy exploring audio with this versatile GUI! 🎵
