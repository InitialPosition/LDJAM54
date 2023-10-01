function particles_mainMenu_snow_FG() {
	part = part_type_create()
	part_type_alpha1(part, 1)
	part_type_color1(part, c_white)
	part_type_shape(part, pt_shape_square)
	part_type_size(part, 0.02, 0.03, 0, 0)
	part_type_speed(part, 1, 2, 0, 0)
	part_type_direction(part, 180, 190, 0, 5)
	part_type_life(part, 500, 500)
	
	return part
}

function particles_mainMenu_snow_BG() {
	part = part_type_create()
	part_type_alpha1(part, 1)
	part_type_color1(part, c_grey)
	part_type_shape(part, pt_shape_square)
	part_type_size(part, 0.01, 0.02, 0, 0)
	part_type_speed(part, 0.3, 0.6, 0, 0)
	part_type_direction(part, 180, 190, 0, 0)
	part_type_life(part, 2000, 2000)
	
	return part
}

function particles_saveActive() {
	part = part_type_create()
	part_type_blend(part, false)
	part_type_alpha1(part, 1)
	part_type_color1(part, $6ABE30)
	part_type_shape(part, pt_shape_square)
	part_type_size(part, 0.04, 0.04, 0, 0)
	part_type_speed(part, 0.3, 0.6, 0, 0)
	part_type_direction(part, 90, 90, 0, 10)
	part_type_life(part, 10, 50)
	
	return part
}

function particles_dust() {
	part = part_type_create()
	part_type_blend(part, false)
	part_type_alpha1(part, 1)
	part_type_color1(part, $ECECEC)
	part_type_shape(part, pt_shape_square)
	part_type_size(part, 0.01, 0.01, 0, 0)
	part_type_speed(part, 0.1, 0.2, 0, 0)
	part_type_direction(part, 0, 180, 0, 10)
	part_type_life(part, 10, 30)
	
	return part
}

function particles_bullet() {
	part = part_type_create()
	part_type_blend(part, false)
	part_type_alpha1(part, 1)
	part_type_color1(part, $6357D9)
	part_type_shape(part, pt_shape_square)
	part_type_size(part, 0.01, 0.01, 0, 0)
	part_type_speed(part, 0, 0, 0, 0)
	part_type_life(part, 10, 30)
	
	return part
}

function particles_jumpOrb() {
	part = part_type_create()
	part_type_blend(part, false)
	part_type_alpha1(part, 1)
	part_type_color1(part, $FFFFFF)
	part_type_shape(part, pt_shape_square)
	part_type_size(part, 0.04, 0.04, 0, 0)
	part_type_speed(part, 0.3, 0.6, 0, 0)
	part_type_direction(part, 0, 360, 5, 0)
	part_type_life(part, 10, 30)
	
	return part
}