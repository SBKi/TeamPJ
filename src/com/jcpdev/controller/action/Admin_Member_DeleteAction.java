package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;

public class Admin_Member_DeleteAction implements Action {

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
			dao.delete_member(member_id);
			if (member_id == null) {
				request.setAttribute("message", "회원 삭제 실패!!");
				forward.isRedirect = false;
				forward.url = "error/alert.jsp";
				return forward;
			}
			request.setAttribute("message", "회원 삭제 성공!!");

			forward.isRedirect = true;
			forward.url = "Admin-Member.do";
			return forward;
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}