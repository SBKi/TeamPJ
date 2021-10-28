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
int Start = Integer.parseInt(request.getParameter("StartNo"));
int End = Integer.parseInt(request.getParameter("EndNo"));
int StartNo =8;
int EndNo = End+8;

ProductDao dao = ProductDao.getInstance();
Map<String,Integer> map = new HashMap<>();
map.put("StartNo",StartNo);
map.put("EndNo",EndNo);
List<Product> list = dao.getAddList(map);
request.setAttribute("EndNo", EndNo);
request.setAttribute("StartNo", StartNo);
%>
<div class="row">
		<%
	for (Product l : list) {
	%>
			<div class="card col-md-3 col-sm-6"
				onclick="location.href='detail.do?pno=<%=l.getProduct_no() %>'">
				<img src="/img/<%=l.getProduct_img1() %>" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title size_limite"><%=l.getProduct_name() %></h5>
					<div class="card-text">
						<span style="font-weight: bold;">
						 <fmt:formatNumber value="<%=l.getProduct_price() %>" pattern="#,###" />원
						</span><span class="card-span"><i class="bi bi-heart-fill"></i>
							<%=l.getProduct_like() %></span>
					</div>
				</div>
			</div>
			<%
			}
			%>
		<div id="add"></div>
		<button id="getList" class="getList" onclick="getList('${StartNo }','${EndNo }')">더보기</button>
	</div>
