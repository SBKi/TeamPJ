package com.jcpdev.controller.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class ModifyProfileCheckPwd implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, java.io.IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("id");
		String member_password = request.getParameter("password");
		Map<String, String> map = new HashMap<>();
		map.put("member_password", member_password);
		map.put("member_id", member_id);
		MemberDao dao = MemberDao.getInstance();
		Member member = dao.login(map);
		ActionForward foward = new ActionForward();
		PrintWriter writer = response.getWriter();

		if (member != null) { // 비밀번호 일치
			request.setAttribute("member", member);
			foward.isRedirect = false;
			foward.url = "modifyProfile.do";
			return foward;
		} else {
			request.setAttribute("message", "비밀번호 인증 실패");
			request.setAttribute("url", "modifyProfile_Check.do");
			foward.isRedirect = false;
			foward.url = "error/alert.jsp";
			return foward;
		}

	};
}