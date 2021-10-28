<%@include file="/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/orderProfile.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<style>
body{height: 0;}
footer { position: absolute; bottom: 0;}
</style>
<section class="content">
	<div class="item_list_area">
		<h1>회원프로필</h1>
		<div class="breadcrumbs" id="breadcrumbs">
			<ul>
				<li><a href="index.do">HOME</a></li>
				<li>&gt; ${user.member_name} 님 프로필</li>
			</ul>
		</div>
		<div class="main_area">
			<div class="main_area_center">
				<div class="main">
					<h2>회원프로필 영역</h2>
					<div class="my_profile_left">
						<div class="my_profile_info">
							<div class="my_profile_image">
								<img src="/img/${user.member_img1 }">
							</div>
							<div class="my_profile_nick">${user.member_name}</div>
							<div class="my_profile_shop_created">
								<div class="my_profile_shop"></div>
							</div>
							<div class="my_profile_follow_box">
								<div class="my_profile_follow_info">
								</div>
							</div>
							<div class="my_profile_pro_review">
								<div class="my_profile_pro_review_box">
									<a href=""><span>상품</span><span>${count }</span></a>
								</div>
							</div>
						</div>
					</div>
					<h2>회원 탭 영역</h2>
					<section class="left_main profile_right_main">
						<div class="my_profile_item_menu">
							<ul>
								<li class="active"><a class="active"
									href="">판매상품</a></li>
							</ul>
						</div>
						<div class="tab_content">
							<div class="cat_box no_cat_box">
								<div class="my_specialist_name">
									전체&nbsp;<span>${count }</span>
								</div>
							</div>
							<div class="tab_content">
								<div>
									<div class="infinite-scroll-component "
										style="height: auto; overflow: auto;">
										<ul class="mian_row profile_main_row">
											<div class="row">
											</div>
											<c:forEach items="${list }" var="item" varStatus="index">
											<li class="main_col_3"><div class="dibs_card">
													<button type="button"></button>
												</div> <a class="card card_list" style="border: none;"
												onclick="location.href='detail.do?pno=${item.product_no}'">
												<div class="card_box">
														<div class="image_wrapper">
															<div class="image_outside">
																<div class="image_centerbox">
																	<img
																		src="/img/${item.product_img1 }"
																		class="thumbnail_img" alt="${item.product_name }">
																</div>
															</div>
														</div>
														<div class="cont">
															<div class="item_title">${item.product_name }</div>
															<div class="item_price profile_price">
															<fmt:formatNumber value="${item.product_price }" pattern="#,###"/>원
															</div>
														</div>
													</div></a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/include/footer.jsp"%>