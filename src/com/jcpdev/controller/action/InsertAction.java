package com.jcpdev.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class InsertAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, java.io.IOException {

		// 테이블 insert
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		String member_name = request.getParameter("member_name");
		String member_tel = request.getParameter("member_tel");
		String member_email = request.getParameter("member_email");
		String member_address = request.getParameter("member_address");
		String member_img = "person.png";

		Member dto = new Member();
		dto.setMember_id(member_id);
		dto.setMember_name(member_name);
		dto.setMember_password(member_password);
		dto.setMember_tel(member_tel);
		dto.setMember_email(member_email);
		dto.setMember_address(member_address);
		dto.setMember_img1(member_img);
		MemberDao dao = MemberDao.getInstance();
		dao.insert(dto);

		if (session.getAttribute("readIdx") == null) {
			StringBuilder readIdx = new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}

		// 2) db 테이블 select 쿼리 실행
		Member user_login = dto;
		if (user_login != null) {
			session.setAttribute("user_id", user_login.getMember_id());
			session.setAttribute("user_name", user_login.getMember_name());
			session.setAttribute("user_img", user_login.getMember_img1());
		}
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url = "login_complete.do";
		return foward;
	};
}