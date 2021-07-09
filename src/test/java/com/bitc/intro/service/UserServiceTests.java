package com.bitc.intro.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitc.intro.domain.User;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserServiceTests {

		@Setter(onMethod_ = @Autowired)
		private UserService userService;
		
		@Test
		public void testRegister() {
			User user = new User();
			user.setUserid(1);
			user.setName("테스트맨");
			user.setPassword("1234");
			user.setEmail("aa@a.com");
			user.setAge("25");
			user.setGender("1");
			user.setAuth("0");
			
			userService.ResisterUser(user);
		}
}
