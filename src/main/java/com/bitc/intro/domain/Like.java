package com.bitc.intro.domain;

import lombok.Data;

@Data
public class Like {
	private int userId; // FK
	private int restId; // FK
}
