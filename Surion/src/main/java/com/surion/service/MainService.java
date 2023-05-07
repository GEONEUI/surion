package com.surion.service;

import java.util.List;

import org.springframework.ui.Model;

import com.surion.entity.Community;
import com.surion.entity.Popular;

public interface MainService {
	public void findPopular(Popular popular, Model model);
}
