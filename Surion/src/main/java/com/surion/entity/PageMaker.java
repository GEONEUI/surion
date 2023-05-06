package com.surion.entity;

import lombok.Data;

@Data
public class PageMaker {
	private Criteria Cri;
	private int disPageNum = 10;
	private int Count;
	private int startPage;
	private int endPage;
	private int realEndPage;
	private boolean prev;
	private boolean next;
	
	
	
	public void setTotalCount(int totalCount) {
		this.Count = totalCount;
		pageStart();
	}
	
	public void pageStart() {
		endPage = (int) (Math.ceil(Cri.getCurrentPage() / (double)disPageNum) * disPageNum);
		startPage = (endPage - disPageNum) + 1;
		realEndPage = (int) Math.ceil(Count / (double)Cri.getEndValue());
		if(realEndPage < endPage) {
			endPage = realEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = realEndPage > endPage ? true : false; 
		
		System.out.println("Count  ----- > " + Count);
		System.out.println("endPage  ----- > " + endPage);
		System.out.println("startPage  ----- > " + startPage);
		System.out.println("realEndPage  ----- > " + realEndPage);
		System.out.println("prev  ----- > " + prev);
		System.out.println("next  ----- > " + next);
		
		
	}
}
