package com.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.dao.ImageDAO;
import com.travel.domain.ImageDTO;

@Service
public class ImageService {

	@Autowired
	private ImageDAO dao;
	
	//내용등록 서비스단
	public void imageUpload(ImageDTO dto) {
		dao.imageUpload(dto);
	}
	
}
