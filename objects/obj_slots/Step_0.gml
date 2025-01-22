if (slot_cooldown > 0) {
	slot_cooldown--;
	if (slot_cooldown == 150) {
		var _winnings = calc_winnings();
		g.food += _winnings;
		if (_winnings > 0) {
			g.greentext = 10;
			audio_play_sound_at(snd_slots_win, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
		} else {
			audio_play_sound_at(snd_slots_lose, -x, 800, 0, g.ref_dis, g.max_dis, 1, false, 1);
		}
	}
}