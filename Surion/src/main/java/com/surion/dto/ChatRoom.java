package com.surion.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatRoom {

	public int id;
	@JsonProperty("member_id")
	public String memberId;
}
