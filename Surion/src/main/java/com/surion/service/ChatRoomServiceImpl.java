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
import com.surion.entity.MemberChatRoomMessageJoin;
import com.surion.entity.MessageAndSendTime;
import com.surion.entity.OrderFormRepairOfferJoin;
import com.surion.entity.OrderRoomMemberJoin;
import com.surion.repository.ChatRoomRepository;
import com.surion.repository.MemberRepository;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	
	private final ChatRoomRepository chatRoomRepository;
	private final MemberRepository memberRepository;
	
	@Autowired
	public ChatRoomServiceImpl(ChatRoomRepository chatRoomRepository, MemberRepository memberRepository) {
		this.chatRoomRepository = chatRoomRepository;
		this.memberRepository = memberRepository;
	}

	@Override
	public List<MemberChatRoomMessageJoin> findRoom(String member_id) {
		return chatRoomRepository.findAllRooms(member_id);
	}

	@Override
	public int createRoom(String opponentId, HttpSession session) {
		int res = 0;
		Member member = (Member)session.getAttribute("member");
		String myId = member.getId();
    	String roomId = UUID.randomUUID().toString();
//    	res += chatRoomRepository.createChatRoom(
//    			ChatRoom.builder().room_id(roomId).member_id(opponentId).build());
		res += chatRoomRepository.createChatRoom(
				ChatRoom.builder().room_id(roomId).member_id(myId).othermem_id(opponentId).build());
		return res;
	}

	@Override
	public String roomDetail(Model model, String roomId, HttpSession session) {
		 	model.addAttribute("room_id", roomId);
	        List<Message> message = chatRoomRepository.findRoomById(roomId);
	        List<String> memberInRoom = chatRoomRepository.findMemberByRoomId(roomId);
	        Member sessionMem = (Member)session.getAttribute("member");
	        
	        for(String member : memberInRoom) {//채팅창 상대방 정보 가져오기 위한 상대방 아이디 찾기
	        	if(!member.equals(sessionMem.getId())) {
	        		OrderRoomMemberJoin list = chatRoomRepository.findOrderJoinByIds(member, sessionMem.getId());
	        		model.addAttribute("joinList", list);
	        		OrderRoomMemberJoin otherState = chatRoomRepository.findOrderJoinByIds(sessionMem.getId(), member);
	        		model.addAttribute("otherState", otherState.getState());
	        	}
	        }
	        
	        model.addAttribute("message", message);
	        
	        return "/mypage/chatRoom";
	}

	@Override
	public List<Message> roomInfo(String roomId) {
		return chatRoomRepository.findRoomById(roomId);
	}

	@Override
	public MessageAndSendTime findLatestMessage(String roomId) {
		
		return chatRoomRepository.findMessageByRoomId(roomId);
	}

	@Override
	public String stateUpdate(ChatRoom chatRoom, Model model) {
		chatRoomRepository.stateUpdate(chatRoom);
		String otherState = chatRoomRepository.checkState(chatRoom);
		if(otherState.equals("completed")) {
			return "completed";
		}
		return "onGoing";
	}


}
