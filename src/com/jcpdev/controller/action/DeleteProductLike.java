package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;

public class DeleteProductLike implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		int pageNo = Integer.parseInt(request.getParameter("page"));
		ProductDao dao = ProductDao.getInstance();
		dao.delete_like(product_no);

		request.setAttribute("page", pageNo);
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "";
		return foward;
	}
}