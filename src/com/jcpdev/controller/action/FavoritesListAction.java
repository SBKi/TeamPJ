package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.ArrayList;
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
import com.jcpdev.dto.NavCnt;
import com.jcpdev.dto.Product;

public class FavoritesListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("user_id");

		FavoritesDao dao = FavoritesDao.getInstance();
		ProductDao pdao = ProductDao.getInstance();
		MemberDao mdao = MemberDao.getInstance();
		NavCnt cnt = mdao.navCntUpdate(id);

		List<Favorites> list = dao.getFavListPd(id);
		List<Product> product_list = new ArrayList<Product>();
		List<Member> member_list = new ArrayList<Member>();

		for (Favorites fav : list) {
			Product vo = pdao.getOne(fav.getFavorites_product_no());
			Member mem = mdao.getInfo(vo.getProduct_seller());
			member_list.add(mem);
			product_list.add(vo);

		}

		request.setAttribute("cnt", cnt);
		request.setAttribute("list", product_list);
		request.setAttribute("memlist", member_list);
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url = "/view/favoriteslist.jsp";
		return foward;
	}

}