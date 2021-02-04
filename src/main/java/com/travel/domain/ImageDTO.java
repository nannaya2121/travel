package com.travel.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ImageDTO {

	private int c_no;
	private String email;
	private String title;
	private String pic_content;
	private String text_content;
	private Date reg_date;
}
