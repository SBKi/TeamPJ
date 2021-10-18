package com.jcpdev.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;


public class DeleteProduct implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String product_seller = request.getParameter("product_seller");

		ProductDao dao = ProductDao.getInstance();
		Map<String,Object> map = new HashMap<>();
		map.put("product_no", product_no);
		map.put("product_seller", product_seller);
		
		dao.delete(map);
		out.print("<script>");
		String message="글삭제 되었습니다.";
		String href=null;
		out.print("alert('"+message+"');");
		out.print("location.href='"+href+"';");
		out.print("</script>");
		return null;
	}

}
