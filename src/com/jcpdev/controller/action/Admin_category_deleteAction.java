package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.CategoryDao;
import com.jcpdev.dto.Category;

public class Admin_category_deleteAction implements Action {

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

			int category_no = Integer.parseInt(request.getParameter("Cno"));

			CategoryDao c_dao = CategoryDao.getInstance();
			int check = c_dao.category_check(category_no);
			if (check > 0) { // 카테고리 사용중일때
				request.setAttribute("message", " 카테고리에 상품이 등록되어있습니다.");
				request.setAttribute("url", "Admin-Category.do");
				forward.isRedirect = false;
				forward.url = "error/alert.jsp";
				return forward;
			} else { // 카테고리에 등록된 상품이 없을때
				c_dao.delte(category_no);
				forward.isRedirect = true;
				forward.url = "Admin-Category.do";
				return forward;
			}
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}