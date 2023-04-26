package com.surion.entity;

import lombok.Data;

@Data
public class Community {
	private int idx;
	private String id;
	private String title;
	private String content;
	private String img;
	private String loc;
	private int love;
	private int watch;
	private String suri_list;
	private String comm_list;
	private String indate;
}
