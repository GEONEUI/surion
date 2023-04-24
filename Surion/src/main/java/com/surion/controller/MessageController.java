package com.surion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surion.dto.Message;
import com.surion.entity.Member;
import com.surion.repository.ChatRoomRepository;

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
	
	private ChatRoomRepository chatRoomRepository;
	private final SimpMessagingTemplate template; // 특정 broker로 메세지 전달
	
	@Autowired
	public MessageController(ChatRoomRepository chatRoomRepository, SimpMessagingTemplate template) {
		this.chatRoomRepository = chatRoomRepository;
		this.template = template;
	}
	
	@MessageMapping("/chat/message")
	public void message(Message message) {
		if(Message.MessageType.ENTER.equals(message.getType()))
			message.setMessage(message.getMember_id() + "님이 입장");
		template.convertAndSend("/sub/chat/room/" + message.getRoom_id(), message);
	}
    
    @PostMapping("/insertChat")
	public @ResponseBody int insertMessage(Message message) {
		chatRoomRepository.insertMessage(message);
		return message.getId();
	}     
	
    @PostMapping("/test")
    public String test(HttpServletRequest httpServletRequest, Model model, HttpSession httpSession) {
    	//고수 아이디, 내 아이디 받아서 채팅방으로 매칭
    	String roomId = UUID.randomUUID().toString();
    	String gosuId = httpServletRequest.getParameter("id");
    	String memberId = "";
    	Member m = (Member)httpSession.getAttribute("member");
    	memberId = m.getId();
    	chatRoomRepository.saveChatRoom(roomId, memberId);
    	chatRoomRepository.saveChatRoom(roomId, gosuId);
    	
    	model.addAttribute("pageview", 2);	
		return "/mypage/mypage";
    }
    
    @GetMapping("/test2")
    public @ResponseBody String test2() {
    	return "채팅시발꺼";
    }
    
    
}