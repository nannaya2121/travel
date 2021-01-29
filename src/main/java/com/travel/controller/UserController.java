package com.travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.travel.domain.UserDTO;
import com.travel.service.UserService;

@Controller
@RequestMapping(value = "/user/*")
public class UserController {
	
	@Autowired(required = false)
	UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;

	
	@GetMapping(value = "/regist")
	public void getUserRegist() {
		
	}
	
	//회원가입 로직
	@PostMapping(value = "/registProcess")
	public String postUserRegist(UserDTO dto){
		
		//패스워드 암호화
		//디비에 암호화된 비밀번호가 들어가기 때문에 로그인시에는 문제가 발생함
		//따라서 로그인시 매퍼를 바꿔줘야함. 원래 로그인 매퍼는 <select id="userLogin">였음.
		//바뀐 로그인 매퍼는 <select id="userLoginEncrypt">임.
		String prePassword = dto.getPassword();
		String encode = passEncoder.encode(prePassword);
		dto.setPassword(encode);
		
		
		//기본 회원가입(패스워드 암호화x)
		userService.userRegist(dto);
		return "redirect:/";
	}
	
	@GetMapping(value = "/login")
	public void getLogin() {
		
	}
	
	//로그인 로직. 암호화 전
	//HttpServletRequest은 로그인시 권한을 부여해줌.
	//RedirectAttributes은 로그인 실패시 되돌려주는 역할.
//	@PostMapping(value = "/loginProcess")
//	public String postUserLogin(UserDTO dto, HttpServletRequest req, RedirectAttributes rttr) {
//		
//		HttpSession session = null;
//		session = req.getSession();
//		
//		UserDTO login = userService.userLogin(dto);
//		
//		if(login == null) {
//			session.setAttribute("user", null);
//			//로그인 정보가 null값이라면 경고. 이 값은 다른 페이지로 이동하거나 새로고침하면 없어지는 일회용값.
//			rttr.addFlashAttribute("warn", false);
//			
//			return "redirect:/user/login";
//			
//		} else {
//			session.setAttribute("user", login);
//		}
//		
//		return "redirect:/user/login";
//	}
	
	//로그인 로직. 암호화 후
	@PostMapping(value = "/loginProcess")
	public String postUserLogin(UserDTO dto, HttpServletRequest req, RedirectAttributes rttr) {
		
		HttpSession session = null;
		session = req.getSession();
		
		UserDTO login = userService.userLoginEncrypt(dto);
		
		//로그인 매퍼에 아이디값만 들어가 있기에 비밀번호 일치 여부를 여기서 판단해줌.
		boolean passMatch = passEncoder.matches(dto.getPassword(), login.getPassword());
		
		//login 값이 들어있고 boolean passMatch값이 true면 로그인 성공
		if(login != null && passMatch) {
			session.setAttribute("user", login);
			return "redirect:/";
		}else {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("warn", false);
		}
		
		return "redirect:/user/login";
	}
	
	//아이디 중복 확인 Controller 단 (Ajax가 필요함.)
	@ResponseBody
	@PostMapping(value = "idDuplicate")
	public int postIdDuplicate(HttpServletRequest req) {
		String email = req.getParameter("email");
		UserDTO idDuplicate = userService.idDuplicate(email);
		
		int result = 0;
		
		if(idDuplicate != null) {
			result = 1;
		}
		
		return result;
	}
	
	//로그아웃
	@GetMapping(value = "/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
