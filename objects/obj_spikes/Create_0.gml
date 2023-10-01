/// @description setup

image_speed = 0

// rotation priority: up, down, right, left
if place_meeting(x, y + 1, obj_wall) {
	image_index = 0
	mask_index = spr_spikes_hitbox_u
}
else if place_meeting(x, y - 1, obj_wall) {
	image_index = 2
	mask_index = spr_spikes_hitbox_d
}
else if place_meeting(x + 1, y, obj_wall) {
	image_index = 3
	mask_index = spr_spikes_hitbox_l
}
else if place_meeting(x - 1, y, obj_wall) {
	image_index = 1
	mask_index = spr_spikes_hitbox_r
}
else {
	image_index = 0
	mask_index = spr_spikes_hitbox_u
}
