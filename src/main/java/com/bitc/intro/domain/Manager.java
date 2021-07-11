package com.bitc.intro.domain;

import lombok.Data;

@Data
public class Manager {
	private int id;
	private String name;
	private String password;
	private String email;
	private String gender;
	private String auth;
}
