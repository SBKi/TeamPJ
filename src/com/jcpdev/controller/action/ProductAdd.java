package com.jcpdev.controller.action;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductAdd implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String path = "C:\\img"; // 프로젝트 폴더와 관련 없는 경로일때 url 매핑을 server.xml에 설정한다.
//	      String path = request.getServletContext().getRealPath("/image");    //프로젝트 폴더의 하위 경로일때
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("user_id");
		System.out.println("id : " +id);
		int size = 10 * 1024 * 1024;
		try {
			MultipartRequest multi_request = new MultipartRequest(request, path, size, "UTF-8",
					new DefaultFileRenamePolicy());
			String product_name = multi_request.getParameter("product_name");
			String product_category = multi_request.getParameter("product_category");
			String product_content = multi_request.getParameter("product_content");
			int product_price = Integer.parseInt(multi_request.getParameter("product_price"));
			
			String filename1 = multi_request.getFilesystemName("img1");
			String filename2 = multi_request.getFilesystemName("img2");
			String filename3 = multi_request.getFilesystemName("img3");
			
			ProductDao pdao = ProductDao.getInstance();
			Product vo = new Product(0,product_category,product_name, product_content, product_price, filename1, filename2, filename3,id, null, null, null, 0);
			System.out.println(vo);
			pdao.insert(vo);
			System.out.println("gallery insert 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url = "my_product.do";
		return forward;
	}

}