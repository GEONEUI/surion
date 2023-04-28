package com.surion.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RepairForm {
	private int idx;
	private String member_id;
	private String choice1;
	private String choice2;
	private String deliveryType;
	private String date;
	private String image;
	private String title;
	private String content;
	private String estimate; 
	private int itemcategory_id;
	private int readCount;
}
