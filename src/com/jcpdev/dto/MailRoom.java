package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class MailRoom {
	private String room_no; // 방 번호
	private String img; // 상대방 이미지
	private String name; // 상대방 이름
	private String id; // 상대방 아이디
	private int product_no;
	private String product_name;
}
