package com.surion.entity;

import lombok.Data;

@Data
public class Criteria {
	private int currentPage;
	private int endValue;
	
	
	public Criteria() {
		this.currentPage = 1;
		this.endValue = 12;
	}
	
	public int getStartValue() {
		return (currentPage - 1) * endValue;
	}
}
