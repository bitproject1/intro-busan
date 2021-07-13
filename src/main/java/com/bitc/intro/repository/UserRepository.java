package com.bitc.intro.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitc.intro.domain.User;
import com.bitc.intro.mapper.UserMapper;

import lombok.Setter;

@Repository
public class UserRepository {

	@Autowired
	private UserMapper userMapper;
	
	public int insert(User user) {
		return userMapper.insert(user);
	}
	
	public int getCountById(int id) {
		return userMapper.getCountById(id);
	}
	
	public User getUserById(String username) {
		return userMapper.getUserById(username);
	}
	
	public List<User> getUsers(){
		return userMapper.getUsers();
	}
	
	public int deleteById(int id) {
		return userMapper.deleteById(id);
	}
	
	public void updateUserById(User user) {
		userMapper.updateUserById(user);
	}
}
