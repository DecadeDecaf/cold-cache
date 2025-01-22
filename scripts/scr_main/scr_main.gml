function handle_fullscreen() {
	var _f = keyboard_check_pressed(ord("F"));
	if (_f && g.desktop) { switch_fullscreen(); }
}

function switch_fullscreen() {
	var full = !window_get_fullscreen();
	set_fullscreen(full);
}

function set_fullscreen(full) {
	window_set_fullscreen(full);
	if (!full) {
		window_set_size(1280, 720);
	} else {
		window_set_size(1920, 1080);
	}
	display_reset(8, true);
}

function error(struct) {
	show_debug_message("ERROR: " + string(struct));
}

function gamepad_check() {
	for (var _i = gp_face1; _i < gp_axisrv; _i++ ) {
	    if (gamepad_button_check(0, _i)) { return _i; }
	}
	return false;
}

function gamepad_check_pressed() {
	for (var _i = gp_face1; _i < gp_axisrv; _i++ ) {
	    if (gamepad_button_check_pressed(0, _i)) { return _i; }
	}
	return false;
}