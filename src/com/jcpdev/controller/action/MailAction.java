package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MailDao;
import com.jcpdev.dao.MemberDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Mail;
import com.jcpdev.dto.MailRoom;
import com.jcpdev.dto.Member;
import com.jcpdev.dto.Product;

public class MailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		MemberDao mdao = MemberDao.getInstance();
		ProductDao pdao = ProductDao.getInstance();
		MailDao dao = MailDao.getInstance();
		ActionForward foward = new ActionForward();
		String id = (String) session.getAttribute("user_id");
		List<Mail> list = null;
		list = dao.getRoomList(id);

		List<MailRoom> roomlist = new ArrayList<MailRoom>();
		for (Mail mail : list) {
			MailRoom room = new MailRoom();
			Product pvo = new Product();
			if (id.equals(mail.getMail_postid())) { // 내가 받는사람일때
				room.setId(mail.getMail_sendid());
			} else {
				room.setId(mail.getMail_postid());
			}
			pvo = pdao.getOne(mail.getMail_product_no());
			Member temp = mdao.getInfo(room.getId());
			room.setImg(temp.getMember_img1());
			room.setName(temp.getMember_name());
			room.setRoom_no(mail.getMail_room());
			room.setProduct_name(pvo.getProduct_name());
			room.setProduct_no(mail.getMail_product_no());
			roomlist.add(room);
		}

		request.setAttribute("list", roomlist);

		foward.isRedirect = false;
		foward.url = "/view/mail.jsp";
		return foward;
	}

}