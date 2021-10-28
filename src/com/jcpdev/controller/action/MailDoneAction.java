package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.FavoritesDao;
import com.jcpdev.dao.MailDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Mail;
import com.jcpdev.dto.Product;

public class MailDoneAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ActionForward foward = new ActionForward();
		HttpSession session = request.getSession();

		MailDao mail_dao = MailDao.getInstance();
		ProductDao p_dao = ProductDao.getInstance();

		String id = (String) session.getAttribute("user_id");
		String room = request.getParameter("room");
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		String buyer = request.getParameter("buyer");

		Product p_vo = p_dao.getOne(p_no);
		FavoritesDao favdao = FavoritesDao.getInstance();

		if (p_vo.getProduct_seller().equals(id)) {
			p_vo.setProduct_buyer(buyer);
			p_vo.setProduct_status("done");
			p_dao.update_product_done(p_vo); // 상품 상태 변경
			mail_dao.deleteDone(p_no); // 쪽지삭제 (상품관련 모든 쪽지)
			favdao.deleteDone(p_no);// 거래완료된 상품의 관심목록 전부삭제
		}

		foward.isRedirect = true;
		foward.url = "mail.do";
		return foward;

	}

}