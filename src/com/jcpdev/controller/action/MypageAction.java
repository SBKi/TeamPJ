package com.jcpdev.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("user_id");

		MemberDao dao = MemberDao.getInstance();
		Member user = dao.getInfo(id);

		request.setAttribute("member", user);

		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "/view/mypage.jsp";
		return foward;
	}

}