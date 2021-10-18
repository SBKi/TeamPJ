package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;


public class UpdateProduct implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int pageNo = Integer.parseInt(request.getParameter("page"));
		String product_name = request.getParameter("product_name");
		int product_price = Integer.parseInt(request.getParameter("product_price"));
		String product_img1 = request.getParameter("product_img1");
		String product_img2 = request.getParameter("product_img2");
		String product_img3 = request.getParameter("product_img3");
		String product_status = request.getParameter("product_status");
		
		Product dto = new Product();
		dto.setProduct_name(product_name);
		dto.setProduct_price(product_price);
		dto.setProduct_img1(product_img1);
		dto.setProduct_img2(product_img2);
		dto.setProduct_img3(product_img3);
		dto.setProduct_status(product_status);

		ProductDao dao = ProductDao.getInstance();
		dao.update_product(dto);
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url="";
		return foward;
	}

}
