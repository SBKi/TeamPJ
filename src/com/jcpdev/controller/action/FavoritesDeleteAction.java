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

public class FavoritesDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int product_no = Integer.parseInt(request.getParameter("pno"));
		String id = (String) session.getAttribute("user_id");

		Favorites fav = new Favorites(0, product_no, id);
		FavoritesDao dao = FavoritesDao.getInstance();
		ProductDao pdao = ProductDao.getInstance();

		dao.delete(fav);
		pdao.delete_like(product_no);

		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url = "favoriteslist.do";
		return foward;
	}

}