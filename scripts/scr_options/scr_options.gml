function scr_windowModifier_setWindowSize(width, height) {
	window_set_size(width, height);
	window_set_position(display_get_width() / 2 - (width / 2), display_get_height() / 2 - (height / 2));
}
