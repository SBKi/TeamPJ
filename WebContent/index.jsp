<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<section class="home-main-section">
	<div class="row">
		<c:forEach var="vo" items="${list}">
			<li>
				<ul class="row">
					<li>${vo.product_img1}</li>
					<li><a href="detail.do?product_no=${vo.product_no}&page=${pno}"
						class="title">${vo.product_name }</a> ...</li>
					<li>${vo.product_price }</li>
					<li>${vo.readCount }</li>
							

				</ul>
			</li>
		</c:forEach>
	</div>
</section>
<%@include file="include/footer.jsp"%>