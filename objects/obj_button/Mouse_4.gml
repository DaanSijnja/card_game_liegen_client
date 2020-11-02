/// @description When the button is pressed

if(active == false){
	exit;
}

image_index = 1;
alarm[0] = 20

switch(button_action){
	
	case buttondefault:
	
	
	break;
	
	case buttonjoin:
		with(obj_client){
			client = network_create_socket(network_socket_tcp);
			connected = network_connect(client,"192.168.178.74",64198)

			client_buffer = buffer_create(1024,buffer_fixed,1)
		
		}
	break;
	
	case buttonready:
	{	
		if(global.gamestate != notconnected){
			
			if(global.gamestate != playerready){
				buffer_seek(obj_client.client_buffer,buffer_seek_start,0)
				buffer_write(obj_client.client_buffer,buffer_u8,ready)
				network_send_packet(obj_client.client,obj_client.client_buffer,buffer_tell(obj_client.client_buffer))
			}
			else
			{
				buffer_seek(obj_client.client_buffer,buffer_seek_start,0)
				buffer_write(obj_client.client_buffer,buffer_u8,unready)
				network_send_packet(obj_client.client,obj_client.client_buffer,buffer_tell(obj_client.client_buffer))
			}
			
		}
	
	}
	break;
	
	case "place":
	
	
	
	break;
	
	case "accuse":
	
	
	
	break;
	
	
	
}

