package com.surion.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;
import com.surion.service.ChatRoomService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/chat/*")
public class ChatRoomController {
	

	private final ChatRoomService chatRoomService;
	
	@Autowired
    public ChatRoomController(ChatRoomService chatRoomService) {
		this.chatRoomService = chatRoomService;
	}
	// 채팅 리스트 화면
    @GetMapping("/room")
    public String rooms(Model model) {
        return "/chat/room";
    }
    // 모든 채팅방 목록 반환
    @GetMapping("/rooms")
    @ResponseBody
    public List<ChatRoom> room(String memberId) {
        return chatRoomService.findRoom(memberId);
    }
    // 채팅방 생성
    @PostMapping("/room")
    @ResponseBody
    public int createRoom(@RequestParam String name, HttpSession session) {
    	return chatRoomService.createRoom(name, session);    	
    }
    // 채팅방 입장 화면
    @GetMapping("/room/enter/{roomId}")
    public String roomDetail(Model model, @PathVariable String roomId, HttpSession session) {
       return chatRoomService.roomDetail(model, roomId, session);
    }
    // 특정 채팅방 조회
    @GetMapping("/room/{roomId}")
    @ResponseBody
    public List<Message> roomInfo(@PathVariable String roomId) {
        return chatRoomService.roomInfo(roomId);
    }
}
