#macro g global
#macro o other

g.gfc = 0;

g.food = 0;

g.greentext = 0;
g.redtext = 0;

g.tollprice = 50;

g.phase = 1;
g.wind_pickup = 0;

g.fade_out = 0;
g.fade_wait = 0;
g.fade_in = 0;

g.game_over = false;
g.timer = 0;
g.deaths = 0;
g.loss = 0;

g.desktop = (os_browser == browser_not_a_browser);
g.one_button = true;

g.ref_dis = 1280;
g.max_dis = 640;

window_set_size(1920, 1080);
display_reset(8, true);

exception_unhandled_handler(error);
draw_set_circle_precision(64);

g.vol = 0.75;
audio_master_gain(g.vol);

audio_play_sound(mus_game, 1, true, 0.75);

randomize();