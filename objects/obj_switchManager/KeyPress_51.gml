/// @description 

changingLayer = 2

if layer_names[changingLayer] == "none" {
	return
}

if can_toggle[changingLayer] {
	can_toggle[changingLayer] = false
	alarm[changingLayer] = toggle_reset
	
	instance_deactivate_layer(layer_names[changingLayer])
	
	a_3 = 0.3
	
	if (layer_active[changingLayer]) {
		with obj_shooter_r_layer {
			alarm[0] = -1
			alarm[1] = -1
		}
		instance_deactivate_layer(layer_names[changingLayer])
	} else {
		instance_activate_layer(layer_names[changingLayer])
		with obj_shooter_r_layer {
			alarm[0] = shootingSpeed
			alarm[1] = -1
		}
	}
	
	layer_active[changingLayer] = layer_active[changingLayer] == true ? false : true
}
