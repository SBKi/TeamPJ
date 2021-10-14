<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<section class="home-main-section">

<div class="row">
	<c:forEach items="${list }" var="item" varStatus="index">
		<div class="card col-md-3 col-sm-6"
			onclick="location.href='detail.do?pno=${item.product_no}'">
			<img src="/img/${item.product_img1 }" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">${item.product_name }</h5>
				<div class="card-text">
					<span style="font-weight: bold;">
					<fmt:formatNumber value="${item.product_price }" pattern="#,###"/>원
					</span><span class="card-span"><i class="bi bi-heart"></i> 4</span>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</section>
<%@include file="include/footer.jsp"%>