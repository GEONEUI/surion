package com.surion.repository;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.surion.dto.ChatRoom;
import com.surion.dto.Message;

@Mapper
public interface ChatRoomRepository {
	
	@Insert("insert into suri_message(message, send_time, room_id, member_id) values(#{message}, now(), #{room_id}, #{member_id})")
	public void insertMessage(Message message);
	
	@Insert("insert into suri_chatroom(room_id, member_id) values(#{room_id}, #{member_id})")
	public void saveChatRoom(@Param("room_id")String roomId, @Param("member_id")String memberId);
	
	@Select("select * from suri_chatroom where #{member_id}")
	public List<ChatRoom> findAllRooms(@Param("member_id") String memberId);
	
	@Select("select * from suri_chatroom where room_id=#{room_id}")
	public ChatRoom findRoomById(@Param("room_id") String roomId);
	
	

}
