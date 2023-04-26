package com.surion.entity;

import lombok.Data;


@Data

public class OrderListPaging {
	private int startNum; // 아래 시작 페이지 번호
	private int endNum; // 아래 끝 페이지 번호
	private int disPageNum; // 아래 몇개씩 뿌릴건지
	private int perPageNum; // 게시글 몇개 뿌릴 건지
	private int totalCount; // 총 게시글
	private int startValue; // 쿼리문에서 LIMIT 처음꺼
	private int currentPage; // 현재 보는 페이지
	private int realPage; // 마지막 페이지로 만들어주기
	private boolean prev; // 이전 버튼
	private boolean next; // 다음 버튼
	
	public OrderListPaging() {
		this.disPageNum = 10;
		this.perPageNum = 12;
	}
	
}
