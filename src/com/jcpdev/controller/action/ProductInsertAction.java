package com.jcpdev.controller.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
//		int product_category = Integer.parseInt(request.getParameter("product_category"));

		String path = "c:\\upload"; // 서버컴퓨터 로컬경로 - 폴더 만들어 놓으세요.
		// 프로젝트 폴더와 관련 없는 경로일때 url 매핑을 server.xml에 설정한다.
		// String path = request.getServletContext().getRealPath("/image");
		// ㄴ업로드 폴더가 프로젝트 폴더의 하위 경로 image 폴더 일때 사용합니다.

		int size = 10 * 1024 * 1024; // 10MByte , 최대파일크기

		// 업로드된 파일을 받을 수 있는 MultipartRequest타입의 request 객체 생성.
		MultipartRequest multi_request = new MultipartRequest(request, path, size, "UTF-8",
				new DefaultFileRenamePolicy());
		// 기존 파일명과 중복된 파일명은 이름을 변경 -> 기본방식은 파일명뒤에 순차적으로 번호 부여

		// title(text), pic(file) 2개 파라미터
		int product_category = 1;
		String product_name = multi_request.getParameter("product_name");
		String product_content = multi_request.getParameter("product_content");
		int product_price = Integer.parseInt(multi_request.getParameter("product_price"));

		List<String> fileList = new ArrayList<String>();
		Enumeration fileNames = multi_request.getFileNames();

		while (fileNames.hasMoreElements()) {
			String fileName = (String) fileNames.nextElement();
			File mFile = multi_request.getFile(fileName);
			String originalFileName = mFile.toString();
			fileList.add(originalFileName);
			File file = new File(path + "\\" + fileName);
		}
		System.out.println(fileList);

		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url = "/index.jsp";
		return foward;
	}

}
