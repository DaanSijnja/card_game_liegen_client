/// @description 

switch(global.gamestate){
	
	case notconnected:
	{
		with(obj_button){
			
			if(button_action == buttonjoin)	
			{
				active = true
				
			}
			else
			{
				active = false
			}
		}
	}
	break;
	
	case waitingtoplay:
	{
		with(obj_button){
			if(button_action == buttonready)	
			{
				active = true
			}
			else
			{
				active = false
			}
		}
	}
	break;
	
	case playerready:
	{
		with(obj_button){
			if(button_action == buttonready)	
			{
				active = true
			}
			else
			{
				active = false
			}
		}
		
		
	}
	break
	
	case gamestart:
	{
		with(obj_button){
			active = false;
		}
		
		
	}
	break
	
	
	
	
	
	
}