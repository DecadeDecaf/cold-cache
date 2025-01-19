y += yv;

yv /= 1.1;

if (ofc > lifespan) {
	image_alpha -= 0.025;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}