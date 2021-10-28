package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class Admin_MemberAction implements Action {

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

			MemberDao mdao = MemberDao.getInstance();
			List<Member> user = mdao.getMemberList();
			List<Member> Wuser = mdao.getWithdrawalMemberList();

			request.setAttribute("list", user);
			request.setAttribute("Wuser", Wuser);
			ActionForward foward = new ActionForward();
			foward.isRedirect = false;
			foward.url = "./view/admin/admin-member.jsp";
			return foward;
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}