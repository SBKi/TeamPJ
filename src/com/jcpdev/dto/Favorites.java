package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Favorites {
	private int favorites_no;
	private int favorites_product_no;
	private String favorites_member_id;

}