package com.surion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.surion.entity.Community;
import com.surion.repository.CommRepository;

@Service
public class CommServiceImpl implements CommService{

	
	@Autowired
	private CommRepository commRepository;
	
	@Override
	public List<Community> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void register(Community community) {
		//게시글 작성하는 기능
		commRepository.save(community);
	}

	@Override
	public Community get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}



}
