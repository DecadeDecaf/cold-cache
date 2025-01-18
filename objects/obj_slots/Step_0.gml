if (slot_cooldown > 0) {
	slot_cooldown--;
	if (slot_cooldown == 150) {
		var _winnings = calc_winnings();
		g.food += _winnings;
		if (_winnings > 0) {
			g.greentext = 10;
		}
	}
}