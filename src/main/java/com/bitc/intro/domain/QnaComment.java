package com.bitc.intro.domain;

import lombok.Data;

@Data
public class QnaComment {
	private int id;
	private String content;
	private int qnaId; // FK
	private int managerId; // FK
}
