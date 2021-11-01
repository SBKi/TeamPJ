<%@page import="com.jcpdev.dao.ProductDao"%>
<%@page import="com.jcpdev.dto.Product"%>
<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/search.css">
<link rel="stylesheet" type="text/css" href="css/cookie.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="mypage-main-section">
	<div class="mypage-section1">
		<div class="container">
			<div class="main-body card" style="padding: 3em;">
				<div class="row-caption">
					<h5>"${content }"검색 내역</h5>
				</div>
				<div class="row">
				<c:forEach items="${list }" var="item">
					<div class="card col-md-4 col-sm-6" onclick="location.href='detail.do?pno=${item.product_no}'">
						<img src="/img/${item.product_img1 }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title size_limite" >${item.product_name }</h5>
							<div class="card-text">
								<span style="font-weight: bold;">
								<fmt:formatNumber value="${item.product_price }" pattern="#,###"/>원
								</span><span class="card-span"><i class="bi bi-heart-fill"></i> ${item.product_like }</span>
							</div>
						</div>
					</div>
				</c:forEach>
				<div id="add"></div>
				 <button id="getSearch" class="getSearchList"  onclick="getSearchList('${content }','${StartNo }','${EndNo }')">더보기</button>
				 </div>
			</div>
		</div>
	</div>
	<div class="cookie_div">
	<h5>최근 본 상품</h5>
	<div class="cookie">
		<%
			if(ck!=null){
				for(Cookie c: ck){
					if(c.getName().indexOf("product_cookie") != -1){
						Product vo = ProductDao.getInstance().getOne(Integer.parseInt(c.getValue()));
					%>
					<div class="cookie_img">
						<img src="/img/<%=vo.getProduct_img1()%>" onclick="location.href='detail.do?pno=<%=vo.getProduct_no()%>'">
						<a onclick="removeCK('product_cookie<%=vo.getProduct_no()%>')"><i class="bi bi-x-circle"></i></a>
					</div>
					<%}
				}
			}
		%>
	</div>
</div>
</div>
<script type="text/javascript">
function getSearchList(content,StartNo,EndNo){
	$.ajax({
			type : 'post',
			url : './view/mail/search_Ajax.jsp',
			data : {"content":content,"StartNo":StartNo,"EndNo":EndNo}, 
			dataType : 'html', 
			success : function(data) { 
				$('#add').html(data); 
				$('#getSearch').remove();
			}
		});
	}
</script>

<%@include file="../include/footer.jsp"%>