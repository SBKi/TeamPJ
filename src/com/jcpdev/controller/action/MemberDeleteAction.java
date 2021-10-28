package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ActionForward foward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("user_id");
		String pwd = request.getParameter("password");
		
		Member dto = new Member();
		dto.setMember_id(id);
		dto.setMember_password(pwd);

		if (MemberDao.getInstance().update_member_status(dto) != 0) { // 회원 탈퇴 완료
			session.invalidate();
			foward.isRedirect = true;
			foward.url = "index.do";
			return foward;
		} else {
			request.setAttribute("message", "회원 탈퇴 실패");
			request.setAttribute("url", "mypage.do");
			foward.isRedirect = false;
			foward.url = "error/alert.jsp";
			return foward;
		}
	}
}