package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.User;

@Mapper
public interface UserMapper {
	int insert(User user);
	int getCountById(int id);
	User getUserById(String username);
	List<User> getUsers();
	int deleteById(int id);
	void updateUserById(User user);
}
