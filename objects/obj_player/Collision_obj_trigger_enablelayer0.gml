/// @description 

instance_deactivate_layer(obj_switchManager.layer_names[0])

obj_switchManager.layer_active[0] = true
obj_switchManager.layer_names[0] = other.targetLayer
obj_switchManager.asset_layer_names[0] = true

obj_switchManager.c_1 = $00B200

instance_activate_layer(obj_switchManager.layer_names[0])
with (obj_shooter_l_layer) {
	alarm[0] = shootingSpeed
	alarm[1] = -1
}
with (obj_shooter_r_layer) {
	alarm[0] = shootingSpeed
	alarm[1] = -1
}
