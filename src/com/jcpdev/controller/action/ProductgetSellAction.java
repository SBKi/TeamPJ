package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;

public class ProductgetSellAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao dao = ProductDao.getInstance();
		String product_seller = request.getParameter("product_buyers");
		request.setCharacterEncoding("UTF-8");
		List<Product> getseller = dao.getSell(product_seller);
		request.setAttribute("product_buyers", getseller);
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url="";
		return foward;
	}

}
