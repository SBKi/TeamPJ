package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.CategoryDao;
import com.jcpdev.dto.Category;

public class Admin_category_AddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();

		if (session.getAttribute("user_id") == null) {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

		String id = (String) session.getAttribute("user_id");
		if (id.equals("admin")) {

			String category_name = request.getParameter("category_name");
			CategoryDao c_dao = CategoryDao.getInstance();
			int check = c_dao.category_name_check(category_name);
			if (check > 0) { // 카테고리 사용중일때
				request.setAttribute("message", " 이미 등록된 카테고리 입니다.");
				request.setAttribute("url", "Admin-Category.do");
				forward.isRedirect = false;
				forward.url = "error/alert.jsp";
				return forward;
			} else { // 카테고리에 등록된 상품이 없을때
				Category vo = new Category();
				vo.setCategory_no(0);
				vo.setCategory_name(category_name);
				c_dao.insert(vo);

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