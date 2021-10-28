<%@include file="../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/admin.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
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
											<a href="Admin.do"> <img src="/img/${user_img }"class="rounded-circle" width="150" height="150" id="preview-image"></a>
										</div>
								</div>
							</div>
						</div>
						<div class="card mt-3">
							<div class="list-group list-group-flush">
								<a class="list-group-item " href="Admin.do"> <i	class="bi bi-info-circle" style="margin-right: 10px;"></i>통계</a> 
								<a class="list-group-item " href="Admin-Product.do"><i class="bi bi-cart-fill"  style="margin-right: 10px;">	</i>상품 관리<span	class="badge badge-success">${cnt.product }</span></a> 
								<a class="list-group-item active" href="Admin-Member.do"><i class="bi bi-people-fill" 	style="margin-right: 10px;"></i>회원 관리<span	class="badge badge-success">${cnt.buy }</span></a>  
								<a	class="list-group-item" href="Admin-Category.do"><i class="bi bi-journal-text" style="margin-right: 10px;"></i>카테고리 	관리<span class="badge badge-success">${cnt.sell }</span></a>
							</div>
						</div>
					</div>
					<div class="col-md-8">
							<h3>아나바다 회원 관리</h3>
							<div class="card mb-3">
								<div class="card-body">
									<h4 style="margin-bottom: 20px;">
										<i class="bi bi-people-fill" style="margin-right: 10px;"></i>회원
										내역
									</h4>
									<table class="table table-hover">
										<tr>
											<th><p class="product_list_p">아이디</p></th>
											<th><p class="product_list_p">이름</p></th>
											<th><p class="product_list_p">전화번호</p></th>
											<th><p class="product_list_p">이메일</p></th>
											<th><p class="product_list_p">탈퇴</p></th>
											
										</tr>
										<c:forEach items="${list }" var="user" varStatus="index">
										<tr>
											<td style="width: 8em;"><p class="product_list_p">${user.member_id }</p></td>
											<td style="width: 8em;"><p class="product_list_p">${user.member_name }</p></td>
											<td style="width: 8em;"><p class="product_list_p">${user.member_tel }</p></td>
											<td style="width: 8em;"><p class="product_list_p">${user.member_email }</p></td>
											<td>
                			<a class="btn btn-danger" href="Admin_Member_Delete.do?member_id=${user.member_id }"><i class="bi bi-person-dash-fill"></i></a>
                		</td>
										</tr>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="card mb-3">
								<div class="card-body">
									<h4 style="margin-bottom: 20px;">
										<i class="bi bi-bag-fill" style="margin-right: 10px;"></i>탈퇴 회원
										내역
									</h4>
									<table class="table table-hover">
										<tr>
											<th><p class="product_list_p">아이디</p></th>
											<th><p class="product_list_p">이름</p></th>
											<th><p class="product_list_p">전화번호</p></th>
											<th><p class="product_list_p">이메일</p></th>
											<th><p class="product_list_p">복구</p></th>
											
										</tr>
										<c:forEach items="${Wuser }" var="user" varStatus="index">
										<tr>
											<td style="width: 8em;"><p class="product_list_p">${user.member_id }</p></td>
											<td style="width: 8em;"><p class="product_list_p">${user.member_name }</p></td>
											<td style="width: 8em;"><p class="product_list_p">${user.member_tel }</p></td>
											<td style="width: 8em;"><p class="product_list_p">${user.member_email }</p></td>
											<td>
                			<a href="Admin_Member_Recover.do?member_id=${user.member_id }"><p class="btn btn-success"><i class="bi bi-person-plus-fill"></i></p></a>
                		</td>
										</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="../../include/footer.jsp"%>