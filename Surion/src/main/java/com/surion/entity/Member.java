package com.surion.entity;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String grade;
	private String imgurl;
}


