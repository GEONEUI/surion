package com.surion.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderForm {
	private String member_id;

    private String shopName;

    private String intro;

    private String img;

    private String startTime;
  
    private String endTime;

    private String experience;
    
    private String category;
	
    private String address;
    
    private String mechanic_id;
}
