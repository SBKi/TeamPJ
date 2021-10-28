<%@page import="com.jcpdev.dao.ProductDao"%>
<%@page import="com.jcpdev.dto.Product"%>
<%@page import="com.jcpdev.dto.Member"%>
<%@page import="com.jcpdev.dao.MemberDao"%>
<%@page import="com.jcpdev.dto.Mail"%>
<%@page import="java.util.List"%>
<%@page import="com.jcpdev.dao.MailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
MailDao mail_dao = MailDao.getInstance();
MemberDao member_dao = MemberDao.getInstance();
ProductDao product_dao = ProductDao.getInstance();
String room = request.getParameter("room");
String order_id = request.getParameter("order_id");	
int p_no = Integer.parseInt(request.getParameter("p_no"));	
String id = (String) session.getAttribute("user_id");
Member member = member_dao.getInfo(order_id);
Product product = product_dao.getOne(p_no);
 
List<Mail> list = mail_dao.getMailList(room);
%>
 
<div class="chat_header">
	<div class="image_box">
		<div class="image_table">
			<img onclick="location.href='orderProfile.do?member_id=<%=member.getMember_id() %>'"
			src="/img/<%=member.getMember_img1()%>" alt="<%=member.getMember_name() %> 프로필 이미지">
		</div>
	</div>
	<div class="info">
		<div>
			<span id="message"><%=member.getMember_name()%></span><span class="size_limite"><%=product.getProduct_name()%> </span>
		</div>
	</div>
		<div class="declaration">
			<div>
			<%if(product.getProduct_seller().equals(id)){ %>
				<p class="btn btn-success" style="font-size: 0.7em;"><a href="MailDone.do?room=<%=room%>&p_no=<%=product.getProduct_no()%>&buyer=<%=order_id%>">거래 완료</a></p>
			<%} %>
				<p class="btn btn-danger" style="font-size: 0.7em;"><a href="MailDelete.do?room=<%=room%>">채팅방 나가기</a></p>
			</div>
		</div>
</div>
<div class="chat_description" style="bottom: 49px">
	<%
	for (Mail m : list) {
		if (id.equals(m.getMail_sendid())) {
		
	%>
	<div class="chat_div">
		<div class="right_div">
			<div class="mail_id_content" style="display: none;"><%=m.getMail_sendid()%></div>
			<div class="mail_right_content"><%=m.getMail_content()%></div>
			<div class="mail_right_date_content"><fmt:formatDate value="<%=m.getMail_date()%>" type="both"/></div>
		</div>
	</div>
	<%
	
	} else {
		
	%>
	<div class="chat_div">
	<div class="left_div">
		<div class="profile_div">
			<img class="profile_img" src="/img/<%=member.getMember_img1()%>" alt="<%=member.getMember_name() %> 프로필 이미지">
			<div class="mail_id_content"><%=m.getMail_sendid()%></div>
			</div>
		<div class="mail_left_content"><%=m.getMail_content()%></div>
		<div class="mail_left_date_content"><fmt:formatDate value="<%=m.getMail_date()%>" type="both"/></div>
	</div>
	</div>
	<%}}%>
</div>