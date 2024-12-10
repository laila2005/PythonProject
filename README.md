
# Audio Visualization and Pitch Modification GUI
This project is a MATLAB-based graphical user interface (GUI) designed to visualize audio signals in both time and frequency domains and manipulate their pitch. It offers an interactive and user-friendly experience for analyzing and modifying audio data.

## Features
### Audio Loading:

Load ``.mat`` files containing audio data ``(audio_data)`` and sampling frequency`` (fs).``
Ensure the file structure includes audio_data and fs variables.
## Visualization:

- View the time-domain representation of the audio signal.
- Analyze the frequency spectrum using the frequency-domain plot.
## Pitch Modification:

### Change the pitch of the audio to simulate different voices:
- Male Voice (lower pitch)
- Female Voice (slightly higher pitch)
- Child Voice (significantly higher pitch)
- Restore the audio to its original pitch using the Reset button.
Audio Playback:

Play the loaded or modified audio directly from the GUI.
Requirements
Software
MATLAB: R2020b or later (earlier versions may work but are not tested).
MATLAB Signal Processing Toolbox (required for resampling functionality).
File Format
Input files must be in .mat format containing:
audio_data: The audio signal (vector of samples).
fs: The sampling frequency (scalar).
How to Use
Launch the GUI:

Run the audioVisualizationGUI.m script in MATLAB.
Load Audio:

Click the Load Audio button to select a .mat file containing the audio data.
The time and frequency domain plots will automatically update based on the loaded audio.
Modify Pitch:

Click one of the voice buttons to modify the pitch:
Male Voice lowers the pitch (factor: 0.8).
Female Voice slightly raises the pitch (factor: 1.2).
Child Voice significantly raises the pitch (factor: 1.5).
Reset Audio:

Click the Reset button to restore the original audio.
Play Audio:

Click the Play button to hear the current audio signal (original or modified).
File Structure
css
Copy code
audioVisualizationGUI.m   % Main MATLAB GUI script
example_audio.mat         % Example .mat file containing audio data (optional)
README.md                 % Documentation for the project
Error Handling
Invalid File Structure: Displays an error if the .mat file does not include audio_data and fs.
Pitch Factor Limitations: Prevents pitch factors that could result in an invalid or unplayable sample rate.
Resampling Errors: Alerts the user if resampling fails due to extreme pitch changes.
Troubleshooting
Audio Does Not Play:

Ensure you have loaded a valid .mat file.
Verify that audio_data and fs are correctly structured.
GUI Not Launching:

Ensure all required files are in the MATLAB working directory.
Verify that MATLAB Signal Processing Toolbox is installed.
Errors with Pitch Modification:

Large pitch changes may cause resampling errors. Try using a smaller pitch factor.
Example Usage
To test the application, load an example .mat file:

matlab
Copy code
audio_data = sin(2 * pi * 440 * (0:1/44100:1)); % Example sine wave
fs = 44100; % Sampling frequency
save('example_audio.mat', 'audio_data', 'fs'); % Save as .mat file
Run the GUI and load the example_audio.mat file to visualize and modify the audio.

Future Improvements
Support for additional audio formats (e.g., .wav or .mp3).
Real-time visualization during audio playback.
Advanced pitch modification algorithms for higher-quality results.
Integration with more audio analysis features.
License
This project is licensed under the MIT License. See the LICENSE file for more details.
