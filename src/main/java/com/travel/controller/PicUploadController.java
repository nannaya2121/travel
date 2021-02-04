package com.travel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.travel.domain.ImageDTO;
import com.travel.service.ImageService;


@Controller
public class PicUploadController {
	
	@Autowired
	ImageService imageService;
	
	
	@GetMapping(value = "picUpload")
	public void picUpload() {
		
	}
	
	@PostMapping(value = "picUploadProcess")
	public String postPicUploadProcess(ImageDTO dto) {
		imageService.imageUpload(dto);
		return "redirect:/";
	}

	
}
