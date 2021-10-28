package com.jcpdev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mail {
	private int mail_no;
	private String mail_room;
	private String mail_content;
	private String mail_sendid;
	private String mail_postid;
	private int mail_product_no;
	private int mail_status;
	private Timestamp mail_date;
}