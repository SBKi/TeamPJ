package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.MemberDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Member;
import com.jcpdev.dto.Product;

public class MyProfileAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String member_id = request.getParameter("member_id");
		MemberDao mdao = MemberDao.getInstance();
		ProductDao dao = ProductDao.getInstance();
		
		Member user = mdao.getInfo(member_id);
		List<Product> list = dao.getMySoldList(user);
		
		int count= dao.getMySellCount(member_id);
		
		request.setAttribute("list", list);
		request.setAttribute("user", user);
		request.setAttribute("count", count);
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "/view/mypageProfile.jsp";
		return foward;
	}

}