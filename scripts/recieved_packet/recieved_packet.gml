
function recieved_packet(buffer){
	message_id = buffer_read(buffer,buffer_u8)

switch(message_id){
		//wanneer de speler succesvol gejoind is
		case playerjoinsucces:
			show_message("joined succesfully!")
			
			var playersocket = buffer_read(buffer,buffer_u8)
			var num = buffer_read(buffer,buffer_u8)
			
			//maak de speler
			var player = instance_create_depth(room_width/4 + (num)*64, room_height -64, 0, obj_player)
			player.socket = playersocket
			player.number = num
			player.image_index = num;
			
			global.gamestate = waitingtoplay
		break;
		
		case newplayerjoined:
		
			var otherplayersocket = buffer_read(buffer,buffer_u8)
			var othernum = buffer_read(buffer,buffer_u8)
			var otherpready = buffer_read(buffer,buffer_u8)
			var otherplayer = instance_create_depth(room_width/4 + (othernum)*64, room_height -64, 0, obj_otherplayer)
			
			otherplayer.othersocket = otherplayersocket
			otherplayer.number = othernum
			otherplayer.otherplayerready = otherpready
			otherplayer.image_index = othernum;
		
		break;
		
		case playerdisconnected:
			
			var otherplayersocket = buffer_read(buffer,buffer_u8)
		
			with(obj_otherplayer){
				if(othersocket == otherplayersocket){
					instance_destroy(self)
					
				}
			}
		
		break
		
		case newnumber:
			var otherplayersocket = buffer_read(buffer,buffer_u8)
			var othernum = buffer_read(buffer,buffer_u8)
	
			if(obj_player.socket == otherplayersocket){
				obj_player.number = othernum	
				obj_player.x = (room_width/4 + (othernum)*64)
				obj_player.image_index = othernum
			}
			else
			{
				with(obj_otherplayer){
					if(otherplayersocket == othersocket)	
					{
						number = othernum;	
						x = (room_width/4 + (othernum)*64)
						image_index = othernum
					}
				}
				
			}
			
			
			
				
		break
		
		case gameshuffel:
			global.gamestate = gamestart
			
			
			
			total_players = instance_number(obj_otherplayer) + instance_number(obj_player)
			var degr = 360/total_players 
			var aa = 270 // zorgt er voor dat nul onder is, 90 aan de linker kant, 
			var radius = circle_radius
			var center_x = circle_center_x
			var center_y = circle_center_y
			
			
			with(obj_otherplayer){
				otherplayerready = false
				
				var own_degr = -degr*number + (360-(-degr * (obj_player.number)))
				x = center_x + lengthdir_x(radius,(own_degr + aa))
				y = center_y + lengthdir_y(radius,(own_degr + aa))
			}
			
			with(obj_player){
				
				var own_degr = -degr*number + (360-(-degr * (obj_player.number)))
				x = center_x + lengthdir_x(radius,own_degr + aa)
				y = center_y + lengthdir_y(radius,own_degr + aa)
			}

		break
		
		case ready:
			global.gamestate = playerready
		break	
		
		case unready:
			global.gamestate = waitingtoplay
		break	
		
		case otherready:
			var otherplayersocket = buffer_read(buffer,buffer_u8)
			
			with(obj_otherplayer){
				if(otherplayersocket == othersocket){
					otherplayerready = true	
				}
			}
		break
		
		case otherunready:
			var otherplayersocket = buffer_read(buffer,buffer_u8)
			
			with(obj_otherplayer){
				if(otherplayersocket == othersocket){
					otherplayerready = false
				}
			}
		break
		
		case playersturn:
		
			var playerhasturn = buffer_read(buffer,buffer_u8)
			
			with(obj_otherplayer)
			{
				if(playerhasturn == othersocket)	
				{
					global.gamestate = otherturn	
					hasturn = true
				}
				else
				{
					hasturn = false	
				}
			}
			
			with(obj_player)
			{
				if(playerhasturn == socket)	
				{
					global.gamestate = ownturn	
					hasturn = true
				}
				else
				{
					hasturn = false	
				}
			}
			
		
		break
		
	}

}