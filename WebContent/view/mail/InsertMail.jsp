<%@page import="com.jcpdev.dao.MailDao"%>
<%@page import="com.jcpdev.dto.Mail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("user_id");
String room = request.getParameter("room");
String postid = request.getParameter("postid");
int product_no = Integer.parseInt(request.getParameter("p_no"));
String mail_content = request.getParameter("content");
Mail mail = new Mail();
mail.setMail_content(mail_content);
mail.setMail_room(room);
mail.setMail_product_no(product_no);
mail.setMail_postid(postid);
mail.setMail_sendid(id);
MailDao dao = MailDao.getInstance();
dao.insert(mail);
%>