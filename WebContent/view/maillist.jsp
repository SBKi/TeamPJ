<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/my_product.css">
<link rel="stylesheet" type="text/css" href="./css/maillist.css">

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
	                    <img src="" class="rounded-circle" width="150" height="150" id="preview-image">
					</div>
                    <div class="mt-3">
                      <h4>홍길동</h4>
                      <p class="text-muted font-size-sm">서울 광진구 자양동 841-1</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <div class="list-group list-group-flush"> 
                    <a class="list-group-item " href="mypage.do"> <i class="bi bi-info-circle" style="margin-right: 10px;"></i>개인 정보 변경</a>
                    <a class="list-group-item  " href="my_product.do"> <i class="bi bi-bag-plus" style="margin-right: 10px;"></i>판매 물품 관리<span class="badge badge-success">3</span></a>
                     <a class="list-group-item " href="purchaselist.do"><i class="bi bi-bag-fill" style="margin-right: 10px;"></i>구매 내역<span class="badge badge-success">4</span></a>
                    <a class="list-group-item"  href="saleslist.do"> <i class="bi bi-journal-text" style="margin-right: 10px;"></i>판매 내역<span class="badge badge-success">12</span></a>
                     <a class="list-group-item " href="favoriteslist.do"><i class="bi bi-heart-fill" style="margin-right: 10px;"></i>관심 목록<span class="badge badge-success">22</span></a>
                     <a class="list-group-item active" href="maillist.do"><i class="bi bi-mailbox" style="margin-right: 10px;"></i>쪽지 함<span class="badge badge-success">22</span></a>
                  </div>
              </div>
            </div>
            
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                <h4 style="margin-bottom: 20px; display: inline-block;"><i class="bi bi-mailbox" style="margin-right: 10px;"></i>쪽지 함</h4>
                <table class="table table-hover">
                	<tr>
                		<th>보낸사람</th>
                		<th>상품이름</th>
                		<th>쪽지</th>
                	</tr>
                	<!-- 상품 한개 시작-->
                	<tr  data-toggle="collapse" href="#product_1" aria-expanded="false" aria-controls="product_1">
                		<td>admin</td>
                		<td>조낸맛잇는 커피</td>
                		<td><a class="btn btn-success"><i class="bi bi-plus"></i></a></td>
                	</tr>
                	<tr class="collapse" id="product_1">
                		<td colspan="3">
                			<div class="mail-chat">
                			<div class="sender-wrap">
                				<p>보내는사람</p>
                				내용입니다.
                				<span>2021-02-39-12:32</span>
                			</div>
                			<div class="getter-wrap">
                				<span>2021-02-39-12:32</span>
                				내용입니다.
                			</div>
                			</div>
<div class="product-detail-btn row">
	<a class="btn btn-success btn-success-cus">거래 완료</a>
	<a class="btn btn-danger btn-danger-cus">쪽지 삭제</a>
</div>
                		</td>
                	</tr>
                	<!-- 상품  한개 끝-->
                	<tr  data-toggle="collapse" href="#product_2" aria-expanded="false" aria-controls="product_2">
                		<td>shinbeomki</td>
                		<td>조낸맛잇는 커32피</td>
                		<td><a class="btn btn-success"><i class="bi bi-plus"></i></a></td>
                	</tr>
                	<tr class="collapse" id="product_2">
                		<td colspan="4">
                			<pre>포맷완료했습니다(윈도우10 설치완료)
14Z970-TA50K 검색하시면 스팩 자세히 나와있습니다.
새제품이 아직도 150넘게 팔리고있네요.

화면터치 가능해서 업무효율이 높으며,
학생/직장인 모두 사용하시기에 좋을거같아요.
제일 좋은점이 무게가 1kg도 안되게 가볍다는 점입니다.
영상시청용/인강용/사무용/업무용/미팅용노트북으로 바로 가져다가쓰시면됩니다.
정말 깨끗하게 사용하였고, 미팅용 이외에는 사용하지않았습니다.
사용하던 파우치와 사용하던 마우스 같이드리겠습니다.
구성은 노트북+파우치+전원어댑터+마우스 입니다.
직거래희망합니다. 가까운거리는 가져다드려요~

중고제품 특성상 구매시 환불 어렵습니다.
편하게 연락주세요~~</pre>
<div class="product-detail-btn row">
	<a class="btn btn-success btn-success-cus">거래 완료</a>
	<a class="btn btn-danger btn-danger-cus">쪽지 삭제</a>
</div>
                		</td>
                	</tr>
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