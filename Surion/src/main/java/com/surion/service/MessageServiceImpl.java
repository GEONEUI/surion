package com.surion.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.repository.ChatRoomRepository;

@Service
public class MessageServiceImpl implements MessageService{

	private final ChatRoomRepository chatRoomRepository;
	private final SimpMessagingTemplate template;
		
	public MessageServiceImpl(ChatRoomRepository chatRoomRepository, SimpMessagingTemplate template) {
		this.chatRoomRepository = chatRoomRepository;
		this.template = template;
	}

	@Override
	public void message(Message message) {
		if(Message.MessageType.ENTER.equals(message.getType()))
			message.setMessage(message.getMember_id() + "님이 입장");
		template.convertAndSend("/sub/chat/room/" + message.getRoom_id(), message);
	}

	@Override
	public int insertMessage(Message message) {
		chatRoomRepository.insertMessage(message);
		return message.getId();
	}



}
