package com.bitc.intro.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private int age;
	private String gender;
	private String auth;
}
