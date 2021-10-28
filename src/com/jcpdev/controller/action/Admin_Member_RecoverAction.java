package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;

public class Admin_Member_RecoverAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();

		if (session.getAttribute("user_id") == null) {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

		String id = (String) session.getAttribute("user_id");
		if (id.equals("admin")) {
			String member_id = request.getParameter("member_id");
			MemberDao dao = MemberDao.getInstance();
			dao.recover_member(member_id);
			ActionForward foward = new ActionForward();
			if(member_id==null) {
				request.setAttribute("message", "회원 복구 실패!!");
				foward.isRedirect = false;
				foward.url = "error/alert.jsp";
				return foward;
			}
			request.setAttribute("message", "회원 복구 성공!!");
			
			foward.isRedirect = true;
			foward.url = "Admin-Member.do";
			return foward;
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}