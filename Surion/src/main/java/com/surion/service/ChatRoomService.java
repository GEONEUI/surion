package com.surion.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.entity.MemberChatRoomMessageJoin;
import com.surion.entity.MessageAndSendTime;

public interface ChatRoomService {
	public List<MemberChatRoomMessageJoin> findRoom(String memberId);
	public int createRoom(String opponentId, HttpSession session);
	 public String roomDetail(Model model, @PathVariable String roomId, HttpSession session);
	 public List<Message> roomInfo(@PathVariable String roomId);
	 public MessageAndSendTime findLatestMessage(String roomId);
	public String stateUpdate(ChatRoom chatRoom, Model model);
}
