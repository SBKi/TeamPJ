package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class MypageUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MemberDao dao = MemberDao.getInstance();

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("id");
		String member_name = request.getParameter("name");
		String member_password = request.getParameter("password");
		String member_tel = request.getParameter("tel");
		String member_email = request.getParameter("email");
		String member_address = request.getParameter("address");
		String member_img1 = request.getParameter("img1");
		
		if (member_img1.equals("")) {
			member_img1 = dao.getInfo(member_id).getMember_img1();
		}
		System.out.println(member_img1);

		if (session.getAttribute("readIdx") == null) {
			StringBuilder readIdx = new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		Member dto = new Member();
		dto.setMember_id(member_id);
		dto.setMember_password(member_password);
		dto.setMember_name(member_name);
		dto.setMember_tel(member_tel);
		dto.setMember_email(member_email);
		dto.setMember_address(member_address);
		dto.setMember_img1(member_img1);
		dao.update_myprofile(dto);

		session.setAttribute("user_img", dto.getMember_img1());
		session.setAttribute("user_name", dto.getMember_name());

		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "mypage.do";
		return foward;
	}

}