/// @description Insert description here
//visablity check
if(active == true){
	visible = true
}
else
{
	visible = false;
}

//special button states
if(global.gamestate == playerready){
	if(button_action == buttonready)	
	{
		image_index = 2	
	}
}