package com.jcpdev.controller.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class LoginCompleteAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, java.io.IOException {

		// 테이블 insert
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("user_id");

		MemberDao dao = MemberDao.getInstance();

		Member user = dao.getInfo(id);
		request.setAttribute("member", user);

		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "community/sign_complete.jsp";
		return foward;
	};
}