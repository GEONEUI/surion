package com.surion.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;

public interface ChatRoomService {
	public List<ChatRoom> findRoom(String memberId);
	public int createRoom(String opponentId, HttpSession session);
	 public String roomDetail(Model model, @PathVariable String roomId);
	 public List<Message> roomInfo(@PathVariable String roomId);
}
