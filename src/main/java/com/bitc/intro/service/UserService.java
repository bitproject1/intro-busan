package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.User;
import com.bitc.intro.repository.UserRepository;

import lombok.Setter;

@Service
@Transactional
public class UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserRepository userRepository;
	
	public int resister(User user) {
		return userRepository.insert(user);
	}

	public int getCountById(int id) {
		return userRepository.getCountById(id);
	}
	
	public User getUserById(String username) {
		return userRepository.getUserById(username);
	}
	
	public List<User> getUsers(){
		return userRepository.getUsers();
	}
	
	public int deleteById(int id) {
		return userRepository.deleteById(id);
	}
	
	public void updateUserById(User user) {
		userRepository.updateUserById(user);
	}
	
	
}
