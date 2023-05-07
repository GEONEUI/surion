package com.surion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.surion.entity.Community;
import com.surion.entity.Popular;
import com.surion.repository.MainRepository;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainRepository mainRepository;
	
	@Override
	public void findPopular(Popular popular, Model model) {
		List<Popular> popularList = mainRepository.findPopular(popular);
		popularList.stream().forEach(key-> {
			if(key.getCategory().equals("자전거")) {
				key.setCategoryImg("bicycle.png");
				key.setUrl("/repair/repairList?type=1");
			}else if(key.getCategory().equals("오토바이")) {
				key.setCategoryImg("motorcycle.png");
				key.setUrl("/repair/repairList?type=2");
			}else if(key.getCategory().equals("에어컨")) {
				key.setCategoryImg("air.png");
				key.setUrl("/repair/repairList?type=3");
			}else if(key.getCategory().equals("보일러")) {
				key.setCategoryImg("boiler.png");
				key.setUrl("/repair/repairList?type=4");
			}else if(key.getCategory().equals("컴퓨터")) {
				key.setCategoryImg("computer.png");
				key.setUrl("/repair/repairList?type=5");
			}else if(key.getCategory().equals("음향")) {
				key.setCategoryImg("music.jpg");
				key.setUrl("/repair/repairList?type=6");
			}
		});
		
		
		List<Community> lst = mainRepository.findBoardAll();
		model.addAttribute("communityList", lst);
		model.addAttribute("popularList", popularList);
	}

}
