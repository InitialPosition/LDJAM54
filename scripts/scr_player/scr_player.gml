function scr_playerInit() {
	leftPressed = false
	rightPressed = false
	jumpPressed = false
	jumpHeld = false
	downPressed = false
	actionPressed = false
	
	canDoubleJump = false
	onGround = false
	jumpBufferLength = 5
	jumpBuffer = 0
	
	currentCamBox = noone
	
	springJump = false
	
	okToDestroy = false
	
	system = part_system_create()
	
	emit = part_emitter_create(system)
	part_emitter_region(system, emit, x, x + 12, y + 12, y + 12, ps_shape_rectangle, ps_distr_linear)
	
	dustPart = particles_dust()
	
	with (obj_layerObject) {
		instance_deactivate_object(self)
	}
	
	// this frames movement vectors
	xx = 0
	yy = 0
	
	if !instance_exists(obj_camera) {
		playerCam = instance_create_layer(0, 0, "Instances_Tech", obj_camera)
	} else {
		playerCam = instance_find(obj_camera, 0)
	}
	
	obj_switchManager.layer_active[0] = true
	obj_switchManager.layer_active[1] = true
	obj_switchManager.layer_active[2] = true
	obj_switchManager.layer_active[3] = true
	
	if global.SAVED_LAYER_0 != "none" {
		obj_switchManager.layer_names[0] = global.SAVED_LAYER_0
	}
	if global.SAVED_LAYER_1 != "none" {
		obj_switchManager.layer_names[1] = global.SAVED_LAYER_1
	}
	if global.SAVED_LAYER_2 != "none" {
		obj_switchManager.layer_names[2] = global.SAVED_LAYER_2
	}
	
	// if respawning, go to correct position
	if global.SAVED_X != -999 {
		x = global.SAVED_X
		y = global.SAVED_Y
	} else {
		global.SAVED_X = x
		global.SAVED_Y = y
	}
}

function scr_playerUpdate() {
	scr_playerGetInput()
	scr_playerApplyGravity()
	scr_playerSetMovementVectors()
	scr_playerHandleInteractions()
	scr_playerHandleCollision()
	scr_playerApplyMovement()
}

function scr_playerGetInput() {
	leftPressed = keyboard_check(global.CONTROLS_LEFT)
	rightPressed = keyboard_check(global.CONTROLS_RIGHT)
	jumpPressed = keyboard_check_pressed(global.CONTROLS_JUMP)
	jumpHeld = keyboard_check(global.CONTROLS_JUMP)
	downPressed = keyboard_check(global.CONTROLS_DOWN)
	actionPressed = keyboard_check_pressed(global.CONTROLS_ACTION)
}

function scr_playerSetMovementVectors() {
	if leftPressed && !rightPressed {
		if xx > -obj_gameManager.PLAYER_MAX_WALK_SPEED {
			if xx > -obj_gameManager.PLAYER_MAX_WALK_SPEED + obj_gameManager.PLAYER_ACCELERATION {
				xx -= obj_gameManager.PLAYER_ACCELERATION
			} else {
				xx = -obj_gameManager.PLAYER_MAX_WALK_SPEED
			}
		}
	}
	if rightPressed && !leftPressed {
		if xx < obj_gameManager.PLAYER_MAX_WALK_SPEED {
			if xx < obj_gameManager.PLAYER_MAX_WALK_SPEED - obj_gameManager.PLAYER_ACCELERATION {
				xx += obj_gameManager.PLAYER_ACCELERATION
			} else {
				xx = obj_gameManager.PLAYER_MAX_WALK_SPEED
			}
		}
	}
	
	if (!leftPressed && !rightPressed) || (leftPressed && rightPressed) {
		xx /= obj_gameManager.PLAYER_GROUND_FRICTION
	}
	
	// jumping
	if jumpPressed {
		if !place_empty(x, y + 1, obj_oneWayWall) {
			if downPressed {
				
				if yy <= 0 {
					with (obj_oneWayWall) {
						instance_deactivate_object(wall)
					}
					y += 1
				} else {
					part_emitter_region(system, emit, x, x + sprite_width, y + sprite_height, y + sprite_height, ps_shape_rectangle, ps_distr_linear)
					part_emitter_burst(system, emit, dustPart, 5)
			
					yy = -obj_gameManager.PLAYER_DOUBLE_JUMP_FORCE
					canDoubleJump = false
			
					audio_play_sound(snd_player_djump, 1, 0)
				}
				exit
			}
		}
		if onGround || jumpBuffer > 0 {
			onGround = false
			jumpBuffer = 0
			
			yy = -obj_gameManager.PLAYER_JUMP_FORCE
			
			audio_play_sound(snd_player_jump, 1, 0)
		}
		
		else if place_meeting(x, y, obj_jumpOrb) && instance_nearest(x, y, obj_jumpOrb).active {
			var activatedOrb = instance_nearest(x, y, obj_jumpOrb)
			
			if activatedOrb.active {			
				with (activatedOrb) {
					alarm[1] = reactivateTimer
					active = false
					image_index = 1
				}
				
				jumpBuffer = 0
				canDoubleJump = true
				yy = -obj_gameManager.PLAYER_JUMP_FORCE
				
				audio_play_sound(snd_player_jump, 1, 0)
			}
		}
		else if canDoubleJump {
			part_emitter_region(system, emit, x, x + sprite_width, y + sprite_height, y + sprite_height, ps_shape_rectangle, ps_distr_linear)
			part_emitter_burst(system, emit, dustPart, 5)
			
			yy = -obj_gameManager.PLAYER_DOUBLE_JUMP_FORCE
			canDoubleJump = false
			
			audio_play_sound(snd_player_djump, 1, 0)
		}
	} 
	if !jumpHeld {
		if yy < 0 && !springJump {
			yy /= obj_gameManager.PLAYER_JUMP_MODIFIER
		}
	}
	
	// terminal velocity
	if yy > obj_gameManager.PLAYER_TERMINAL_VELOCITY {
		yy = obj_gameManager.PLAYER_TERMINAL_VELOCITY
	}
}

function scr_playerHandleInteractions() {
	if actionPressed {
		// interact with buttons
		if !place_empty(x, y, obj_switch) {
			var activatedSwitch = instance_nearest(x + (sprite_width / 2), y + (sprite_height / 2), obj_switch)
			
			// only activate if switch wasnt activated yet
			if activatedSwitch.image_index == 0 {
				scr_interactOpenDoor(activatedSwitch.switchIndex)
				
				audio_play_sound(snd_env_switch, 10, 0)
				
				with (activatedSwitch) {
					image_index = 1
				}
			}
		}
	}
}

function scr_playerApplyGravity() {
	// update onGround
	if place_empty(x, y + 1, obj_wall) {
		onGround = false
		
		if jumpBuffer > 0 {
			jumpBuffer--
		}
	} else {
		onGround = true
		
		canDoubleJump = true
		
		jumpBuffer = jumpBufferLength
		
		if place_empty(x, y, obj_spring) {
			springJump = false
		} else {
			jumpBuffer = 0
		}
	}
	
	// if not on ground, apply gravity
	if onGround {
		currentGravity = 0
	} else {
		currentGravity = obj_gameManager.GRAVITY_FORCE
	}
	
	yy += currentGravity
}

function scr_playerHandleCollision() {
	if !place_empty(x + xx, y, obj_wall) {
		if xx > 0 {
			move_contact_solid(0, abs(xx))
		} else {
			move_contact_solid(180, abs(xx))
		}
		
		xx = 0
	}
	if !place_empty(x, y + yy, obj_wall) {
		if yy > 0 {			
			y = round(y)
			
			move_contact_solid(270, abs(yy))
			
			part_emitter_region(system, emit, x, x + sprite_width, y + sprite_height, y + sprite_height, ps_shape_rectangle, ps_distr_linear)
			part_emitter_burst(system, emit, dustPart, 2)
		} else {
			move_contact_solid(90, abs(yy))
		}
		
		yy = 0
	}
}

function scr_playerApplyMovement() {
	x += xx
	y += yy
	
	// out of bounds check
	if x > room_width + 100 || x < -100 || y > room_height + 100 || y < -100 {
		scr_playerKill()
	}
}

function scr_playerUnstuck() {
    if !place_empty(x + xx, y + yy, obj_wall) {
		// Y optimization
		yy = 0;
		move_outside_solid(90, 0)
		
		// apply x movement like nothing happened
		x += xx		
	}
}

// this is in the player scripts because the player holds a reference to his camera
function scr_camera_updateCameraBoundingBox(box) {
	
	if box != currentCamBox {
		currentCamBox = box
		
		with (obj_bullet) {
			instance_destroy()
		}
		
		// make sure save points have updated properly
		with (obj_savePoint) {
			scr_savePointSetCorrectStatus()
		}
		
		with (playerCam) {
			instance_deactivate_layer("Instances")
			instance_deactivate_layer("Instances_Back")
			
			boxXL = box.x + (global.SCREEN_WIDTH / 2);
			boxXR = (box.x + (box.image_xscale * 16)) - (global.SCREEN_WIDTH / 2);
			boxYL = box.y + (global.SCREEN_HEIGHT / 2);
			boxYR = (box.y + (box.image_yscale * 16)) - (global.SCREEN_HEIGHT / 2);
			
			instance_activate_region(box.x - 16, box.y - 16, box.image_xscale * 16 + 16, box.image_yscale * 16 + 16, true)
		}
		
		// make sure doors are in the correct state
		with (obj_door) {
			if active {
				instance_deactivate_object(self)
			}
		}
	}
}

function scr_playerSaveInLevel() {
	if !other.active {
		
		with (obj_savePoint) {
			active = false
			sprite_index = spr_savepoint_inactive
		}
		
		with (other) {
			active = true
			sprite_index = spr_savepoint_active
		}
		
		global.SAVED_X = other.x + 1
		global.SAVED_Y = other.y + 8
		
		global.SAVED_LAYER_0 = obj_switchManager.layer_names[0]
		global.SAVED_LAYER_1 = obj_switchManager.layer_names[1]
		global.SAVED_LAYER_2 = obj_switchManager.layer_names[2]
		
		audio_play_sound(snd_env_save, 1, 0)
	}
}

function scr_playerKill() {
	if !okToDestroy {
		//audio_stop_all()
		
		instance_create_layer(x, y, "Instances_Front", obj_deathRespawn)
		
		with (obj_shooter_r) {
			alarm[0] = -1
			alarm[1] = -1
		}
		
		with (obj_shooter_r_layer) {
			alarm[0] = -1
			alarm[1] = -1
		}
		
		with (obj_shooter_l) {
			alarm[0] = -1
			alarm[1] = -1
		}
		
		with (obj_shooter_l_layer) {
			alarm[0] = -1
			alarm[1] = -1
		}
		
		with (obj_bullet) {
			instance_destroy()
		}
		
		audio_play_sound(snd_player_death, 1, 0)
		
		part_system_destroy(system)

		instance_destroy()
	}
}
