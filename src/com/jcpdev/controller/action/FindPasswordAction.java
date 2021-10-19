package com.jcpdev.controller.action;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class FindPasswordAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, java.io.IOException {

		// 테이블 insert
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");

		if (session.getAttribute("readIdx") == null) {
			StringBuilder readIdx = new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		Map<String, String> map = new HashMap<>();
		map.put("member_id", id);
		map.put("member_tel", tel);
		map.put("member_email", email);
		MemberDao dao = MemberDao.getInstance();
		Member user = dao.findPassword(map);

		ActionForward foward = new ActionForward();
		if (user == null) {
			request.setAttribute("message", "본인인증 실패");
			request.setAttribute("url", "find_password.do");
			foward.isRedirect = false;
			foward.url = "error/alert.jsp";
			return foward;
		}
		request.setAttribute("bean", user);
		foward.isRedirect = false;
		foward.url = "findPassword_refix.do";
		return foward;

	};
}