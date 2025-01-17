if (slot_cooldown > 0) {
	slot_cooldown--;
	if (slot_cooldown == 150) {
		g.food += calc_winnings();
	}
}