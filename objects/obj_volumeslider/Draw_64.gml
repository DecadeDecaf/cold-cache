draw_set_color(#FFFFFF);

draw_set_alpha(0.75);
draw_rectangle(1500, 990, 1850, 1010, true);

draw_set_alpha(0.25);
draw_rectangle(1502, 992, 1502 + 346, 1008, false);

draw_set_alpha(0.75);
draw_rectangle(1502, 992, 1502 + (346 * g.vol), 1008, false);

draw_set_color(#FFFFFF);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_font(fnt_font_small);
draw_set_alpha(1);

draw_set_color(#10121C);
draw_text_transformed(1674, 986, "VOLUME: " + string(round(g.vol * 100)) + "%", 1, 1, 0);
draw_set_color(#FFFFFF);
draw_text_transformed(1675, 985, "VOLUME: " + string(round(g.vol * 100)) + "%", 1, 1, 0);