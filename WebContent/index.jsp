<%@page import="com.jcpdev.dao.ProductDao"%>
<%@page import="com.jcpdev.dto.Product"%>
<%@page import="java.net.URLDecoder"%>
<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/upScroll.css">
<link rel="stylesheet" type="text/css" href="css/cookie.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<section class="home-main-section" style="display: flex;">
		
	<div class="row" style="width: 90%;">
	<h2 style="font-size: 1.5rem; margin-bottom: 1.5rem;">오늘의 상품 추천</h2>
		<c:forEach items="${list }" var="item" varStatus="index">
			<div class="card col-md-3 col-sm-6"
				onclick="location.href='detail.do?pno=${item.product_no}'">
				<img src="/img/${item.product_img1 }" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title size_limite">${item.product_name }</h5>
					<div class="card-text">
						<span style="font-weight: bold;"> <fmt:formatNumber
								value="${item.product_price }" pattern="#,###" />원
						</span><span class="card-span"><i class="bi bi-heart-fill"></i>
							${item.product_like }</span>
					</div>
				</div>
			</div>
		</c:forEach>
		 <div id="add"></div>
		 <button id="get" class="getList"  onclick="getList('${StartNo }','${EndNo }')">더보기</button>
		<div class="scroll_top_btn_warpper">
		<div class="scroll_top_btn">
		<a href="#header"></a>
		<img id="back-to-top" src="https://ccimage.hellomarket.com/web/2020/icon/btn_top_n_x2.png" alt="페이지 업 버튼">
		</div>
		</div>
	</div>
	<div class="cookie_status">
	</div>
<div class="cookie_div">
	<div class="cookie_status">
	<h5>최근 본 상품</h5>
	</div>
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
</section>

<script type="text/javascript">
$(function(){
	  $('#back-to-top').on('click',function(e){
	      e.preventDefault();
	      $('html,body').animate({scrollTop:0},600);
	  });
	  
	  $(window).scroll(function() {
	    if ($(document).scrollTop() > 10) {
	      $('#back-to-top').addClass('show');
	    } else {
	      $('#back-to-top').removeClass('show');
	    }
	  });
	});
	
function getList(StartNo,EndNo){
	$.ajax({
			type : 'post',
			url : './view/mail/index_Ajax.jsp',
			data : {"StartNo":StartNo,"EndNo":EndNo}, 
			dataType : 'html', 
			success : function(data) { 
				$('#add').html(data); 
				$('#get').remove();
			}
		});
	}
</script>
<%@include file="include/footer.jsp"%>