if active {
	obj_keyMap_manager.settingKey = false
	
	if keyboard_key == vk_escape {
		displayText = "LEFT: " + currentKey
		active = false
		c_draw = c_white
		return
	}
	
	global.CONTROLS_LEFT = keyboard_key
	currentKey = scr_getKeyName(global.CONTROLS_LEFT)
	displayText = "LEFT: " + currentKey
	active = false
	c_draw = c_white
}