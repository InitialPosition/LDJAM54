can_toggle[1] = true

if audio_is_playing(snd_restore) {
	audio_stop_sound(snd_restore)
}
audio_play_sound(snd_restore, 1, 0)

a_2 = 1