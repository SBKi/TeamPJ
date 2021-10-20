package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		
		String content = request.getParameter("search_name");
		ProductDao dao = ProductDao.getInstance();
		List<Product> list = null;
		System.out.println("%" + content + "%");

		list = dao.getSearchList("%" + content + "%");
		request.setAttribute("content", content);
		request.setAttribute("list", list);

		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "Search.do";
		return forward;
	}

}
