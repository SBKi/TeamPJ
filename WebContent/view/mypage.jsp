<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">

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
	                    <label for="input-image">변경</label>
						<input type="file" id="input-image">
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
                    <a class="list-group-item active" href="mypage.do"> <i class="bi bi-info-circle" style="margin-right: 10px;"></i>개인 정보 변경</a>
                    <a class="list-group-item" href="my_product.do"> <i class="bi bi-bag-plus" style="margin-right: 10px;"></i>판매 물품 관리<span class="badge badge-success">3</span></a>
                    <a class="list-group-item" href="purchaselist.do"><i class="bi bi-bag-fill" style="margin-right: 10px;"></i>구매 내역<span class="badge badge-success">4</span></a>
                    <a class="list-group-item" href="saleslist.do"> <i class="bi bi-journal-text" style="margin-right: 10px;"></i>판매 내역<span class="badge badge-success">12</span></a>
                    <a class="list-group-item" href="favoriteslist.do"><i class="bi bi-heart-fill" style="margin-right: 10px;"></i>관심 목록<span class="badge badge-success">22</span></a>
                    <a class="list-group-item" href="maillist.do"><i class="bi bi-mailbox" style="margin-right: 10px;"></i>쪽지 함<span class="badge badge-success">22</span></a>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">이름</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" class="form-control" value="홍길동">
                    </div>
                  </div>
                  <hr>     
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">아이디</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" disabled="disabled" class="form-control" value="admin">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">비밀번호</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="password"class="form-control">
                    </div>
                  </div> 
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">비밀번호 확인</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="password" class="form-control" >
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3"> 
                      <h6 class="mb-0">전화번호</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" class="form-control" value="010-2132-2322">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">메일</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                   		 <input type="text" class="form-control" value="hong@nvae.rocm">
                    </div>
                  </div>
                    <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">주소</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      	 <input type="text" class="form-control" value="서울 광진구 자양동 01420-2">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-outline-success btn-block">수정</a>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>

        </div>
    </div>
	</div>
</div>
<script type="text/javascript">
function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader()
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        reader.readAsDataURL(input.files[0])
    }
} 
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
</script>
<%@include file="../include/footer.jsp"%>