<%@page import="com.jcpdev.dao.ProductDao"%>
<%@page import="com.jcpdev.dto.Declaration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int pno = Integer.parseInt(request.getParameter("p_no"));
String comment = request.getParameter("comment");
String id = (String)session.getAttribute("user_id");

Declaration vo = new Declaration(0,id,pno,comment);
ProductDao.getInstance().insert_Declaration(vo);
%>
