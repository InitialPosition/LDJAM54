if active {
	obj_keyMap_manager.settingKey = false
	
	if keyboard_key == vk_escape {
		displayText = "DOWN: " + currentKey
		active = false
		c_draw = c_white
		return
	}
	
	global.CONTROLS_DOWN = keyboard_key
	currentKey = scr_getKeyName(global.CONTROLS_DOWN)
	displayText = "DOWN: " + currentKey
	active = false
	c_draw = c_white
}