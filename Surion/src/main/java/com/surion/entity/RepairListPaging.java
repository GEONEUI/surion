package com.surion.entity;

import lombok.Data;

@Data
public class RepairListPaging {
	private int startNum; // 아래 시작 페이지 번호
	private int endNum; // 아래 끝 페이지 번호
	private int startValue; // LIMIT 처음꺼
	private int perPageNum; // LIMIT 두번째, 몇개씩 뿌릴건지
	private int currentPage; // 현재 보는 페이지
	private int disPageNum; // 아래 몇개씩 뿌릴건지
	private int totalCount; // 총 게시글
	private int lastPage; // 마지막 페이지로 만들어주기
	private boolean prev; // 이전 버튼
	private boolean next; // 다음 버튼
	private String keyword; // 검색 파라미터
	
	public RepairListPaging() {
		this.disPageNum = 10;
		this.perPageNum = 12;
	}
}
