/*
for (var _floor_i = 0; _floor_i < 5; _floor_i++) {
	var _floor_w = 1920;
	draw_sprite(spr_snowfloor, 0, _floor_w * _floor_i, 0);
}
*/

draw_sprite(spr_snowfloor, 0, 0, 0);

var _black = #10121C;
var _white = #FFFFFF;
var _green = #9DE64E;
var _red = #FA6E79;

var _fade_alph = ((g.fade_wait > 0 || g.game_over) ? 1 : 0);

if (g.fade_out > 0) {
	_fade_alph = (1 - (g.fade_out / 40));
}

if (g.fade_in > 0) {
	_fade_alph = (g.fade_in / 40);
}

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_alpha(_fade_alph);
draw_set_color(_black);
draw_rectangle(0, 0, 1920, 1080, false);

if (g.phase == 4) {
	draw_set_font(fnt_font_small);
	draw_set_color(_white);
	var _over_str = "YOU WIN!";
	_over_str += "\n\n";
	_over_str += "TIME SPENT: " + time_string(g.timer);
	_over_str += "\n";
	_over_str += "NUMBER OF DEATHS: " + string(g.deaths);
	_over_str += "\n";
	_over_str += "FOOD LOST TO GAMBLING: " + string(g.loss);
	_over_str += "\n\n";
	_over_str += "COLD CACHE WAS MADE IN LESS THAN 72 HOURS FOR MINI JAM 176: FOXES"
	_over_str += "\n\n";
	_over_str += "THANK YOU SO MUCH FOR PLAYING!"
	
	draw_text_ext_transformed(150, 336, _over_str, 40, 900, 1, 1, 0);
}

draw_set_alpha(1);

draw_set_font(fnt_font);

var _str = string(g.food);

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

if (!audio_is_playing(mus_game) && !g.desktop) {
	draw_set_alpha(0.75);
	draw_set_color(_black);
	draw_rectangle(0, 0, 1920, 1080, false);
	draw_set_alpha(1);
	draw_set_color(_white);
	draw_set_halign(fa_center);
	draw_text_transformed(960, 320, "PLEASE CLICK INSIDE THE GAME WINDOW", 1, 1, 0);
}

draw_set_alpha(1);