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
import com.jcpdev.controller.action.DeleteProduct;
import com.jcpdev.controller.action.FindID;
import com.jcpdev.controller.action.FindIdAction;
import com.jcpdev.controller.action.FindPassword;
import com.jcpdev.controller.action.FindPasswordAction;
import com.jcpdev.controller.action.GetMyBuyList;
import com.jcpdev.controller.action.InsertAction;
import com.jcpdev.controller.action.LoginAction;
import com.jcpdev.controller.action.LoginCompleteAction;
import com.jcpdev.controller.action.LogoutAction;
import com.jcpdev.controller.action.MailAction;
import com.jcpdev.controller.action.MainAction;
import com.jcpdev.controller.action.MakeMailAction;
import com.jcpdev.controller.action.MypageAction;
import com.jcpdev.controller.action.MypageUpdateAction;
import com.jcpdev.controller.action.GetMySoldList;
import com.jcpdev.controller.action.GetMyList;
import com.jcpdev.controller.action.InsertProduct;
import com.jcpdev.controller.action.ProductDetailAction;
import com.jcpdev.controller.action.SearchAction;
import com.jcpdev.controller.action.UpdatePasswordAction;

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

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			Action action = new MainAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/login_complete.do")) {
			Action action = new LoginCompleteAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/mypage.do")) {
			Action action = new MypageAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/my_product.do")) {
			Action action = new GetMyList();
			forward = action.execute(request, response);
		} else if (spath.equals("/purchaselist.do")) {
			Action action = new GetMyBuyList();
			forward = action.execute(request, response);
		} else if (spath.equals("/saleslist.do")) {
			Action action = new GetMySoldList();
			forward = action.execute(request, response);
		} else if (spath.equals("/favoriteslist.do")) {
			path = "./view/favoriteslist.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/mail.do")) {
			Action action = new MailAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/MakeMail.do")) {
			Action action = new MakeMailAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/productAdd.do")) {
			path = "./view/productAdd.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/detail.do")) {
			Action action = new ProductDetailAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/productInsert.do")) {
			Action action = new InsertProduct();
			forward = action.execute(request, response);
		} else if (spath.equals("/mypageProfile.do")) {
			path = "./view/mypageProfile.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/findId_complete.do")) {
			Action action = new FindIdAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/findPassword_complete.do")) {
			Action action = new FindPasswordAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/findPassword_refix.do")) {
			path = "./community/find_password_C.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/update_password.do")) {
			Action action = new UpdatePasswordAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/update_mypage.do")) {
			Action action = new MypageUpdateAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/DeleteProduct.do")) {
			Action action = new DeleteProduct();
			forward = action.execute(request, response);
		} else if (spath.equals("/SearchAction.do")) {
			Action action = new SearchAction();
			forward = action.execute(request, response);
		}else if (spath.equals("/Search.do")) {
			path = "./view/search.jsp";
			forward = new ActionForward(false, path);
		}

		if (forward.isRedirect()) { // ���엯 boolean �씪�븣�뒗 getXXX �븘�땲怨� isXXX �엯�땲�떎.
			response.sendRedirect(forward.getUrl());
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}

	}

}