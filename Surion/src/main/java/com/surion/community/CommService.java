package com.surion.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommService {
	
	@Autowired
	private CommRepository commRepository;
	
	//글 목록
	public List<Community> listAll(){
		return commRepository.findAll();
	}
	
	//글 작성
	public void register(Community community) {
		commRepository.save(community);
	}
	
	//검색
	public Community get(String id) {
		return commRepository.findById(id).get();
	}
	
	//삭제
	public void delete(String id) {
		commRepository.deleteById(id);
	}

}
