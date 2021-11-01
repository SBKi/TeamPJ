<%@page import="java.net.URLEncoder"%>
<%@page import="com.jcpdev.dto.Product"%>
<%@page import="com.jcpdev.dao.MemberDao"%>
<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<% 
	Product bean = (Product)request.getAttribute("bean");
	Cookie c = new Cookie("product_cookie"+bean.getProduct_no(),""+bean.getProduct_no());
	response.addCookie(c);
%>
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
			<a href="orderProfile.do?member_id=${mem.member_id }" class="article-profile-link ">
			<article class="detail-profile">
				<img alt="" src="/img/${mem.member_img1 }">
				<p>${mem.member_name }</p>
			</article>
			</a>
			<c:if test="${sessionScope.user_id !=null and  decal_check ==0}">
				<div>
					<img class="decal_button" src="https://ccimage.hellomarket.com/web/2019/chat/btn_hellotalk_report_x2.png" alt="신고 이미지" onclick="decal('${bean.product_no}');">
				</div>
			</c:if>
			<article class="detail-content">
			<div class="detail-sub-price">
				<h2 class="detail-subject">${bean.product_name }</h2>
				<p class="detail-price">
				<fmt:formatNumber value="${bean.product_price }" pattern="#,###"/>원
				</p>
			</div>
			<div>
				<pre class="product_content_pre">${bean.product_content }</pre>
			</div>
			</article>
			<c:if test="${sessionScope.user_id !=null }">
			<c:if test="${bean.product_seller != sessionScope.user_id }"> <!-- 자기상품 아닐때만 보이기 -->
			<article class="detail-message" style="text-align: right;">
			<a href='MakeMail.do?pno=${bean.product_no}'><p class="btn btn-outline-success">Message</p></a>
			<p id="like-btn">
				<c:if test="${favCheck }">
					<button type="button" class="btn btn-outline-secondary"	onclick="location.href='Product_Like.do?Like=like&Pno=${bean.product_no}'">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"	fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				  						<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"></path>
								</svg>
						<span class="visually-hidden">Button</span>
					</button>
				</c:if>
				<c:if test="${!favCheck }">
					<!-- 이미 관심등록 되어있음 -->
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='Product_Like.do?Like=unlike&Pno=${bean.product_no}'">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
				  					<path  fill-rule="evenodd" class="heart"
								d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"></path>
								</svg>
						<span class="visually-hidden">Button</span>
					</button>
				</c:if>
			</p>
			</article>
			</c:if>
			</c:if>
			<article class="detail-other">
			<p class="article-counts">관심 ${bean.product_like} ∙ 조회 ${bean.product_readcount }</p>
			</article>
			</div>
			</div>
		</div>
	</div>
</div>
<script>
	function decal(pno){
		let comment = prompt('신고내용을 입력해주세요.');
		if(comment === ''){
			alert('내용을 입력해주세요.');
			return false;
		}else if(comment ===null){
			alert('취소 하였습니다.');
			return false;
		}else{
			$.ajax({
				type : 'post',
				url : './view/detail_declaration_Ajax.jsp',
				data : {"comment":comment,"p_no":pno}, 
				success : function() {
					alert('신고가 접수되었습니다.');
					location.href='detail.do?pno='+pno;
				}
			});
		}
	}
</script>
<%@include file="../include/footer.jsp"%>