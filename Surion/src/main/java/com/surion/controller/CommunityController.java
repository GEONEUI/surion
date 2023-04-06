package com.surion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	@RequestMapping("/board")
	public String board() {
		return "/community/community";
	}
}
