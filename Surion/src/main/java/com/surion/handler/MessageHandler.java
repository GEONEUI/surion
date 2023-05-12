package com.surion.handler;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.RestController;

import com.surion.domain.chat.Message;

@RestController
public class MessageHandler {
	@MessageMapping("/hello")
	@SendTo("/topic/roomId")
	public Message broadcasting(Message message) throws Exception{
		System.out.println("message : " + message.getMessage());
		return message;
		
	}

}
