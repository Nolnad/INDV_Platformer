if other.state == ENEMY_STATES.alive
{
	other.flash = 3;
	hp = 0;
	other.hp -= dmg;
}