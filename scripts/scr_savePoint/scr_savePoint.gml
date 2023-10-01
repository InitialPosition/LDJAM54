function scr_savePointSetCorrectStatus() {
	active = false
	sprite_index = spr_savepoint_inactive
	
	// if this is the saved savepoint, activate
	if global.SAVED_X - 2 == x && global.SAVED_Y - 16 == y {		
		active = true
		sprite_index = spr_savepoint_active
	}
}