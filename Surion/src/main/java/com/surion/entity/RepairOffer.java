package com.surion.entity;

import lombok.Data;

@Data
public class RepairOffer {
	private int idx;
	private String mechanic_id;
	private String member_id;
	private String estimate;
}
