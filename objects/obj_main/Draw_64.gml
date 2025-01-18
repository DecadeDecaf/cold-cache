/*
for (var _floor_i = 0; _floor_i < 5; _floor_i++) {
	var _floor_w = 1920;
	draw_sprite(spr_snowfloor, 0, _floor_w * _floor_i, 0);
}
*/

draw_sprite(spr_snowfloor, 0, 0, 0);

draw_set_font(fnt_font);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var _str = string(g.food);

var _black = #10121C;
var _white = #FFFFFF;
var _green = #9DE64E;
var _red = #FA6E79;

gpu_set_fog(true, _black, 1, 1);
draw_sprite_ext(spr_berries, 0, 126, 970, 0.8, 0.8, 0, -1, 1);
gpu_set_fog(false, _black, 0, 0);
draw_sprite_ext(spr_berries, 0, 128, 968, 0.8, 0.8, 0, -1, 1);

draw_set_color(_black);
draw_text_transformed(198, 986, _str, 1, 1, 0);

draw_set_color(_white);
draw_text_transformed(200, 984, _str, 1, 1, 0);

if (g.greentext > 0) {
	draw_set_color(_green);
	var _alph = clamp(g.greentext / 10, 0, 1);
	draw_set_alpha(_alph);
	draw_text_transformed(200, 984, _str, 1, 1, 0);
} else if (g.redtext > 0) {
	draw_set_color(_red);
	var _alph = clamp(g.redtext / 10, 0, 1);
	draw_set_alpha(_alph);
	draw_text_transformed(200, 984, _str, 1, 1, 0);
}

draw_set_alpha(1);