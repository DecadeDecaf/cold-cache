var _fox = instance_nearest(x, y, obj_fox);

if (ofc % 15 == 0) {
	with (_fox) {
		if (point_distance(x, y, o.x, o.y) < 128) {
			if (o.berries > 0) {
				o.berries--;
				g.food++;
				g.greentext = 5;
			}
		} else {
			if (ofc % 90 == 0) {
				if (o.berries < o.max_berries) {
					o.berries++;
				}
			}
		}
	}
}