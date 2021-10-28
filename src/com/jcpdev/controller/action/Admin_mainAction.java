package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.CategoryDao;
import com.jcpdev.dao.MemberDao;
import com.jcpdev.dao.ProductDao;

public class Admin_mainAction implements Action {

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

			ProductDao p_dao = ProductDao.getInstance();
			MemberDao m_dao = MemberDao.getInstance();
			CategoryDao c_dao = CategoryDao.getInstance();

			int done_product = 0;
			done_product = p_dao.admin_done_cnt();
			int ing_product = 0;
			ing_product = p_dao.admin_ing_cnt();
			int total_product = 0;
			total_product = p_dao.admin_total_price();
			int ing_member = 0;
			ing_member = m_dao.admin_cnt_ing();
			int done_member = 0;
			done_member = m_dao.admin_cnt_done();
			int decal_product = 0;
			decal_product = p_dao.admin_declaration_cnt();
			int category_cnt = 0;
			category_cnt = c_dao.admin_cnt_done();

			request.setAttribute("done_product", done_product);
			request.setAttribute("ing_product", ing_product);
			request.setAttribute("total_product", total_product);
			request.setAttribute("ing_member", ing_member);
			request.setAttribute("done_member", done_member);
			request.setAttribute("decal_product", decal_product);
			request.setAttribute("category_cnt", category_cnt);

			forward.isRedirect = false;
			forward.url = "./view/admin/admin.jsp";
			return forward;
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}