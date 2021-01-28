package com.travel.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {

	private int u_no;
	private String email;
	private String password;
	private Date reg_date;
	
}
