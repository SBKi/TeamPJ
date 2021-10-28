<%@include file="../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/admin.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div class="mypage-main-section">
	<div class="mypage-section1">
		<div class="container">
			<div class="main-body">

				<div class="row gutters-sm">
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<div class="d-flex flex-column align-items-center text-center">
										<div class="filebox">
											<a href="Admin.do"> <img src="/img/${user_img }"class="rounded-circle" width="150" height="150"	id="preview-image">	</a>
										</div>
								</div>
							</div>
						</div>
					<div class="card mt-3">
							<div class="list-group list-group-flush">
								<a class="list-group-item active" href="Admin.do"> <i	class="bi bi-info-circle" style="margin-right: 10px;"></i>통계</a> 
								<a class="list-group-item " href="Admin-Product.do"><i class="bi bi-cart-fill"  style="margin-right: 10px;"></i>상품 관리<span	class="badge badge-success">${cnt.product }</span></a> 
								<a class="list-group-item" href="Admin-Member.do"><i class="bi bi-people-fill" 	style="margin-right: 10px;"></i>회원 관리<span	class="badge badge-success">${cnt.buy }</span></a>
								<a	class="list-group-item" href="Admin-Category.do"><i class="bi bi-journal-text" style="margin-right: 10px;"></i>카테고리 	관리<span class="badge badge-success">${cnt.sell }</span></a>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<h3>아나바다 통계</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="card admin-card">
									<a href="#">
										<h4>상품</h4>
										<div class="admin-card-div">
											<p>거래 완료 상품 :
											<span class="card-text"><fmt:formatNumber value="${done_product }" pattern="#,###"/>개</span>
											</p>
											<p>거래 중 상품 :
											<span class="card-text"><fmt:formatNumber value="${ing_product }" pattern="#,###"/>개</span>
											<p>총 거래 금액 :
											<span class="card-text"><fmt:formatNumber value="${total_product }" pattern="#,###"/>원</span>
										</div>
									</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card admin-card">
									<a href="Admin-Member.do">
										<h4>회원</h4>
										<div class="admin-card-div">
											<br>
											<p>활동중인 회원 :
											<span class="card-text"><fmt:formatNumber value="${ing_member }" pattern="#,###"/>명</span>
											<p>탈퇴한 회원 :
											<span class="card-text"><fmt:formatNumber value="${done_member }" pattern="#,###"/>명</span>
										</div>
									</a>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="card admin-card">
									<a href="Admin-Product.do">
										<h4>신고</h4>
										<div class="admin-card-div">
											<br><br>
											<p>신고 건수 :
												<span class="card-text"><fmt:formatNumber value="${decal_product }" pattern="#,###"/>개</span>
										</div>
									</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card admin-card">
									<a href="Admin-Category.do">
										<h4>카테고리</h4>
										<div class="admin-card-div">
										<br><br>
											<p>카테고리 개수 :
												<span class="card-text"><fmt:formatNumber value="${category_cnt }" pattern="#,###"/>개</span>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<%@include file="../../include/footer.jsp"%>