package com.jcpdev.controller.action;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActionForward {
	public boolean isRedirect = false;
	String url;
}
