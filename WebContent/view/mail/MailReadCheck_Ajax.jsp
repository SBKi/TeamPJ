<%@page import="com.jcpdev.dao.MailDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String room = request.getParameter("room");
String id = (String) session.getAttribute("user_id");
String order_id = request.getParameter("order_id");
String product_no = request.getParameter("p_no");
Map<String, String> map = new HashMap<>();
map.put("id", id);
map.put("sendid", order_id);
map.put("product_no", product_no);
MailDao dao = MailDao.getInstance();
dao.readCheck(map);
%>