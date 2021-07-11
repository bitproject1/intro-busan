package com.bitc.intro.domain;

import lombok.Data;

@Data
public class Review {
	private int id;
	private Grade grade;
	private String content;
	private int userId; // FK
}

