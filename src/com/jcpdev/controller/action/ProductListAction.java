package com.jcpdev.controller.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDao dao = ProductDao.getInstance();

		List<Product> list = dao.getList();

		request.setAttribute("today", LocalDate.now());
		request.setAttribute("list", list);

		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "index.jsp";
		return foward;
	}

}