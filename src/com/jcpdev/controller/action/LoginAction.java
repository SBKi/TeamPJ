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

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		Map<String,String> map = new HashMap<>();
		map.put("id",id);
		map.put("password",password);
		System.out.println(map);
		MemberDao dao = MemberDao.getInstance();
		Member user_check = dao.login(map);
		if(user_check != null){
		//로그인 정보 일치
			session.setAttribute("user_name",user_check.getMember_name());
			session.setAttribute("user_id",user_check.getMember_id());
			request.setAttribute("message", "로그인 되었습니다.");
			request.setAttribute("url", "./");
		}else {
			request.setAttribute("message", "로그인 정보가 올바르지 않습니다.");
			request.setAttribute("url", "login.do");   //변경
		}
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="error/alert.jsp";
		return foward;
	}

}