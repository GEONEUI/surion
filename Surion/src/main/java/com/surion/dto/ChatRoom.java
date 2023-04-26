package com.surion.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoom {

	private String room_id;
	private String member_id;
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	
	public static ChatRoom create(String member_id) {
		ChatRoom room = new ChatRoom();
		
		room.room_id = UUID.randomUUID().toString();
		room.member_id = member_id;
		return room;
	}



}
