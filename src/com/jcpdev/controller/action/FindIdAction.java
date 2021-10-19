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

		//테이블 insert
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String name =request.getParameter("name");
		String tel =request.getParameter("tel");
		String email =request.getParameter("email");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		Map<String,String> map = new HashMap<>();
		map.put("member_name",name);
		map.put("member_email",email);
		map.put("member_tel",tel);
		MemberDao dao = MemberDao.getInstance();
		Member user = dao.findId(map);
		request.setAttribute("bean", user);
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="community/find_id_C.jsp";
		return foward;
	};
}