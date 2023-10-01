function scr_changeLayer() {
	var layerToChange = obj_switchManager.changingLayer
	var layerActive
	
	if (!place_meeting(x, y, obj_player.currentCamBox)) {
		return
	}
	
	if (object_index == obj_shooter_r_layer) {
		alarm[0] = -1
		alarm[1] = -1
	}
}
