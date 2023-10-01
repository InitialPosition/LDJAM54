/// @description draw blink / door

if active {
	draw_rectangle_color(x, y, x + 16, y + 16, c_white, c_white, c_white, c_white, false)
} else {
	draw_sprite(spr_door, 0, x, y)
}
