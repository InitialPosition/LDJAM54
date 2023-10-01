/// @description 

changingLayer = 0

if layer_names[changingLayer] == "none" {
	return
}

if can_toggle[changingLayer] {
	can_toggle[changingLayer] = false
	alarm[changingLayer] = toggle_reset
	
	instance_deactivate_layer(layer_names[changingLayer])
	
	a_1 = 0.3
	
	if (layer_active[changingLayer]) {
		with obj_shooter_r_layer {
			alarm[0] = -1
			alarm[1] = -1
		}
		with obj_shooter_l_layer {
			alarm[0] = -1
			alarm[1] = -1
		}
		instance_deactivate_layer(layer_names[changingLayer])
		
		if audio_is_playing(snd_layer_down) {
			audio_stop_sound(snd_layer_down)
		}
		audio_play_sound(snd_layer_down, 1, 0)
		
		c_1 = $0B1BA8
	} else {
		instance_activate_layer(layer_names[changingLayer])
		with obj_shooter_r_layer {
			alarm[0] = shootingSpeed
			alarm[1] = -1
		}
		with obj_shooter_l_layer {
			alarm[0] = shootingSpeed
			alarm[1] = -1
		}
		
		if audio_is_playing(snd_layer_back) {
			audio_stop_sound(snd_layer_back)
		}
		audio_play_sound(snd_layer_back, 1, 0)
		
		c_1 = $00B200
	}
	
	layer_active[changingLayer] = layer_active[changingLayer] == true ? false : true
}
