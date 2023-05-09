package com.surion.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderForm {
	
	private int idx;
	
	private String id;

    private String shopName;

    private String intro;
    
    private String img;

    private String startTime;
  
    private String endTime;

    private String experience;
    
    private String category;
	
    private String office;
    
    private String mechanic_id;
    
    private int readCount;
    

    
}
