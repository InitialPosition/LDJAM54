function scr_saveGame(saveSlot) {
	f = file_text_open_write(working_directory + "save" + string(saveSlot) + ".tsf")
	
	file_text_write_real(f, room)
	file_text_write_real(f, global.SAVED_X)
	file_text_write_real(f, global.SAVED_Y)
	file_text_write_real(f, obj_gameManager.DEATHS)
	
	file_text_close(f)
}

function scr_loadGame(saveSlot) {
	f = file_text_open_read(working_directory + "save" + string(saveSlot) + ".tsf")
	
	var targetRoom = file_text_read_real(f)
	global.SAVED_X = file_text_read_real(f)
	global.SAVED_Y = file_text_read_real(f)
	var deaths = file_text_read_real(f)
	
	file_text_close(f)
	
	var gameManager = instance_create_layer(0, 0, "Instances_Tech", obj_gameManager)
	gameManager.DEATHS = deaths
	
	room_goto(targetRoom)
}

function scr_hasSavedGame(saveSlot) {
	return file_exists(working_directory + "save" + string(saveSlot) + ".tsf")
}
