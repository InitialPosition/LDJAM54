if active {
	obj_keyMap_manager.settingKey = false
	
	if keyboard_key == vk_escape {
		displayText = "JUMP: " + currentKey
		active = false
		c_draw = c_white
		return
	}
	
	global.CONTROLS_JUMP = keyboard_key
	currentKey = scr_getKeyName(global.CONTROLS_JUMP)
	displayText = "JUMP: " + currentKey
	active = false
	c_draw = c_white
}