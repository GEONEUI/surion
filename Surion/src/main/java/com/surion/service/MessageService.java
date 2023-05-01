package com.surion.service;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surion.domain.chat.Message;
import com.surion.repository.ChatRoomRepository;

public interface MessageService {
	public void message(Message message);
	public @ResponseBody int insertMessage(Message message);
	
}
