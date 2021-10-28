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

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		ProductDao dao = ProductDao.getInstance();
		int StartNo = 0;
		int EndNo = 8;
		Map<String, Integer> map = new HashMap<>();
		map.put("StartNo", StartNo);
		map.put("EndNo", EndNo);
		List<Product> list = dao.getAddList(map);

		request.setAttribute("list", list);
		request.setAttribute("EndNo", EndNo);
		request.setAttribute("StartNo", StartNo);

		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "index.jsp";
		return foward;
	}

}