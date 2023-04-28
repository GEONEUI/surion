package com.surion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surion.domain.chat.Message;
import com.surion.entity.Member;
import com.surion.repository.ChatRoomRepository;
import com.surion.service.MessageService;

import lombok.extern.log4j.Log4j2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
public class MessageController{
	
	private final MessageService messageService;
	
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