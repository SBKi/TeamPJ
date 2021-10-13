<%@include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="style.css">
<section class="home-main-section">
	<div class="main_area">
		<div class="main_area_center">
			<div class="main">
				<div class="breadcrumbs">
					<ul>
						<li><a href="/index.do">HOME</a></li>
						<li>&gt; 상품 등록</li>
					</ul>
				</div>
				<div class="regist_top">
					<div class="regist_box_top">
						<div>상품 등록</div>
					</div>
				</div>
				<form action="/index.do">
					<div class="regist_box">
						<div class="description">
							<dl class="regist_image_dl" id="images_box">
								<dt>
									<label style="color: rgb(0, 0, 0);">상품사진</label>
								</dt>
								<dd>
									<ul class="image_list">
										<input type="file" multiple="" class="multiple">
										<li><div class="up_img_box">

												<img
													src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png"
													class="item_img" alt="상품 등록 이미지">
											</div></li>
										<li><div class="up_img_box">
												<img
													src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png"
													class="item_img" alt="상품 등록 이미지">
											</div></li>
										<li><div class="up_img_box">
												<img
													src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png"
													class="item_img" alt="상품 등록 이미지">
											</div></li>
									</ul>
									<div class="up_img_label">대표이미지</div>
								</dd>
							</dl>
							<dl id="title">
								<dt>
									<label style="color: rgb(0, 0, 0);">상품제목</label>
								</dt>
								<dd>
									<input type="text" name="title" class="title_input"
										placeholder="상품 제목을 입력해주세요." value="">
									<ul class="item_recommend_box"></ul>
								</dd>
							</dl>
							<dl id="category">
								<dt>
									<label style="color: rgb(0, 0, 0);">카테고리</label>
								</dt>
								<dd>
									<div class="item_select_box">
										<select><option value="" hidden="">카테고리</option>
											<option value="HAO0000">스포츠,레저</option>
											<option value="HAN0000">게임</option>
											<option value="HAE0000">유아동,완구</option>
											<option value="HAD0000">뷰티</option>
											<option value="HAA0000">여성의류</option>
											<option value="HAB0000">남성의류</option>
											<option value="HAC0000">신발,가방,잡화</option>
											<option value="HAK0000">휴대폰,태블릿</option>
											<option value="HAI0000">컴퓨터,주변기기</option>
											<option value="HAJ0000">카메라</option>
											<option value="HAH0000">디지털,가전</option>
											<option value="HAL0000">CD,DVD</option>
											<option value="HAM0000">음향기기,악기</option>
											<option value="HAF0000">가구</option>
											<option value="HAG0000">생활</option>
											<option value="HAP0000">도서</option>
											<option value="HAW0000">문구</option>
											<option value="HEB0000">반려동물용품</option>
											<option value="HAU0000">포장식품</option>
											<option value="HZZ0000">기타</option></select>
									</div>
								</dd>
							</dl>
							<dl id="content">
								<dt>
									<label style="color: rgb(0, 0, 0);">상품설명</label>
								</dt>
								<dd>
									<textarea rows="5" class="introduce"
										placeholder="상품 설명을 입력해주세요."
										style="margin: 0px; width: 658px; height: 173px;"></textarea>
								</dd>
							</dl>
							<dl class="sell_method_box">
								<dt>
									<label id="price" style="color: rgb(0, 0, 0);">상품가격</label>
								</dt>
								<dd>
									<div class="box_sell_method box_area">
										<div class="box_price">
											<input type="text" name="price" placeholder="가격을 입력해주세요."
												value="" style="width: 90%; max-width: 280px; height: 38px;"><span
												class="input_span_text">원</span>
										</div>
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="item_submit_box">
						<div class="item_area_submit_box">
							<a href="/">
							<button class="btn_item_cancel" type="button">취소</button></a>
							<input class="btn_item_submit"  type="submit" value="상품 등록하기">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<%@include file="include/footer.jsp"%>