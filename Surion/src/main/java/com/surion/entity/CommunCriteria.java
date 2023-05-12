package com.surion.entity;

import lombok.Data;

@Data
public class CommunCriteria {
	private int currentPage;
	private int endValue;
	private String keyword;
	
	public CommunCriteria() {
		this.currentPage = 1;
		this.endValue = 8;
	}
	
	public int getStartValue() {
		return (currentPage - 1) * endValue;
	}
}
