package com.jcpdev.controller.action;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ActionForward {
	boolean isRedirect = false;
	String url;
	

}
