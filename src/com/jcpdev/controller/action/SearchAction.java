package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		int StartNo =0;
		int EndNo = 6;
		Map<String,Integer> map = new HashMap<>();
		map.put("StartNo",StartNo);
		map.put("EndNo",EndNo);
		List<Product> list = null;
		
		list = dao.getSearchList("%" + content + "%");
		request.setAttribute("content", content);
		request.setAttribute("list", list);
		request.setAttribute("StartNo", StartNo);
		request.setAttribute("EndNo", EndNo);

		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "Search.do";
		return forward;
	}

}