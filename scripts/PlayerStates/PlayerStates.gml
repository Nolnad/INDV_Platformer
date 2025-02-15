function PlayerCollision() {
	
	if(place_meeting(x+hspd,y,oCollis))
	{
		while(!place_meeting(x+sign(hspd),y,oCollis))
		{
			x+= sign(hspd);
		}
		hspd = 0
	}
	x += hspd
	
	if(place_meeting(x,y+vspd,oCollis))
	{
		while(!place_meeting(x,y+sign(vspd),oCollis))
		{
			y += sign(vspd);
		}
		vspd = 0
	}
	y += vspd
}

function PlayerFree() {
	
	switch state_step {
	case 0: 
		state_step = 1
	break;
	
	case 1:
		inputdir = key_right-key_left;
		
		if hspd != 0
		image_xscale = sign(hspd);
		
		if inputdir != 0
			image_xscale = sign(inputdir);
			
		if mouse_x-x != 0
			image_xscale = sign(mouse_x-x);
	break;
	
	case 2:
	
	break;
	}
}

function PlayerDead() {
	
	switch state_step {
	case 0: 
		jump_mod = 0
		inputdir = 0;
		player_sprite = sPlayerDead
		state_step = 1
	break;
	
	case 1:
	
	break;
	
	case 2:
	
	break;
	}
}