package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		String member_id=request.getParameter("member_id");
		String member_password=request.getParameter("member_password");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		Map<String,String> map = new HashMap<>();
		map.put("member_id",member_id);
		map.put("member_password",member_password);
		System.out.println(map);
		MemberDao dao = MemberDao.getInstance();
		Member user_check = dao.login(map);
		if(user_check != null){
				session.setAttribute("user_name",user_check.getMember_name());
				session.setAttribute("user_id",user_check.getMember_id());
				request.setAttribute("message", "로그인 성공");
				request.setAttribute("url", "index.do");
			}else {
				request.setAttribute("message", "로그인 실패");
				request.setAttribute("url", "login.do");
			}
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="error/alert.jsp";
		return foward;
	}

}