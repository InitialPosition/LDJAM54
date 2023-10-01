if active {
	obj_keyMap_manager.settingKey = false
	
	if keyboard_key == vk_escape {
		displayText = "RIGHT: " + currentKey
		active = false
		c_draw = c_white
		return
	}
	
	global.CONTROLS_RIGHT = keyboard_key
	currentKey = scr_getKeyName(global.CONTROLS_RIGHT)
	displayText = "RIGHT: " + currentKey
	active = false
	c_draw = c_white
}