package com.jcpdev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.controller.action.Action;
import com.jcpdev.controller.action.ActionForward;
import com.jcpdev.controller.action.GalleryListAction;
import com.jcpdev.controller.action.GalleryRegistAction;
import com.jcpdev.controller.action.InsertAction;
import com.jcpdev.controller.action.LoginAction;
import com.jcpdev.controller.action.LogoutAction;
import com.jcpdev.controller.action.ProductInsertAction;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	// �슂泥쵲ethod 援щ퀎�뾾�씠 �떎�뻾 -> doGet() �삉�뒗 doPost()硫붿냼�뱶 �떎�뻾�궡�슜 �엳�쑝硫� �떎�뻾.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 肄섏넄 異쒕젰- �뀒�뒪�듃�슜
		// System.out.println(request.getContextPath());
		// System.out.println(request.getServletPath());
		ActionForward forward = null;
		String spath = request.getServletPath();
		String path = "index.jsp";
		String url = "./"; // �삉�뒗 request.getContextPath();

		if (spath.equals("/sign_up.do")) {
			Action action = new InsertAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/loginAction.do")) {
			Action action = new LoginAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/login.do")) {
			path = "login.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/logout.do")) {
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/join.do")) {
			path = "sign_up.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/find_id.do")) {
			path = "./community/find_id.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/find_password.do")) {
			path = "./community/find_password.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/index.do")) {
			path = "index.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/login_complete.do")) {
			path = "./community/sign_complete.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/mypage.do")) {
			path = "./view/mypage.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/my_product.do")) {
			path = "./view/my_product.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/purchaselist.do")) {
			path = "./view/purchaselist.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/saleslist.do")) {
			path = "./view/saleslist.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/favoriteslist.do")) {
			path = "./view/favoriteslist.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/maillist.do")) {
			path = "./view/maillist.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/productAdd.do")) {
			path = "./view/productAdd.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/detail.do")) {
			path = "./view/detail.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/productInsert.do")) {
			Action action = new ProductInsertAction();
			forward = action.execute(request, response);
		}
	
		// �씠 �떆�젏�뿉�꽌 forward �뿉 isRedirect �� url 媛믪씠 ���옣�릺�뿀�쑝硫� ok!
		if (forward.isRedirect()) { // ���엯 boolean �씪�븣�뒗 getXXX �븘�땲怨� isXXX �엯�땲�떎.
			response.sendRedirect(forward.getUrl());
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}

	}

}