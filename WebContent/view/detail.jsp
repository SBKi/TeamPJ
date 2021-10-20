<%@page import="com.jcpdev.dto.Product"%>
<%@page import="com.jcpdev.dao.MemberDao"%>
<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/detail-imgslice.css">
<link rel="stylesheet" type="text/css" href="./css/detail.css">

<div class="mypage-main-section">
	<div class="mypage-section1">
		<div class="container">
			<div class="main-body">
			<div class="card">
			<article class="detail-img">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <c:if test="${bean.product_img2 !=null }">
     <li data-target="#myCarousel" data-slide-to="1"></li>
    </c:if>   
    <c:if test="${bean.product_img3 !=null}">
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </c:if>
    </ol>

    <div class="carousel-inner" role="listbox">
	
      <div class="item active">
        <img src="/img/${bean.product_img1 }"width="460" height="345">
      </div>
	<c:if test="${bean.product_img2 !=null}">
      <div class="item">
        <img src="/img/${bean.product_img2 }" width="460" height="345">
      </div>
    </c:if>
     <c:if test="${bean.product_img3 !=null}">
      <div class="item">
        <img src="/img/${bean.product_img3 }" width="460" height="345">
      </div>
    </c:if>
    </div>

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
			</article>
			<a href="#" class="article-profile-link ">
			<article class="detail-profile">
				<img alt="" src="/img/${mem.member_img1 }">
				<p>${mem.member_name }</p>
			</article>
			</a>
			<article class="detail-content">
			<div class="detail-sub-price">
				<h2 class="detail-subject">${bean.product_name }</h2>
				<p class="detail-price">
				<fmt:formatNumber value="${bean.product_price }" pattern="#,###"/>원
				</p>
			</div>
			<div>
				<pre class="product_content_pre">
${bean.product_content }
				</pre>
			</div>
			</article>
			<c:if test="${bean.product_seller != sessionScope.user_id }"> <!-- 자기상품 아닐때만 보이기 -->
			<article class="detail-message" style="text-align: right;">
			<a href='MakeMail.do?pno=${bean.product_no}'><p class="btn btn-outline-success">Message</p></a>
			<a><p class="btn btn-outline-danger">Like</p></a>
			</article>
			</c:if>
			<article class="detail-other">
			<p class="article-counts">관심 0 ∙ 조회 ${bean.product_readcount }</p>
			</article>
			</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>