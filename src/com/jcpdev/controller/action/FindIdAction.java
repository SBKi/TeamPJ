package com.jcpdev.controller.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class FindIdAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException ,java.io.IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String member_name =request.getParameter("member_name");
		String member_tel =request.getParameter("member_tel");
		String member_email =request.getParameter("member_email");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		Map<String,String> map = new HashMap<>();
		map.put("member_name",member_name);
		map.put("member_email",member_email);
		map.put("member_tel",member_tel);
		MemberDao dao = MemberDao.getInstance();
		Member user = dao.findId(map);
		
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		
		if(user != null){
			request.setAttribute("bean", user);
			foward.url="findId_complete_success.do";
		}else {
			request.setAttribute("message", "아이디 찾기 실패");
			request.setAttribute("url", "findId_complete_error.do");
			foward.url="error/alert.jsp";
		}
		
		return foward;
	};
}