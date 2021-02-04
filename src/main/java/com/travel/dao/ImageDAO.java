package com.travel.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.ImageDTO;

@Repository
public class ImageDAO {

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.travel.mappers.image";
	
	//내용등록 dao단
	public void imageUpload(ImageDTO dto) {
		sql.insert(namespace + ".imageRegist", dto);
	}
	
	
}
