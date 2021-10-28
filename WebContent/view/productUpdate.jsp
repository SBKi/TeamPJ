<%@include file="/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/productAdd.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<section class="home-main-section">
	<div class="main_area">
		<div class="main_area_center">
			<div class="main">
				<div class="breadcrumbs">
					<ul>
						<li><a href="index.do">HOME</a></li>
						<li>&gt; 상품 수정</li>
					</ul>
				</div>
				<div class="regist_top">
					<div class="regist_box_top">
						<div>상품 수정</div>
					</div>
				</div>
				<form action="UpdateProduct.do" method="post"
					enctype="multipart/form-data">
					<div class="regist_box">
						<div class="description">
							<dl class="regist_image_dl" id="images_box">
								<dt>
									<label style="color: rgb(0, 0, 0);">상품사진</label>
								</dt>
								<dd>
									<div class="container-fluid">
										<div class="col-md-6">
											<div class="form-group">
												<a>최대 3개까지만 업로드 가능합니다.</a> 
												<input type="file" name="product_img1" class="form-control user_picked_files" accept="image/*" required />
												<input type="file" name="product_img2" class="form-control user_picked_files" accept="image/*"  />
												<input type="file" name="product_img3" class="form-control user_picked_files" accept="image/*"  />
											</div>
											<ul class="cvf_uploaded_files">
											</ul>
										</div>
									</div>
									<input type="hidden" name="product_no"
										value="${list.product_no }">
									<ul class="image_list">
										<li file="${list.product_img1 }"><img class="item_img"
											src="/img/${list.product_img1 }"> <a href="#"
											class="cvf_delete_image" title="Cancel"> <img
												class="delete-btn" src="img/delete.png"></a></li>
									</ul>
								</dd>
							</dl>
							<dl id="title">
								<dt>
									<label style="color: rgb(0, 0, 0);">상품제목</label>
								</dt>
								<dd>
									<input type="text" class="title_input" name="product_name"
										placeholder="상품 제목을 입력해주세요." value="${list.product_name }">
								</dd>
							</dl>
							<dl id="product_category">
								<dt>
									<label style="color: rgb(0, 0, 0);">카테고리</label>
								</dt>
								<dd>
									<div class="item_select_box">
										<select name="product_category">
											<option value="${list.product_category }" selected="selected">${list.product_category }</option>
												<c:forEach items="${category }" var="item">
											<option value="${item.category_name}">${item.category_name }</option>
												</c:forEach>
										</select>
									</div>
								</dd>
							</dl>
							<dl id="content">
								<dt>
									<label style="color: rgb(0, 0, 0);">상품설명</label>
								</dt>
								<dd>
									<textarea rows="5" class="introduce" name="product_content"
										placeholder="상품 설명을 입력해주세요."
										style="margin: 0px; width: 658px; height: 173px;">${list.product_content }</textarea>
								</dd>
							</dl>
							<dl class="sell_method_box">
								<dt>
									<label id="price" style="color: rgb(0, 0, 0);">상품가격</label>
								</dt>
								<dd>
									<div class="box_sell_method box_area">
										<div class="box_price">
											<input type="text" name="product_price"
												placeholder="가격을 입력해주세요." value="${list.product_price }"
												style="width: 90%; max-width: 280px; height: 38px;"><span
												class="input_span_text">원</span>
										</div>
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="item_submit_box">
						<div class="item_area_submit_box">
							<a href="my_product.do">
								<button class="btn_item_cancel" type="button">취소</button>
							</a> <input class="btn_item_submit" type="submit" value="상품 수정하기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="imgUpload.js"></script>
</section>
<%@include file="/include/footer.jsp"%>