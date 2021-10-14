package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;

public class ProductInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int product_category = Integer.parseInt(request.getParameter("product_category"));
		String product_name = request.getParameter("product_name");
		String product_content = request.getParameter("product_content");
		int product_price = Integer.parseInt(request.getParameter("product_price"));
		String product_img1 =request.getParameter("product_img1");
		String product_img2 =request.getParameter("product_img2");
		String product_img3 =request.getParameter("product_img3");

		Product dto = new Product();
		dto.setProduct_category(product_category);
		dto.setProduct_name(product_name);
		dto.setProduct_content(product_content);
		dto.setProduct_price(product_price);
		dto.setProduct_img1(product_img1);
		dto.setProduct_img1(product_img2);
		dto.setProduct_img1(product_img3);
		ProductDao dao = ProductDao.getInstance();
		dao.insert(dto);
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		
		Product insert_product = dto;
		if(insert_product != null){
			session.setAttribute("product_category",insert_product.getProduct_category());
			session.setAttribute("product_name",insert_product.getProduct_name());
			session.setAttribute("product_content",insert_product.getProduct_content());
			session.setAttribute("product_price",insert_product.getProduct_price());
			session.setAttribute("product_img1",insert_product.getProduct_img1());
			session.setAttribute("product_img2",insert_product.getProduct_img2());
			session.setAttribute("product_img3",insert_product.getProduct_img3());
		}
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url="insertProduct_complete.do";
		return foward;
	}

}
