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
		int idx = Integer.parseInt(request.getParameter("pno"));

		ProductDao dao = ProductDao.getInstance();
		if (session.getAttribute("readIdx") != null) {
			StringBuilder readIdx = (StringBuilder) session.getAttribute("readIdx");
			boolean status = readIdx.toString().contains("/" + idx + "/");
			if (!status) {
				dao.readCount(idx);
				readIdx.append(idx + "/");
			}
		} else {
			StringBuilder readIdx = new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}

		Product bean = dao.getOne(idx);

		request.setAttribute("bean", bean);
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "/view/detail.jsp";
		return foward;
	}

}