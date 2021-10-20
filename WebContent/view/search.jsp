<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/search.css">

<div class="mypage-main-section">
	<div class="mypage-section1">
		<div class="container">
			<div class="main-body card" style="padding: 3em;">
				<div class="row-caption">
					<h5>"${content }"검색 내역</h5>
				</div>
				<div class="row">
				<c:forEach items="${list }" var="item">
					<div class="card col-md-4 col-sm-6" onclick="TestFuc()">
						<img src="/img/${item.product_img1 }" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${item.product_name }</h5>
							<div class="card-text">
								<span style="font-weight: bold;">${item.product_price }</span><span class="card-span"><i class="bi bi-heart"></i> ${item.product_readcount }</span>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
<!-- 				<div class="more-btn" onclick="#"> -->
<!-- 					<p>더보기</p> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp"%>