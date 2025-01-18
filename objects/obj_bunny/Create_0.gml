if (g.game_over) {
	exit
}

ofc = 0;

image_alpha = 0;

var _fox = instance_nearest(x, y, obj_fox);

with (_fox) {
	o.image_xscale = (o.x >= x ? 1 : -1);
}

xv = 0;
yv = 0;

jump_cooldown = 0;