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
								<a class="list-group-item" href="Admin-Member.do"><i class="bi bi-people-fill" 	style="margin-right: 10px;"></i>회원 관리<span	class="badge badge-success">${cnt.buy }</span></a>
								<a	class="list-group-item active" href="Admin-Category.do"><i class="bi bi-journal-text" style="margin-right: 10px;"></i>카테고리 	관리<span class="badge badge-success">${cnt.sell }</span></a>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<h3>카테고리 관리</h3>
						<div class="row">
							<div>
								<p class="category-sub">
								<form action="Admin_category_Add.do" method="post">
									<input type="text" placeholder="카테고리 제목" class="category-subject" name="category_name">
									<input type="submit" class="btn btn-success" value="추가">
								</form>
								</p>
							</div>
							<ul class="list-group">
							  <li class="list-group-item"><h4>목록</h4></li>
							 	<c:forEach items="${list }" var="item">
							  <li class="list-group-item">${item.category_name }<a class="btn btn-danger" href="Admin_category_delete.do?Cno=${item.category_no }">삭제</a></li>
							 	</c:forEach>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function getIng(){
		alert('활동 회원');
	}function getDel(){
		alert('탙뢰 회원');
	}
</script>
<%@include file="../../include/footer.jsp"%>