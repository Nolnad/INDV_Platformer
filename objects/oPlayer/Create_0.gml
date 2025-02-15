accel = 0.7;
air_fric = 0.1
ground_fric = 0.5

vspd = 0;
hspd = 0;
jump_spd = -7;

coyote_t = 0

landed = false

grv = 0.3
max_hspd = 4

air_fric = 0.1


hp = 5;

jump_mod = 1
state_step = 0

key_up    = 0;
key_left  = 0;
key_down  = 0;
key_right = 0;

key_jump  = 0;
inputdir  = 0;

player_sprite = sPlayer
	
enum PLAYERSTATE {
	free,
	stun,
	dead
}

state = PLAYERSTATE.free;


states[PLAYERSTATE.free] = PlayerFree;
//states[PLAYERSTATE.stun] = PlayerStateAttack;
states[PLAYERSTATE.dead] = PlayerDead;

with instance_create_depth(x,y,depth-10,oGun) {
	owner = other.id
}