package com.surion.repository;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.websocket.server.PathParam;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.surion.domain.chat.ChatRoom;
import com.surion.domain.chat.Message;

@Mapper
public interface ChatRoomRepository {
	
	@Insert("insert into suri_message(message, send_time, room_id, member_id) values(#{message}, #{send_time}, #{room_id}, #{member_id})")
	public void insertMessage(Message message);
	
	@Insert("insert into suri_chatroom(room_id, member_id) values(#{room_id}, #{member_id})")
	public int createChatRoom(ChatRoom chatRoom);
	
	@Select("select * from suri_chatroom where member_id=#{member_id}")
	public List<ChatRoom> findAllRooms(@Param("member_id") String memberId);
	
	@Select("select * from suri_message where room_id=#{room_id}")
	public List<Message> findRoomById(String roomId);
	
	@Select("select member_id from suri_chatroom where room_id=#{room_id}")
	public List<String> findMemberByRoomId(String roomId);
	
	

}
