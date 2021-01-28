package com.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.dao.UserDAO;
import com.travel.domain.UserDTO;

@Service
public class UserService {

	@Autowired(required = false)
	private UserDAO dao;
	
	//회원가입 서비스단
	public void userRegist(UserDTO dto){
		dao.userRegist(dto);
	}
	
	//로그인 서비스단 암호화 하기 전.
//	public UserDTO userLogin(UserDTO dto) {
//		return dao.userLogin(dto);
//	}
	
	//로그인 서비스단 암호화 하기 후.
	public UserDTO userLoginEncrypt(UserDTO dto) {
		return dao.userLoginEncrypt(dto);
	}
	
	//아이디 중복 확인 서비스단
	public UserDTO idDuplicate(String email) {
		return dao.idDuplicate(email);
	}
}
