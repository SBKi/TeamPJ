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
import com.jcpdev.controller.action.Admin_CategoryAction;
import com.jcpdev.controller.action.Admin_Declaration_DeleteAction;
import com.jcpdev.controller.action.Admin_MemberAction;
import com.jcpdev.controller.action.Admin_Member_DeleteAction;
import com.jcpdev.controller.action.Admin_Member_RecoverAction;
import com.jcpdev.controller.action.Admin_Product_DeleteActoin;
import com.jcpdev.controller.action.Admin_category_AddAction;
import com.jcpdev.controller.action.Admin_category_deleteAction;
import com.jcpdev.controller.action.Admin_mainAction;
import com.jcpdev.controller.action.Admin_productAction;
import com.jcpdev.controller.action.DeleteProduct;
import com.jcpdev.controller.action.FavoritesDeleteAction;
import com.jcpdev.controller.action.FavoritesListAction;
import com.jcpdev.controller.action.FindIdAction;
import com.jcpdev.controller.action.FindPasswordAction;
import com.jcpdev.controller.action.GetMyBuyList;
import com.jcpdev.controller.action.GetMyList;
import com.jcpdev.controller.action.GetMySoldList;
import com.jcpdev.controller.action.GetProductAction;
import com.jcpdev.controller.action.InsertAction;
import com.jcpdev.controller.action.InsertProduct;
import com.jcpdev.controller.action.LoginAction;
import com.jcpdev.controller.action.LoginCompleteAction;
import com.jcpdev.controller.action.LogoutAction;
import com.jcpdev.controller.action.MailAction;
import com.jcpdev.controller.action.MailDeleteAction;
import com.jcpdev.controller.action.MailDoneAction;
import com.jcpdev.controller.action.MainAction;
import com.jcpdev.controller.action.MakeMailAction;
import com.jcpdev.controller.action.MemberDeleteAction;
import com.jcpdev.controller.action.ModifyProfileCheckPwd;
import com.jcpdev.controller.action.MypageAction;
import com.jcpdev.controller.action.MypageUpdateAction;
import com.jcpdev.controller.action.OrderProfileAction;
import com.jcpdev.controller.action.ProductDetailAction;
import com.jcpdev.controller.action.Product_Add_Action;
import com.jcpdev.controller.action.Product_Like_Action;
import com.jcpdev.controller.action.SearchAction;
import com.jcpdev.controller.action.UpdatePasswordAction;
import com.jcpdev.controller.action.UpdateProduct;

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
		} else if (spath.equals("/modifyProfile_Check.do")) {
			path = "./view/modifyPwCheck.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/modifyProfile_CheckAction.do")) {
			Action action = new ModifyProfileCheckPwd();
			forward = action.execute(request, response);
		} else if (spath.equals("/modifyProfile.do")) {
			path = "./view/modifyMyProfile.jsp";
			forward = new ActionForward(false, path);
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
			Action action = new FavoritesListAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/mail.do")) {
			Action action = new MailAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/MakeMail.do")) {
			Action action = new MakeMailAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/productAdd.do")) {
			Action action = new Product_Add_Action();
			forward = action.execute(request, response);
		} else if (spath.equals("/detail.do")) {
			Action action = new ProductDetailAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/productInsert.do")) {
			Action action = new InsertProduct();
			forward = action.execute(request, response);
		} else if (spath.equals("/mypageProfile.do")) {
			path = "./view/mypageProfile.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/findId.do")) {
			path = "community/find_id.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/findId_Action.do")) {
			Action action = new FindIdAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/findId_complete_success.do")) {
			path = "community/find_id_C.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/findId_complete_error.do")) {
			path = "community/find_id.jsp";
			forward = new ActionForward(false, path);
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
		} else if (spath.equals("/Search.do")) {
			path = "./view/search.jsp";
			forward = new ActionForward(false, path);
		} else if (spath.equals("/MailDelete.do")) {
			Action action = new MailDeleteAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/MailDone.do")) {
			Action action = new MailDoneAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Product_Like.do")) {
			Action action = new Product_Like_Action();
			forward = action.execute(request, response);
		} else if (spath.equals("/orderProfile.do")) {
			Action action = new OrderProfileAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/FavoritesDeleteAction.do")) {
			Action action = new FavoritesDeleteAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/GetProduct.do")) {
			Action action = new GetProductAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/UpdateProduct.do")) {
			Action action = new UpdateProduct();
			forward = action.execute(request, response);
		} else if (spath.equals("/MemberDeleteAction.do")) {
			Action action = new MemberDeleteAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin.do")) {
			Action action = new Admin_mainAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin-Product.do")) {
			Action action = new Admin_productAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin_Product_Delete.do")) {
			Action action = new Admin_Product_DeleteActoin();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin-Category.do")) {
			Action action = new Admin_CategoryAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin_category_delete.do")) {
			Action action = new Admin_category_deleteAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin_category_Add.do")) {
			Action action = new Admin_category_AddAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin_Member_Delete.do")) {
			Action action = new Admin_Member_DeleteAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin-Member.do")) {
			Action action = new Admin_MemberAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin_Member_Recover.do")) {
			Action action = new Admin_Member_RecoverAction();
			forward = action.execute(request, response);
		} else if (spath.equals("/Admin_Declaration_Delete.do")) {
			Action action = new Admin_Declaration_DeleteAction();
			forward = action.execute(request, response);
		}

		if (forward.isRedirect()) {
			response.sendRedirect(forward.getUrl());
		} else {
			RequestDispatcher rd = request.getRequestDispatcher(forward.getUrl());
			rd.forward(request, response);
		}

	}

}