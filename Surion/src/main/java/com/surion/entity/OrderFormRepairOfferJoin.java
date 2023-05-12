package com.surion.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderFormRepairOfferJoin {
	private int idx;
	private String imgurl;
	private String startTime;
	private String endTime;
	private String office;
	private String intro;
	private String estimate;
	private String mechanic_id;
	private String member_id;
	private String shopName;
}
