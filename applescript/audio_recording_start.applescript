-- -------------------------------------------------------
-- AppleScript - Start an Audio Recording using QuickTime
-- -------------------------------------------------------
--             _            _                 
--   __ _   __| | ___ _ __ | | _____ _ __ ___ 
--  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
-- | (_| || (_| |  __/ | | |   <  __/ |  \__ \
--  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
-- adge.denkers@gmail.com | https://github.com/adgedenkers
-- -------------------------------------------------------
-- file name: audio_recording_start.applescript
-- location: ~/bin/fz/applescript/
-- date: 2018-05-02
-- -------------------------------------------------------

-- Tell QuickTime to Start
tell application "QuickTime Player"
	-- Make QuickTime the Front Most Application
	activate
	-- Create `NewAudioRecording` as a New Audio Recording
	set NewAudioRecording to new audio recording
	-- Tell the `NewAudioRecording` to start recording
	tell NewAudioRecording
		start
	end tell
end tell