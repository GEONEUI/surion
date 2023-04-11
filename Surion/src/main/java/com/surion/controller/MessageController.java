package com.surion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surion.dto.Message;
import com.surion.repository.ChatRoomRepository;

import lombok.extern.log4j.Log4j2;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
public class MessageController{
	
	private ChatRoomRepository chatRoomRepository;
	
	@Autowired
	public MessageController(ChatRoomRepository chatRoomRepository) {
		this.chatRoomRepository = chatRoomRepository;
	}
	  

    
    @PostMapping("/insertChat")
	public @ResponseBody int insertMessage(Message message) {
		chatRoomRepository.insertMessage(message);
		return message.id;
	}     
	
}