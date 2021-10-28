package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NavCnt {
	private int product;
	private int buy;
	private int sell;
	private int like;
	private int mail;
}