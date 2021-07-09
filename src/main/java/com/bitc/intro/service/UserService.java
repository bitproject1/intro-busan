package com.bitc.intro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.intro.domain.User;
import com.bitc.intro.repository.UserRepository;

import lombok.Setter;

@Service
public class UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserRepository userRepository;
	
	public void ResisterUser(User user) {
		userRepository.insert(user);
	}
}
