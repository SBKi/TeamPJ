package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MailDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Mail;
import com.jcpdev.dto.Product;

public class MakeMailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ActionForward foward = new ActionForward();
		HttpSession session = request.getSession();
		MailDao mdao = MailDao.getInstance();
		ProductDao pdao = ProductDao.getInstance();

		int pno = Integer.parseInt(request.getParameter("pno"));
		Product pVo = pdao.getOne(pno);
		String id = (String) session.getAttribute("user_id");
		String room = pno + id;

		int check = mdao.RoomCheck(room);
		if (check == 0) { 
			Mail mVo = new Mail(0, room, "채팅방이 생성되었습니다!!", id, pVo.getProduct_seller(), pno,1, null);
			mdao.insert(mVo);

			foward.isRedirect = true;
			foward.url = "mail.do";
			return foward;
		} else {	//이미 메일함에 방이 만들어 져있음
			foward.isRedirect = true;
			foward.url = "mail.do";
			return foward;

		}

	}

}