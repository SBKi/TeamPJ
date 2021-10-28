package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Declaration;
import com.jcpdev.dto.Product;

public class Admin_productAction implements Action {

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
			List<Declaration> de_list = p_dao.admin_declaration_product();
			List<Declaration> de_all_list = p_dao.admin_declaration();
			List<Product> p_list = new ArrayList<Product>();
			for (Declaration vo : de_list) {
				Product temp = p_dao.getOne(vo.getDeclration_product_no());
				p_list.add(temp);
			}
			request.setAttribute("list", p_list);
			request.setAttribute("de_list", de_all_list);

			forward.isRedirect = false;
			forward.url = "./view/admin/admin-product.jsp";
			return forward;
		} else {
			forward.isRedirect = true;
			forward.url = "index.do";
			return forward;
		}

	}

}