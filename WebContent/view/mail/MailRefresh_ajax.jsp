<%@page import="com.jcpdev.dao.MailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	MailDao dao = MailDao.getInstance();
	int cnt = dao.countMails(id);
	out.print(cnt);
%>