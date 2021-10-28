<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/my_product.css">
<style>
.badge{  padding: .35em .65em;}
</style>
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
										<a href="mypage.do">
										<img  src="/img/${user_img }" class="rounded-circle"width="150" height="150" id="preview-image">
										</a>
									</div>
									    <div class="mt-3">
					                      <h4>${user_name }</h4>
					                    </div>
								</div>
							</div>
						</div>
						<div class="card mt-3">
							<div class="list-group list-group-flush">
								<a class="list-group-item " href="modifyProfile_Check.do"><i class="bi bi-info-circle" style="margin-right: 10px;"></i>개인 정보변경</a>
								<a class="list-group-item active " href="my_product.do"> <i class="bi bi-bag-plus" style="margin-right: 10px;"></i>판매 물품 관리<span class="badge badge-success">${cnt.product }</span></a>
								<a class="list-group-item " href="purchaselist.do">	<i class="bi bi-bag-fill" style="margin-right: 10px;"></i>구매 내역<span class="badge badge-success">${cnt.buy }</span></a> 
								<a class="list-group-item" href="saleslist.do"><i class="bi bi-journal-text" style="margin-right: 10px;"></i>판매 내역<span class="badge badge-success">${cnt.sell }</span></a>
								<a class="list-group-item " href="favoriteslist.do"><i class="bi bi-heart-fill" style="margin-right: 10px;"></i>관심 목록<span	class="badge badge-success">${cnt.like }</span></a>
								<a class="list-group-item" href="mail.do"><i class="bi bi-mailbox" style="margin-right: 10px;"></i>쪽지 함<span 	class="badge badge-success">${cnt.mail }</span></a>
							</div>
						</div>
					</div>

					<div class="col-md-8">
						<div class="card mb-3">
							<div class="card-body">
								<h4 style="margin-bottom: 20px; display: inline-block;">
									<i class="bi bi-bag-plus" style="margin-right: 10px;"></i>판매 물품
									관리
								</h4>
								<div class="btn btn-success" style="float: right;"
									onclick="location.href='productAdd.do'">물품 등록</div>
								<table class="table table-hover">
									<tr>
										<th><p class="product_list_p">상품이름</p></th>
										<th><p class="product_list_p">등록날짜</p></th>
										<th><p class="product_list_p">가격</p></th>
									</tr>
									<!-- 상품 한개 시작-->
									<c:forEach items="${list }" var="item" varStatus="index">
										<tr data-toggle="collapse" href="#product_${index.count }"
											aria-expanded="false" aria-controls="product_${index.count }">
											<td><p class="product_list_p">${item.product_name}</p></td>
											<td><p class="product_list_p"><fmt:formatDate value="${item.product_date}" pattern="yyyy-MM-dd"/></p></td>
											<td><p class="product_list_p"><fmt:formatNumber value="${item.product_price}" pattern="#,###"/>원</p></td>
										</tr>
									<tr class="collapse" id="product_${index.count }">
										<td colspan="4"><img src="/img/${item.product_img1 }" class="product-detail-img"> <pre class="product_content_pre">${item.product_content}</pre>
											<div class="product-detail-btn">
												<a href="GetProduct.do?pno=${item.product_no }" class="btn btn-success btn-block">수정</a> 
												<a class="btn btn-danger btn-block" href="DeleteProduct.do?pno=${item.product_no }">삭제</a>
											</div></td>
									</tr>
									</c:forEach>
									<!-- 상품  한개 끝-->
									
								</table>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>