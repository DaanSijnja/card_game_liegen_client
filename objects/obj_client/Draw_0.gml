/// @description Insert description here

for(var i = 0; i < 10; i += 0.5)
{
	draw_set_alpha(i/10)
	draw_circle(circle_center_x,circle_center_y,circle_radius-i,true)
	
}
/*
for(var i = 10; i > 0; i -= 0.5)
{
	draw_set_alpha(i/10)
	draw_circle(circle_center_x,circle_center_y,(circle_radius-10)-i,true)
	
}
*/
draw_set_alpha(1)

draw_text(50,40,total_players)


with(obj_player){
	var sub = 0
	if(global.gamestate == playerready)
	{
		sub = 1
	}
	if(global.gamestate == ownturn)
	{
		sub = 2
	}

	draw_sprite(spr_ready_box,sub,x,y)

	if(global.gamestate == waitingtoplay or global.gamestate == playerready)
	draw_sprite(spr_player_arrow,0,x,y - 68)

	draw_self()
	
}

with(obj_otherplayer){
	var sub = 0
	if(otherplayerready == true)
	{
		sub = 1
	}
	if(hasturn == true){
		sub = 2
	}
	draw_sprite(spr_ready_box,sub,x,y)


	draw_self()
	
	
	
}
