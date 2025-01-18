if (g.greentext > 0) { g.greentext -= 0.25; }
if (g.redtext > 0) { g.redtext -= 0.25; }

if (g.game_over) {
	exit
}

if (g.fade_out > 0) {
	g.fade_out--;
	if (g.fade_out <= 0) {
		if (g.phase == 4) {
			g.game_over = true;
			exit
		}
		g.fade_wait = 60;
		instance_destroy(obj_cloud);
		instance_destroy(obj_snowball);
	}
} else if (g.fade_wait > 0) {
	g.fade_wait--;
	if (g.fade_wait <= 0) {
		g.fade_in = 60;
	}
} else if (g.fade_in > 0) {
	g.fade_in--;
}

var _flake_rate = (g.phase == 1 ? 20 : 8);

if (g.gfc % _flake_rate == 0) {
	var _flake_x = random_range(0, 1920);
	var _flake_y = random_range(-48, 240);
	if (instance_exists(obj_camera)) {
		_flake_x += (obj_camera.x - 960);
	}
	var _depth = depth + 101;
	instance_create_depth(_flake_x, _flake_y, _depth, obj_snowflake);
}

if (g.gfc % 200 == 0 && instance_number(obj_bug) < 2) {
	var _padding = 192;
	var _bug_x = random_range(_padding, room_width - _padding);
	var _bug_y = 800;
	var _depth = depth + 10;
	instance_create_depth(_bug_x, _bug_y, _depth, obj_bug);
}

if (g.gfc % 200 == 0 && instance_number(obj_bunny) < 1) {
	var _padding = 192;
	var _bun_x = random_range(_padding, room_width - _padding);
	var _bun_y = 800;
	var _depth = depth + 10;
	instance_create_depth(_bun_x, _bun_y, _depth, obj_bunny);
}

if (g.phase > 1 && g.wind_pickup < 7) {
	g.wind_pickup += 0.05;
}