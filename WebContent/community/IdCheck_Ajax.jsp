<%@page import="com.jcpdev.dto.Member"%>
<%@page import="com.jcpdev.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
MemberDao dao = MemberDao.getInstance();
Member member = null;
member = dao.idCheck(id);
if (member != null) {
%>
32
<%
} else {
%>
0
<%
}
%>