/// @description 

springJump = true
canDoubleJump = true
yy = -obj_gameManager.PLAYER_SPRING_JUMP_FORCE * 4

if !audio_is_playing(snd_env_spring) {
	audio_play_sound(snd_env_spring, 1, 0)
}

with (other) {
	alarm[0] = 1
}
