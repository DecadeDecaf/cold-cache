if (coin_cooldown > 0) {
	coin_cooldown--;
	if (coin_cooldown == 100) {
		double_or_nothing();
	}
}

if (flips_left > 0) {
	until_flip--;
	if (until_flip <= 0) {
		image_index++;
		image_index = (image_index % 12);
		flips_left--;
		until_flip = flip_speed;
	}
	if (flips_left < 24) { flip_speed = 3; }
	if (flips_left < 12) { flip_speed = 4; }
	if (flips_left < 6) { flip_speed = 6; }
}