package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;

public class ProductDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		int pageNo = Integer.parseInt(request.getParameter("page"));

		ProductDao dao = ProductDao.getInstance();
		if(session.getAttribute("readIdx") !=null){
			StringBuilder readproduct_no = (StringBuilder)session.getAttribute("readproduct_no");
			boolean status = readproduct_no.toString().contains("/"+product_no+"/");
			if(!status) {
				dao.readCount(product_no);
				readproduct_no.append(product_no + "/");
			}
		}else{
			StringBuilder readproduct_no=new StringBuilder("/");
			session.setAttribute("readproduct_no", readproduct_no);
		}
		
		Product bean = dao.getOne(product_no);
		
		request.setAttribute("page", pageNo);
		request.setAttribute("bean", bean);
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="detail.jsp";
		return foward; 
	}

}