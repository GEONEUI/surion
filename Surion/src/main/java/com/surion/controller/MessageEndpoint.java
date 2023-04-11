package com.surion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.surion.dto.Message;
import com.surion.repository.ChatRoomRepository;

import lombok.extern.log4j.Log4j2;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@ServerEndpoint("/chat")
public class MessageEndpoint{
	
	
    private static final List<Session> session = new ArrayList<>();
  

    @OnOpen
    public void open(Session newUser) {
    	System.out.println("연결");
    	session.add(newUser);
        System.out.println(newUser.getId());
        }

    @OnMessage
    public void getMsg(Session recieveSession, String msg) throws IOException {
        for (int i = 0; i < session.size(); i++) {
                session.get(i).getBasicRemote().sendText(msg);
           
        }
    }
    
  
}