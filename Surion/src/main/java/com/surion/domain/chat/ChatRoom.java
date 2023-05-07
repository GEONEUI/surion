package com.surion.domain.chat;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ChatRoom {

	private String room_id;
	private String member_id;
	private String othermem_id;
	private String state;



}
