if state == ENEMY_STATES.dying {
	
	if place_meeting(x+dir,y,oCollis) {
		dir = -dir
		hspd = dir*spd
	}	
	
	sprite_index = sEnemyDead
	
	var on_ground = place_meeting(x,y+1,oCollis);
	if on_ground {
		state = ENEMY_STATES.dead
	}
}

if state == ENEMY_STATES.alive {
	hspd = dir*spd
	
	if place_meeting(x+dir,y,oCollis) {
		dir = -dir
	}	
	
	if hp <= 0 {
		vspd -= 4
		state = ENEMY_STATES.dying 
	}
}

if state == ENEMY_STATES.dead {
	hspd = approach(hspd,0,0.3);
	if place_meeting(x+dir,y,oCollis) {
		dir = -dir
		hspd = dir*spd
	}	
}

vspd += grv

image_xscale = dir

PlayerCollision()