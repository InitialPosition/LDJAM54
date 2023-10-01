function scr_hasConfig() {
	return file_exists(working_directory + "config.ini")
}

function scr_initConfig() {
	ini_open(working_directory + "config.ini")
	
	ini_write_real("controls", "jump", vk_up)
	ini_write_real("controls", "down", vk_down)
	ini_write_real("controls", "left", vk_left)
	ini_write_real("controls", "right", vk_right)
	ini_write_real("controls", "action", ord("X"))
	
	ini_close()
}

function scr_loadConfig() {
	ini_open(working_directory + "config.ini")
	
	global.CONTROLS_JUMP = ini_read_real("controls", "jump", vk_up)
	global.CONTROLS_DOWN = ini_read_real("controls", "down", vk_down)
	global.CONTROLS_LEFT = ini_read_real("controls", "left", vk_left)
	global.CONTROLS_RIGHT = ini_read_real("controls", "right", vk_right)
	global.CONTROLS_ACTION = ini_read_real("controls", "action", ord("X"))
	
	ini_close()
}

function scr_saveConfig() {
	ini_open(working_directory + "config.ini")
	
	ini_write_real("controls", "jump", global.CONTROLS_JUMP)
	ini_write_real("controls", "down", global.CONTROLS_DOWN)
	ini_write_real("controls", "left", global.CONTROLS_LEFT)
	ini_write_real("controls", "right", global.CONTROLS_RIGHT)
	ini_write_real("controls", "action", global.CONTROLS_ACTION)
	
	ini_close()
}

function scr_getKeyName(key) {
	show_debug_message(string(ord(key)))
	switch (key) {
		case vk_left:
			return "LEFT ARROW"
		case vk_right:
			return "RIGHT ARROW"
		case vk_up:
			return "UP ARROW"
		case vk_down:
			return "DOWN ARROW"
		case vk_space:
			return "SPACE"
		case vk_shift:
			return "SHIFT"
		case vk_rshift:
			return "SHIFT"
		case vk_control:
			return "CTRL"
		case vk_rcontrol:
			return "CTRL"
		case vk_alt:
			return "ALT"
		case vk_ralt:
			return "ALT"
		default:
			return chr(key)
	}
}