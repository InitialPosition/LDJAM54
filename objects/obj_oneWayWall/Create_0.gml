/// @description create wall instance

wall = instance_create_layer(x, y, layer, obj_wall)
instance_deactivate_object(wall)

if layer_get_id("Instances_Back") != layer {
	sprite_index = spr_oneWayFloor_toggle
}