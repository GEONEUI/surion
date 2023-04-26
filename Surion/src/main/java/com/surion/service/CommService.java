package com.surion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surion.entity.Community;


public interface CommService {
	//글 목록
	public List<Community> listAll();
	//글 작성
	public void register(Community community);
	//검색
	public Community get(String id);
	//삭제
	public void delete(String id);

}
