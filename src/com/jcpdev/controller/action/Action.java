package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//인터페이스의 메소드는 추상메소드
	public ActionForward execute
	(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException;
}