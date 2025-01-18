var _fox = instance_nearest(x, y, obj_fox);

if (ofc % 15 == 0) {
	with (_fox) {
		if (point_distance(x, y, o.x, o.y) < 128) {
			if (o.berries > 0) {
				o.berries--;
				g.food++;
				g.greentext = 5;
				var _pitch = random_range(0.9, 1.1);
				audio_play_sound_at(snd_berry, -o.x, 800, 0, 1280, 640, 1, false, 1, 0.8, 0, _pitch);
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