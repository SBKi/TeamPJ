package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.FavoritesDao;
import com.jcpdev.dao.MemberDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Favorites;
import com.jcpdev.dto.Member;
import com.jcpdev.dto.Product;

public class Product_Like_Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int product_no = Integer.parseInt(request.getParameter("Pno"));
		String like = request.getParameter("Like"); // 처음 관심등록 = like 관심등록해제 = unlike
		String id = (String) session.getAttribute("user_id");

		Favorites fav = new Favorites(0, product_no, id);
		FavoritesDao dao = FavoritesDao.getInstance();
		ProductDao pdao = ProductDao.getInstance();

		if (like.equals("like")) {
			dao.insert(fav);
			pdao.update_like(product_no);

		} else {
			dao.delete(fav);
			pdao.delete_like(product_no);
		}

		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url = "detail.do?pno=" + product_no;
		return foward;
	}

}