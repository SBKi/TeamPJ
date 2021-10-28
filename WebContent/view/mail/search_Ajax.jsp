<%@page import="com.jcpdev.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.jcpdev.dao.ProductDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html");

String content = request.getParameter("content");
int Start = Integer.parseInt(request.getParameter("StartNo"));
int End = Integer.parseInt(request.getParameter("EndNo"));
int StartNo =6;
int EndNo = End+6;

ProductDao dao = ProductDao.getInstance();
Map<String, Object> map = new HashMap<>();
map.put("content","%"+content+"%");
map.put("StartNo",StartNo);
map.put("EndNo",EndNo);
List<Product> list = dao.getSearchListAdd(map);
request.setAttribute("EndNo", EndNo);
request.setAttribute("StartNo", StartNo);
request.setAttribute("content", content);
%>
				<div class="row">
				<%
				for (Product s : list) {
				%>
					<div class="card col-md-4 col-sm-6" onclick="location.href='detail.do?pno=<%=s.getProduct_no() %>'">
						<img src="/img/<%=s.getProduct_img1() %>" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title size_limite" ><%=s.getProduct_name() %></h5>
							<div class="card-text">
								<span style="font-weight: bold;">
								<fmt:formatNumber value="<%=s.getProduct_price() %>" pattern="#,###"/>원
								</span><span class="card-span"><i class="bi bi-heart-fill"></i> <%=s.getProduct_like() %></span>
							</div>
						</div>
					</div>
					<%
					}
					%>
				<div id="add"></div>
				 <button class="getSearchList"  onclick="getSearchList('${content }','${StartNo }','${EndNo }')">더보기</button>
				</div>

