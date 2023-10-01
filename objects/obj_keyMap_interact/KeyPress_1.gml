if active {
	obj_keyMap_manager.settingKey = false
	
	if keyboard_key == vk_escape {
		displayText = "INTERACT: " + currentKey
		active = false
		c_draw = c_white
		return
	}
	
	global.CONTROLS_ACTION = keyboard_key
	currentKey = scr_getKeyName(global.CONTROLS_ACTION)
	displayText = "INTERACT: " + currentKey
	active = false
	c_draw = c_white
}