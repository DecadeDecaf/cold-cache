draw_self();

draw_set_font(fnt_font_small);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _str = (g.phase == 3 ? "YOU CAN SEE YOUR REFLECTION ON THE COIN'S SURFACE" : "DOUBLE OR NOTHING");

if (coin_cooldown > 0) {
	_str = "";
	if (coin_cooldown < 100) {
		if (image_index == 0) { _str = "FOOD DOUBLED!"; }
		if (image_index == 6) { _str = "BETTER LUCK NEXT TIME"; }
	}
}

var _y = (y - 520);
var _dropshadow_dis = 1.5;

var _black = #10121C;
var _white = #FFFFFF;

draw_set_color(_black);
draw_text_ext_transformed(x - _dropshadow_dis, _y + _dropshadow_dis, _str, 32, 360, 1, 1, 0);

draw_set_color(_white);
draw_text_ext_transformed(x, _y, _str, 32, 360, 1, 1, 0);