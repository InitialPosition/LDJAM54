function scr_camera_init() {
	camera_set_view_target(view_camera[0], self);
	camera_set_view_border(view_camera[0], view_wport[0] / 2, view_hport[0] / 2);
	origSmoothness = 0.1;
	camSmoothness = origSmoothness;
	
	camTarget = obj_player;
	
	offsetMultiplier = 20
	offsetX = 0
	offsetSmoothness = 0.1
	
	boxXL = 0;
	boxXR = 0;
	boxYL = 0;
	boxYR = 0;
	
	//bg0 = layer_get_id("BG_P0")
	//bg1 = layer_get_id("BG_P1")
	//bg2 = layer_get_id("BG_P2")
	//bgS = layer_get_id("BG_S")
}

function scr_camera_update() {
	if (instance_exists(camTarget)) {
		
		offsetX = lerp(offsetX, camTarget.xx * offsetMultiplier, offsetSmoothness)
		
		camTargetX = clamp(camTarget.x + offsetX, boxXL, boxXR);
		camTargetY = clamp(camTarget.y, boxYL, boxYR);
	} else {
		x = clamp(global.SAVED_X, boxXL, boxXR)
		y = clamp(global.SAVED_Y, boxYL, boxYR)
	}
	
	x = lerp(x, round(camTargetX), camSmoothness);
	y = lerp(y, round(camTargetY), camSmoothness);
	
	//layer_x(bg0, x / 1.01)
	//layer_x(bg1, x / 2)
	//layer_x(bg2, x / 3)
	//layer_x(bgS, x - (view_wport[0] / 4))
}
