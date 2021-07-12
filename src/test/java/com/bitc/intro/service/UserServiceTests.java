package com.bitc.intro.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

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
//			user.setId(1);
			user.setUsername("테스트맨3");
			user.setPassword("1234");
			user.setEmail("aa@a.com");
			user.setAge(25);
			user.setGender("1");
			user.setAuth("0");
			
			userService.resister(user);
		}
}
