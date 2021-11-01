package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.FavoritesDao;
import com.jcpdev.dao.MemberDao;
import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Declaration;
import com.jcpdev.dto.Favorites;
import com.jcpdev.dto.Member;
import com.jcpdev.dto.Product;

public class ProductDetailAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      HttpSession session = request.getSession();
      int idx = Integer.parseInt(request.getParameter("pno"));

      ProductDao dao = ProductDao.getInstance();
      MemberDao mdao = MemberDao.getInstance();

      Product temp = dao.product_done_check(idx);
      if (temp == null) { // 상품이 이미 거래완료된 상태이면
         request.setAttribute("message", "이미 거래가 완료된 상품 입니다.");
         request.setAttribute("url", "index.do");
         Cookie ck = new Cookie("product_cookie" + idx, null);
         ck.setMaxAge(0);
         response.addCookie(ck);
         ActionForward foward = new ActionForward();
         foward.isRedirect = false;
         foward.url = "error/alert.jsp";
         return foward;
      }

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
      Member mbean = mdao.getInfo(bean.getProduct_seller());

      // 관심테이블에서 글거와서 아이디랑 매칭해서 있는지업슨ㄴ지 확인 학 ㅗblooen값으로 넘기기
      boolean favCheck = true;

      int de_check = 0;
      if (session.getAttribute("user_id") != null) {

         String id = (String) session.getAttribute("user_id");
         FavoritesDao fav_dao = FavoritesDao.getInstance();
         List<Favorites> fav_list = fav_dao.getFavListId(idx);

         for (Favorites fav : fav_list) {
            if (fav.getFavorites_member_id().equals(id)) {
               favCheck = false; // 이미 관심등록되어있음
            }
         }

         List<Declaration> de_list = dao.select_Declaration(idx);
         for (Declaration vo : de_list) { // 상품에 신고테이블에 회원이 있나없나
            if (vo.getDeclration_id().equals(id)) {
               de_check = 1;
            }
         }
      }

      request.setAttribute("bean", bean); // 상품정보
      request.setAttribute("favCheck", favCheck); // 상품정보
      request.setAttribute("mem", mbean); // 판매자 정보
      request.setAttribute("decal_check", de_check); // 상품 신고 정보

      ActionForward foward = new ActionForward();
      foward.isRedirect = false;
      foward.url = "/view/detail.jsp";
      return foward;
   }

}