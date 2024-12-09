from scipy.io import savemat
import numpy as np
import sounddevice as sd

# Parameters
fs = 44100
duration = 5

def record_audio():
    print("Recording audio...")
    audio_data = sd.rec(int(fs * duration), samplerate=fs, channels=1, dtype='float64')
    sd.wait()
    print("Recording complete. Saving audio data...")
    savemat("audio_data.mat", {"audio_data": audio_data, "fs": fs})
    print("Audio data saved to 'audio_data.mat'.")

if __name__ == "__main__":
    record_audio()
