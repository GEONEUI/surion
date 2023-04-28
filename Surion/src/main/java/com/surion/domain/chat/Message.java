package com.surion.domain.chat;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Message {
	public enum MessageType{
		ENTER, TALK
	}
	private MessageType type;
	private int id;
	private String message;
	private String send_time;
	private String room_id;
	private String member_id;
}
