package com.travel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.UserDTO;

@Repository
public class UserDAO {
	
	//@Inject 대신 @Autowired를 실험. 
	//@Autowired의 속성인 required = false로 지정해놓으면 에러처리를 제외
	//실험결과 : 성공적~!!!!!
	@Autowired(required = false)
	private SqlSession sql;
	
	private static String namespace = "com.travel.mappers.user";
	
	//회원가입 dao단
	public void userRegist(UserDTO dto){
		sql.insert(namespace + ".userRegist", dto);
	}
	
	//로그인 dao단. 암호화 하기 전.
//	public UserDTO userLogin(UserDTO dto) {
//		return sql.selectOne(namespace + ".userLogin", dto);
//	}
	
	//로그인 dao단. 암호화 후.
	public UserDTO userLoginEncrypt(UserDTO dto) {
		return sql.selectOne(namespace + ".userLoginEncrypt", dto);
	}
	
	//아이디 중복확인
	public UserDTO idDuplicate(String dto) {
		return sql.selectOne(namespace + ".idDuplicate", dto);
	}
}
