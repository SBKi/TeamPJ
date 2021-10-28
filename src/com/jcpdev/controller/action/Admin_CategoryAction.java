package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.CategoryDao;
import com.jcpdev.dto.Category;

public class Admin_CategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		if (session.getAttribute("user_id") == null) {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

		String id = (String) session.getAttribute("user_id");
		if (id.equals("admin")) {

			CategoryDao c_dao = CategoryDao.getInstance();
			List<Category> list = c_dao.getAll();
			request.setAttribute("list", list);

			forward.isRedirect = false;
			forward.url = "./view/admin/admin-category.jsp";
			return forward;
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}