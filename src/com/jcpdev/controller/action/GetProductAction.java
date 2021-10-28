package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.CategoryDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Category;
import com.jcpdev.dto.Product;

public class GetProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int product_no = Integer.parseInt(request.getParameter("pno"));
		ProductDao dao = ProductDao.getInstance();
		Product vo = dao.getProduct(product_no);

		int imgCnt = 0;
		
		if(vo.getProduct_img1()!=null) imgCnt++;
		if(vo.getProduct_img2()!=null) imgCnt++;
		if(vo.getProduct_img3()!=null) imgCnt++;
		List<Category> category = CategoryDao.getInstance().getAll();
		
		request.setAttribute("category", category);
		request.setAttribute("list", vo);
		request.setAttribute("imgCnt", imgCnt);

		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "view/productUpdate.jsp";
		return forward;
	}

}