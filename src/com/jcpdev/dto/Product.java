package com.jcpdev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int  product_no;
	private int product_category;
	private String product_name;
	private String product_content;
	private int product_price;
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private String product_seller;
	private String product_buyer;
	private boolean product_like;
	private Timestamp product_date;
	private int  product_readcount;
}
