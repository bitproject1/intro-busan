package com.bitc.intro.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.User;
import com.bitc.intro.mapper.UserMapper;

import lombok.Setter;

@Repository
public class UserRepository {

	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	public void insert(User user) {
		userMapper.insert(user);
	}
}
