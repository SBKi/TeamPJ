package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.CategoryDao;
import com.jcpdev.dto.Category;

public class Product_Add_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Category> category = CategoryDao.getInstance().getAll();
		request.setAttribute("category", category);
		

		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "/view/productAdd.jsp";
		return foward;
	}

}