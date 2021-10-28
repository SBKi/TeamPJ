package com.jcpdev.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Declaration {
	private int declration_no;
	private String declration_id;
	private int declration_product_no;
	private String declration_comment;
}
