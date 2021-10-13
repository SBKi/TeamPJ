package com.jcpdev.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class InsertAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException ,java.io.IOException {

		//테이블 insert
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name =request.getParameter("name");
		String tel =request.getParameter("tel");
		String email =request.getParameter("email");
		String address = request.getParameter("address");

		Member dto = new Member();
		dto.setMember_id(id);
		dto.setMember_name(name);
		dto.setMember_password(password);
		dto.setMember_tel(tel);
		dto.setMember_email(email);
		dto.setMember_address(address);
		MemberDao dao = MemberDao.getInstance();
		dao.insert(dto);
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		
		//2) db 테이블 select 쿼리 실행	
		Member user_login = dto;
		if(user_login != null){
			session.setAttribute("user_id",user_login.getMember_id());
			session.setAttribute("user_name",user_login.getMember_name());
			session.setAttribute("user_tel",user_login.getMember_tel());
			session.setAttribute("user_email",user_login.getMember_email());
			session.setAttribute("user_address",user_login.getMember_address());
		}
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url="login_complete.do";
		return foward;
	};
}