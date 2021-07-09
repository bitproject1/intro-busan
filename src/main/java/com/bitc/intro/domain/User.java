package com.bitc.intro.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	
	private int userid;
	private String password;
	private String name;
	private String email;
	private String age;
	private String gender;
	private String auth;
}
