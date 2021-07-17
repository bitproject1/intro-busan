package com.bitc.intro.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	// 아마도 이건 hotspot을 위한 criteria 라서 restaurant에서는 다른 criteria 객체 사용해야할 듯
	
	// 페이징기능 필드
	private int pageNum; // 페이지 번호
	private int amount; // 페이지당 글 개수
	
	// 검색기능 필드
	private String searchType; // 검색조건
	private String keyword; // 검색어
	
	
	public Criteria() { // 첫페이지 설정 
		// 최초 게시판에 진입할 때를 위한 기본값 설정
		this.pageNum = 1;
		this.amount = 9;
		// 최초 페이지 진입시에는 검색하지 않았으니까 null 값
		this.searchType=null;
		this.keyword=null;
	}
	
	public void setPageNum(int pageNum) {
		if(pageNum <= 0) { // 0페이지는 없으니까 setter 메서드에서 조건문으로 방지
			this.pageNum = 1;
			return;
		}
		this.pageNum = pageNum;
	}
	
	public void setAmount(int amount) {
		if(amount <=0 || amount > 100) { // 최대 페이징 수 설정
			this.amount = 10;
			return;
		}
		this.amount = amount;
	}
	// limit 구문에서 시작 위치 설정 -> page가 1페이지일때 초기값은 0이 되어야한다. mybatis 조회쿼리의 pageStart로 전달! 
	public int getPageStart() {
		return (this.pageNum -1) * amount;
	}
	
	
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
													.queryParam("pageNum", pageNum)
													.queryParam("amount", this.amount);
		
		if(searchType!=null) { // searchType을 정해줬을때 쿼리와 
			uriComponentsBuilder
				.queryParam("searchType", this.searchType)
				.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}// 검색 기능 작업중
	
	
	
}