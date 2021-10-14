package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MailDao;
import com.jcpdev.dto.Mail;

public class MailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		ActionForward foward = new ActionForward();
		String page = request.getParameter("page");
		if (page.equals("list")) {
			foward.isRedirect = true;
			foward.url = "maillist.do";
		} else {
			foward.isRedirect = false;
			foward.url = "detail.do";
		}
		MailDao dao = MailDao.getInstance();
		int mail_no = Integer.parseInt(request.getParameter("mail_no"));
		String content = request.getParameter("mail_content");
		String sendid = (String) session.getAttribute("user_id");
		String postid = request.getParameter("mail_postid");
		int mail_p_no = Integer.parseInt(request.getParameter("mail_product_no"));
		dao.insert(new Mail(mail_no, content, sendid, postid, mail_p_no, null));

		foward.url = "";
		return foward;
	}

}
