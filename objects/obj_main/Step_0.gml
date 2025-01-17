if (g.gfc % 20 == 0) {
	var _flake_x = random_range(0, 1920);
	var _flake_y = random_range(-48, 240);
	if (instance_exists(obj_camera)) {
		_flake_x += (obj_camera.x - 960);
	}
	var _depth = depth + 101;
	instance_create_depth(_flake_x, _flake_y, _depth, obj_snowflake);
}