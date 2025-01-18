#macro g global
#macro o other

g.gfc = 0;

g.food = 0;

g.greentext = 0;
g.redtext = 0;

g.tollprice = 50;

g.vol = 0.75;
audio_master_gain(g.vol);

audio_play_sound(mus_game, 1, true, 0.75);

randomize();