package com.surion.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.surion.dto.Message;

@Mapper
public interface ChatRoomRepository {
	@Insert("insert into suri_message(message, send_time, room_id, member_id) values(#{message}, now(), #{room_id}, #{member_id})")
	public void insertMessage(Message message);
}
