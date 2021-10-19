package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_tel;
	private String member_email;
	private String member_img1;
	private String member_address;

}
