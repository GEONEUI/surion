package com.surion.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderJoin {
	private int idx;
	private String member_id;
	private String mechanic_id;
	private String name;
	private String shopName;
	private String address;
	private String email;
	private String phone;
	private String grade;
}
