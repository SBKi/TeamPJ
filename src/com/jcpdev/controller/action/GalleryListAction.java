package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GalleryDao;
import com.jcpdev.dto.Gallery;

public class GalleryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GalleryDao gdao = GalleryDao.getInstance();
		List<Gallery> list = gdao.getList();
		
		request.setAttribute("glist", list);	//? 수정해야합니다. gallery.jsp 참고
	

		return new ActionForward(false,"./view/productAdd.jsp");
	}

}
