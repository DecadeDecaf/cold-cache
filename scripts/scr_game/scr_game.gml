function double_or_nothing() {
	if (image_index == 0) { g.food *= 2; g.greentext = 10; audio_play_sound_at(snd_slots_win, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1, 1, 0.25); }
	if (image_index == 6) { g.loss += g.food; g.food = 0; g.redtext = 10; audio_play_sound_at(snd_slots_lose, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1, 1, 0.25); }
}

function calc_winnings() {
	var _worms = 0;
	var _berries = 0;
	var _caterpillars = 0;
	var _eggs = 0;
	var _sevens = 0;
	
	for (var _slot = 1; _slot < 4; _slot++) {
		var _slot_val = 0;
		switch (_slot) {
			case 1:
				_slot_val = slot_left; break;
			case 2:
				_slot_val = slot_middle; break;
			case 3:
				_slot_val = slot_right; break;
			default:
				break;
		}
		switch (_slot_val) {
			case 1:
				_worms++; break;
			case 2:
				_berries++; break;
			case 3:
				_caterpillars++; break;
			case 4:
				_eggs++; break;
			case 5:
				_sevens++; break;
			default:
				break;
		}
	}
	
	var _winning = 0;
	if (_worms == 2) { _winning = 4; }
	if (_berries == 2) { _winning = 8; }
	if (_caterpillars == 2) { _winning = 12; }
	if (_eggs == 2) { _winning = 16; }
	if (_sevens == 2) { _winning = 20; }
	if (_worms == 3) { _winning = 8; }
	if (_berries == 3) { _winning = 16; }
	if (_caterpillars == 3) { _winning = 24; }
	if (_eggs == 3) { _winning = 32; }
	if (_sevens == 3) { _winning = 50; }
	
	print(slot_left);
	print(slot_middle);
	print(slot_right);
	
	print("worms: " + string(_worms));
	print("berries: " + string(_berries));
	print("caterpillars: " + string(_caterpillars));
	print("eggs: " + string(_eggs));
	print("sevens: " + string(_sevens));
	
	return _winning;
}

function splat(_amt, _yoff) {
	repeat (_amt) {
		var _xrand = random_range(-6, 6);
		var _yrand = random_range(-4, 4);
		instance_create_depth(x + _xrand, y - _yoff + _yrand, depth - 1, obj_particle);
	}
}

function time_string(_time) {
	var _secs = floor(_time / 60);
	var _mins = 0;
	while (_secs >= 60) {
		_mins++;
		_secs -= 60;
	}
	var _sec_string = string(_secs);
	if (string_length(_secs) == 1) {
		_sec_string = "0" + _sec_string;
	}
	return string(_mins) + ":" + _sec_string;
}