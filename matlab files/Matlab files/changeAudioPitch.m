function changePitch(factor)
    if ~isempty(audio_data) && fs > 0
        % Calculate new sampling rates for resampling
        P = round(fs * factor);
        Q = fs;

        % Resample audio
        [P, Q] = rat(P / Q); % Reduce to smallest integer ratio
        audio_data = resample(audio_data, P, Q);
        fs = fs * (P / Q); % Adjust sampling frequency accordingly

        % Update the plots
        updatePlots();

        % Update the audio player for the modified audio
        if ~isempty(player)
            stop(player); % Stop the current playback if active
        end
        player = audioplayer(audio_data, fs);
        uialert(fig, 'Pitch changed successfully. Now you can play the audio.', 'Success');
    else
        uialert(fig, 'No audio loaded to change pitch.', 'Error');
    end
end