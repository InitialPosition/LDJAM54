can_toggle[0] = true

if audio_is_playing(snd_restore) {
	audio_stop_sound(snd_restore)
}
audio_play_sound(snd_restore, 1, 0)

a_1 = 1