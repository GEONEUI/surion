package com.surion.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.surion.entity.ChatInfo;
import com.surion.entity.Member;
import com.surion.entity.SocketClient;
import com.surion.entity.SocketServer;

@Controller
@RequestMapping("/multiChat/*")
public class MyChatController {
	
	@RequestMapping("/room")
	public String room() {
		return "/mypage/chatRoom";
	}
	
	
	
	@GetMapping("/sender")
	public void sender(ChatInfo chatInfo, HttpSession session) {
		Member member = (Member) session.getAttribute("member");

		SocketClient socketClient = new SocketClient();
		socketClient.client(member.getId(), chatInfo.getMessage());
	}
	
	
}
