x += snow_xv;
y += snow_yv;

snow_xv /= 1.15;
snow_yv /= 1.15;

if (ofc < 10) {
	image_alpha += 0.1;
	image_xscale += 0.05;
	image_yscale += 0.05;
} else if (ofc > lifespan) {
	image_alpha -= 0.1;
	image_xscale -= 0.05;
	image_yscale -= 0.05;
	if (image_alpha <= 0) {
		instance_destroy()
	}
}