function scr_interactOpenDoor(targetDoorIndex) {
	with (obj_door) {
		if doorIndex == targetDoorIndex {
			active = true
			alarm[0] = 4
		}
	}
}