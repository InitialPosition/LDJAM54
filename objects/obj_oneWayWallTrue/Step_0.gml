/// @description update wall

if instance_exists(obj_player) {
	if obj_player.y + 7 < y {
		instance_activate_object(wall)
	} else if obj_player.y + 6 > y {
		instance_deactivate_object(wall)
	}
}
