package com.surion.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RepairForm {
	private int idx;
	private String member_id;
	private String choice1;
	private String choice2;
	private String deliveryType;
	private String data;
	private String image;
	private String title;
	private String content;
	private String estimate; 
	private String itemcategory_id;
}
