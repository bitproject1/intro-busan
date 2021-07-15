package com.bitc.intro.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;

@Mapper
public interface UserMapper {
	int insert(User user);
	int getCountById(String username);
	User getUserById(String username);
	List<User> getUsers();
	int deleteById(String username);
	void updateUserById(User user);
	List<Restaurant> getLoveList(User user);
}
