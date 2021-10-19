<%@include file="/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mail.css">

<section class="content">
	<div id="__next">
		<section class="content">
			<div class="main_area">
				<div class="left_main">
					<div class="left_main_header">
						<div class="title">아나바다</div>
					</div>
					<ul>
					<c:forEach items="${list }" var="item"> <!-- room 반복 -->
					
						<div class="card_box active">
							<a href="">
								<li>
								<div class="profile">
									<img src="/img/${item.img}" alt="${item.name }">
								</div>
								<div class="info">
									<div class="nick">${item.name }</div>
									<div class="description">${item.product_name }</div>
<!-- 									<div class="time_ago">날짜</div> -->
								</div>
							</li>
							</a>
						</div>
					</c:forEach>
					</ul>
				</div>
				<div class="right_main">
					<div class="chat_header">
						<a href="" target="_blank" rel="noopener noreferrer">
							<div class="image_box">
								<div class="image_table">
									<img src="./img/logo.png" alt="장치영 프로필 이미지">
								</div>
							</div>
							<div class="info">
								<div>
									<span>장치영</span><span>판매상품 노트북
									</span>
								</div>
							</div>
						</a>
						<div class="declaration">
							<div>
								<img
									src="https://ccimage.hellomarket.com/web/2019/chat/btn_hellotalk_report_x2.png"
									alt="신고 이미지">
							</div>
						</div>
						<a href="/messages">
							<div class="chat_close"></div>
						</a>
					</div>
					<div class="chat_description" style="bottom: 49px"></div>
					<div class="chat_footer">
						<form action="mailSend.jsp">
							<div class="chat_footer_area">
								<input class="chat_input" type="text" contenteditable="true"
									placeholder="메세지를 입력해주세요.">
							</div>
							<button type="submit">전송</button>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	</div>
</section>
<%@include file="/include/footer.jsp"%>