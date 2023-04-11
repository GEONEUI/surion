package com.surion.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Message {
	public int id;
	public String message;
	public String send_time;
	public int room_id;
	public String member_id;
}
