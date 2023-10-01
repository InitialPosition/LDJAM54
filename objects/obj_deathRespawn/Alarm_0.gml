/// @description respawn player

instance_activate_object(obj_door)
instance_activate_object(obj_switch)

with (obj_switch) {
	image_index = 0
}

with (obj_door) {
	active = false
}

with (obj_shooter_r) {
	alarm[0] = shootingSpeed
	alarm[1] = -1
}

with (obj_shooter_r_layer) {
	alarm[0] = shootingSpeed
	alarm[1] = -1
}

with (obj_shooter_l) {
	alarm[0] = shootingSpeed
	alarm[1] = -1
}

with (obj_shooter_l_layer) {
	alarm[0] = shootingSpeed
	alarm[1] = -1
}

instance_create_layer(0, 0, "Instances_Front", obj_player)
instance_destroy()
