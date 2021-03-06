package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.MailDao;

public class MailDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ActionForward foward = new ActionForward();

		String room = request.getParameter("room");
		MailDao dao = MailDao.getInstance();
		
		dao.delete(room);

		foward.isRedirect = true;
		foward.url = "mail.do";
		return foward;

	}

}