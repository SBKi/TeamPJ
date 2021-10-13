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

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	//요청Method 구별없이 실행 -> doGet() 또는 doPost()메소드 실행내용 있으면 실행.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//콘솔 출력- 테스트용
	//	System.out.println(request.getContextPath());
	//	System.out.println(request.getServletPath());
		ActionForward forward=null; 
		String spath = request.getServletPath();
		String path="index.jsp";
		String url ="./";   //또는 request.getContextPath();
		
		if(spath.equals("/sign_up.do")) {
			Action action = new InsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/loginAction.do")) {
			Action action = new LoginAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/login.do")) {
			path = "login.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/logout.do")) {
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/join.do")) {
			path ="sign_up.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/find_id.do")) {
			path ="./community/find_id.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/find_password.do")) {
			path ="./community/find_password.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/index.do")) {
			path ="index.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/login_complete.do")) {
			path = "./community/sign_complete.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/mypage.do")) {
			path = "./view/mypage.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/my_product.do")) {
			path = "./view/my_product.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/purchaselist.do")) {
			path = "./view/purchaselist.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/saleslist.do")) {
			path = "./view/saleslist.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/favoriteslist.do")) {
			path = "./view/favoriteslist.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/maillist.do")) {
			path = "./view/maillist.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/productAdd.do")) {
			path = "./view/productAdd.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/detail.do")) {
			path = "./view/detail.jsp";
			forward = new ActionForward(false,path);
		}
		//이 시점에서 forward 에 isRedirect 와 url 값이 저장되었으면 ok!
		if(forward.isRedirect()) {   //타입 boolean 일때는 getXXX 아니고 isXXX 입니다.
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd 
			= request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}
		
	}

}