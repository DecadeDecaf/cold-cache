var _wind = g.wind_pickup;

x += snow_xv;
x += _wind;
y += snow_yv;

if (ofc < 20) {
	image_alpha += 0.05;
	image_xscale += 0.025;
	image_yscale += 0.025;
} else if (ofc > lifespan) {
	image_alpha -= 0.05;
	image_xscale -= 0.025;
	image_yscale -= 0.025;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}