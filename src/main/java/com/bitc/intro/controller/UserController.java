package com.bitc.intro.controller;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intro.domain.User;
import com.bitc.intro.service.UserService;
import com.bitc.intro.util.Script;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/user/*")
@Log
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// 회원가입 폼으로 이동
	@GetMapping("join")
	public String joinForm(){
		return "/user/join";
	} // get join
	
	
	// 회원가입
	@PostMapping("join")
	public String join(User user) {
		// 비밀번호 암호화 처리
		String password = user.getPassword();
		String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		user.setPassword(hashPassword);
		System.out.println(user.toString());
		// 회원가입 처리
		userService.resister(user);
		return "redirect:/user/login";
	} // post join
	
	
	// 로그인 폼으로 이동
	@GetMapping("login")
	public String loginForm() {
		return "/user/login";
	} // get login
	
	
	// 로그인
	@PostMapping("login")
	public ResponseEntity<String> login(int id, String password, HttpSession session) {
		
		User user = userService.getUserById(id);
		boolean isSamePassword = false;
		String message = "";
		
		if (user != null) { // 아이디가 존재할 경우
			// 입력된 패스워드를 데이터베이스에 저장된 암호화된 패스워드와 같은지 비교
			isSamePassword = BCrypt.checkpw(password, user.getPassword()); 

			if (!isSamePassword) { // 패스워드 불일치
				message = "패스워드가 일치하지 않습니다.";
			}
		} else { // 일치하는 아이디가 없음
			message = "존재하지 않는 아이디입니다.";
		}

		
		if (user == null || isSamePassword == false) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");

			String str = Script.back(message);

			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}

		session.setAttribute("user", user);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/");
		
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // login post
	
	
	// 로그아웃
	@GetMapping("logout")
	public ResponseEntity<String> logout(HttpSession session) {
		session.invalidate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		String str = Script.href("로그아웃 되었습니다", "/");
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	} // logout get
	
	
	// 회원 탈퇴 페이지로 이동
	@GetMapping("/remove")
	public String remove() {
		return "user/remove";
	} // remove get
	
	
	// 회원 탈퇴
	@PostMapping("/remove")
	public ResponseEntity<String> remove(String password, HttpSession session) {
		User user = (User) session.getAttribute("user");
		boolean isSamePassword = BCrypt.checkpw(password, user.getPassword());

		if (!isSamePassword) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");

			String str = Script.back("패스워드가 일치하지 않습니다.");

			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		// 회원탈퇴(삭제)처리
		userService.deleteById(user.getId());
		session.invalidate(); // 세션 초기화

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");

		String str = Script.href("회원탈퇴가 정상적으로 처리되었습니다.", "/");

		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	} // remove post
	
	
	
	
}
