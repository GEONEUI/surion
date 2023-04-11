package com.surion.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoomJoin {
	
	@JsonProperty("member_id")
	public String memberId;
	@JsonProperty("room_id")
	public int roomId;
}
