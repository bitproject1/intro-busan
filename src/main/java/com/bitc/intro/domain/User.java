package com.bitc.intro.domain;

import lombok.Data;

@Data
public class User {
	private int id;
	private String password;
	private String username;
	private String email;
	private int age;
	private String gender;
	private String auth;
}
