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
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward=null; 
		String spath = request.getServletPath();
		String path="index.jsp";
		String url ="./";   //또는 request.getContextPath();
		
		/*
		if(spath.equals("/list.do")) {
			Action action = new ListAction();
			forward = action.execute(request, response);      //여기에 들어갈 코드가 많습니다.-> Action 구현 클래스로 변경.
			forward.setUrl("community/list.jsp");
		}else if(spath.equals("/login.do")) {
			path = "login.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/insert.do")) {
			path ="community/insert.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/detail.do")) {
			Action action = new DetailAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/save.do")) {
			Action action = new InsertAction();
			forward = action.execute(request, response);
			url = "list.do";
			forward.setUrl(url);
		}else if(spath.equals("/update.do")) {
			Action action = new UpdateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/modify.do")) {
			Action action = new ModifyAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/delete.do")) {
			Action action = new DeleteAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/comment.do")) {
			Action action = new CommentAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/loginAction.do")) {
			Action action = new LoginAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/logout.do")) {
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/gallery.do")){
			Action action = new GalleryListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/regist.do")){
			Action action = new GalleryRegistAction();
			forward = action.execute(request, response);
		}
		*/
		
		//이 시점에서 forward 에 isRedirect 와 url 값이 저장되었으면 ok!
		if(forward.isRedirect()) {   //타입 boolean 일때는 getXXX 아니고 isXXX 입니다.
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd 
			= request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}//끝  감사합니다!
		
	}

}