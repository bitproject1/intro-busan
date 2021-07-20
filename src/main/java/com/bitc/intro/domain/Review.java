package com.bitc.intro.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int id;
	private Grade grade;
	private String content;
	private int userId; // FK
	
	private int rId; //레스토랑 id 
	private Date regdate;//등록일자
	private String title;//제목
}

