package com.jcpdev.controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dto.Member;

public class UpdatePasswordAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException, java.io.IOException {

		// 테이블 insert
		request.setCharacterEncoding("UTF-8");
		String member_id = request.getParameter("member_id");
		String member_password = request.getParameter("member_password");
		System.out.println(member_id);
		System.out.println(member_password);
		Map<String, String> map = new HashMap<>();
		map.put("member_password", member_password);
		map.put("member_id", member_id);
		MemberDao dao = MemberDao.getInstance();
		dao.update_password(map);
		
		request.setAttribute("message", "비밀번호 수정 성공!!");
		// 2) db 테이블 select 쿼리 실행
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url = "login.do";
		return foward;
	};
}