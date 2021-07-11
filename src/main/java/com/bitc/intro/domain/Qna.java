package com.bitc.intro.domain;

import lombok.Data;

@Data
public class Qna {
	private int id;
	private String title;
	private String content;
	private int userId; // FK
}
