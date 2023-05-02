package com.surion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surion.domain.chat.Message;
import com.surion.service.MessageService;


@Controller
public class MessageController{
	
	private final MessageService messageService;
	
	@Autowired
	public MessageController(MessageService messageService) {
		this.messageService = messageService;
	}
	
	@MessageMapping("/chat/message")
	public void message(Message message) {
		messageService.message(message);
	}
    
    @PostMapping("/insertChat")
	public @ResponseBody int insertMessage(Message message) {
    	return messageService.insertMessage(message);
	}     


    
    
}