if (egg_cooldown > 0) {
	egg_cooldown--;
	if (egg_cooldown <= 0) {
		splat(4, 56);
	}
} else if (golden) {
	if (g.gfc % 15 == 0) {
		var _shine_x = (x - 4 + random_range(-32, 32));
		var _shine_y = (y - 56 + random_range(-24, 24));
		var _depth = depth - 1;
		instance_create_depth(_shine_x, _shine_y, _depth, obj_sparkle);
	}
}