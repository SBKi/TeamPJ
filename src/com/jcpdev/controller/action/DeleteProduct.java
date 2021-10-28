package com.jcpdev.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.ProductDao;


public class DeleteProduct implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		
		int product_no = Integer.parseInt(request.getParameter("pno"));
		ProductDao dao = ProductDao.getInstance();
		
		dao.delete(product_no);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url = "my_product.do";
		return forward;
	}

}