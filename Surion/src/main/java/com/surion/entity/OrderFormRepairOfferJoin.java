package com.surion.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderFormRepairOfferJoin {
	private String startTime;
	private String endTime;
	private String office;
	private String intro;
	private String estimate;
	private String mechanic_id;
	private String member_id;
	private String shopName;
}
