package com.jcpdev.controller.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.ProductDao;
import com.jcpdev.dto.PageDto;
import com.jcpdev.dto.Product;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao dao = ProductDao.getInstance();
		int pageNo;
		if(request.getParameter("page")==null) pageNo=1;
		else pageNo = Integer.parseInt(request.getParameter("page"));

		int pageSize =15;
		
		PageDto pageDto = new PageDto(pageNo,dao.getCount(),pageSize);

		Map<String,Integer> map = new HashMap<>();
		map.put("pageSize",pageSize);
		map.put("startNo",pageDto.getStartNo());
		List<Product> list = dao.getList(map);

		request.setAttribute("today", LocalDate.now());
		request.setAttribute("pageDto", pageDto); 
		request.setAttribute("list", list);
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="[수정]";
		return foward;
	}

}