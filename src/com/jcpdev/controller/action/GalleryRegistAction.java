package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GalleryDao;
import com.jcpdev.dto.Gallery;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalleryRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GalleryDao gdao = GalleryDao.getInstance();
		String path="c:\\upload";     		//서버컴퓨터 로컬경로 - 폴더 만들어 놓으세요.
		//프로젝트 폴더와 관련 없는 경로일때  url 매핑을 server.xml에 설정한다.
		//String path = request.getServletContext().getRealPath("/image");    
		//			ㄴ업로드 폴더가 프로젝트 폴더의 하위 경로 image 폴더 일때 사용합니다.

		
		int size=10*1024*1024;   //10MByte , 최대파일크기
		try {
			
			//업로드된 파일을 받을 수 있는 MultipartRequest타입의 request 객체 생성.
			MultipartRequest multi_request = new MultipartRequest(request,path,size,"UTF-8",
												new DefaultFileRenamePolicy());
			//기존 파일명과 중복된 파일명은 이름을 변경 -> 기본방식은 파일명뒤에 순차적으로 번호 부여
			
			//title(text), pic(file) 2개 파라미터
			String title= multi_request.getParameter("title"); 
			String filename = multi_request.getFilesystemName("pic");   
			//파일을 받아오고 지정된 path에 저장, 저장된 파일명 리턴
			//새로운 파일명 규칙으로 파일명 변경하기도 할 수 있습니다.(참고)
			Gallery vo = new Gallery(0, title, filename);
			gdao.insert(vo);    //업로드한 파일을 테이블 컬럼 값으로 저장.
			System.out.println("gallery insert 성공!");
		}catch(Exception e){   
		//	e.printStackTrace();	
			System.out.println("gallery 오류  :" + e.getMessage());
		}
		
		
		return new ActionForward(true, "gallery.do");
	}

}