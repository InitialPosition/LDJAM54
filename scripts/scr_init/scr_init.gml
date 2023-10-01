function SCRIPT_INIT() {
	
	audio_group_load(audio_music)
	
	global.GAME_NAME = "CAVE"
	global.GAME_AUTHOR = "RedCocoa"
	global.GAME_VERSION = GM_version
	
	global.SCREEN_WIDTH = 256
	global.SCREEN_HEIGHT = 144
	
	window_set_caption(global.GAME_NAME)
	scr_windowModifier_setWindowSize(1280, 720)
	//window_set_cursor(cr_none)
	
	if scr_hasConfig() {
		scr_loadConfig()
	} else {
		global.CONTROLS_JUMP = vk_up
		global.CONTROLS_DOWN = vk_down
		global.CONTROLS_LEFT = vk_left
		global.CONTROLS_RIGHT = vk_right
		global.CONTROLS_ACTION = ord("X")
		
		scr_saveConfig()
	}
	
	global.SAVED_X = -999
	global.SAVED_Y = -999
	
	global.SAVED_LAYER_0 = "none"
	global.SAVED_LAYER_1 = "none"
	global.SAVED_LAYER_2 = "none"
	
	room_goto(rm_mainMenu)
}