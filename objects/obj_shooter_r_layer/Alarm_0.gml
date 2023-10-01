alarm[1] = powerUpTime

if audio_is_playing(snd_powerUp) {
	audio_stop_sound(snd_powerUp)
}
audio_play_sound(snd_powerUp, 1, 0)