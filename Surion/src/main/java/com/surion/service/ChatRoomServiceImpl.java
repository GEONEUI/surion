package com.surion.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.entity.Member;
import com.surion.repository.ChatRoomRepository;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	
	private final ChatRoomRepository chatRoomRepository;
	
	@Autowired
	public ChatRoomServiceImpl(ChatRoomRepository chatRoomRepository) {
		this.chatRoomRepository = chatRoomRepository;
	}

	@Override
	public List<ChatRoom> findRoom(String memberId) {
		return chatRoomRepository.findAllRooms(memberId);
	}

	@Override
	public int createRoom(String opponentId, HttpSession session) {
		int res = 0;
		Member member = (Member)session.getAttribute("member");
    	String myId = member.getId();
    	String roomId = UUID.randomUUID().toString();
    	res += chatRoomRepository.createChatRoom(
    			ChatRoom.builder().room_id(roomId).member_id(opponentId).build());
		res += chatRoomRepository.createChatRoom(
				ChatRoom.builder().room_id(roomId).member_id(myId).build());
		return res;
	}

	@Override
	public String roomDetail(Model model, String roomId) {
		 model.addAttribute("room_id", roomId);
	        List<Message> message = chatRoomRepository.findRoomById(roomId);
	        model.addAttribute("message", message);
	        return "/mypage/chatRoom";
	}

	@Override
	public List<Message> roomInfo(String roomId) {
		return chatRoomRepository.findRoomById(roomId);
	}


}
