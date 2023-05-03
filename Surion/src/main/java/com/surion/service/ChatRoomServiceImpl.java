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
import com.surion.entity.OrderFormRepairOfferJoin;
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
				ChatRoom.builder().room_id(roomId).member_id(myId).mechanic_id(opponentId).build());
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
	        		OrderFormRepairOfferJoin offerJoin = new OrderFormRepairOfferJoin();
	        		offerJoin.setMember_id(sessionMem.getId());
	        		offerJoin.setMechanic_id(member);
	        		List<OrderFormRepairOfferJoin> list = chatRoomRepository.findOrderJoinByIds(offerJoin);
	        		model.addAttribute("joinList", list);
	        	}
	        }
	        
	        model.addAttribute("message", message);
	        
	        return "/mypage/chatRoom";
	}

	@Override
	public List<Message> roomInfo(String roomId) {
		return chatRoomRepository.findRoomById(roomId);
	}


}
