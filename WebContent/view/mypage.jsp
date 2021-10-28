<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div class="mypage-main-section">
	<div class="mypage-section1">
<div class="container">
    <div class="main-body">
    
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                     <form action="update_mypage.do" enctype="multipart/form-data" method="post"  id="frm">
                    <div class="filebox">
	                    <a href="mypage.do">
										<img  src="/img/${user_img }" class="rounded-circle"width="150" height="150" id="preview-image">
										</a>
					</div>
                    <div class="mt-3">
                      <h4>${member.member_name}</h4>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <div class="list-group list-group-flush"> 
                    <a class="list-group-item" href="modifyProfile_Check.do"> <i class="bi bi-info-circle" style="margin-right: 10px;"></i>개인 정보 변경</a>
                    <a class="list-group-item" href="my_product.do"> <i class="bi bi-bag-plus" style="margin-right: 10px;"></i>판매 물품 관리<span class="badge badge-success">${cnt.product }</span></a>
                    <a class="list-group-item" href="purchaselist.do"><i class="bi bi-bag-fill" style="margin-right: 10px;"></i>구매 내역<span class="badge badge-success">${cnt.buy }</span></a>
                    <a class="list-group-item" href="saleslist.do"> <i class="bi bi-journal-text" style="margin-right: 10px;"></i>판매 내역<span class="badge badge-success">${cnt.sell }</span></a>
                    <a class="list-group-item" href="favoriteslist.do"><i class="bi bi-heart-fill" style="margin-right: 10px;"></i>관심 목록<span class="badge badge-success">${cnt.like }</span></a>
                    <a class="list-group-item" href="mail.do"><i class="bi bi-mailbox" style="margin-right: 10px;"></i>쪽지 함<span class="badge badge-success">${cnt.mail }</span></a>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
            <h3>My Profile</h3>
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">이름</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" class="form-control" value="${member.member_name }"disabled="disabled" >
                    </div>
                  </div>
                  <hr>     
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">아이디</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" class="form-control" value="${member.member_id }"disabled="disabled"  >
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3"> 
                      <h6 class="mb-0">전화번호</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" class="form-control" value="${member.member_tel }" disabled="disabled">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">메일</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                   		 <input type="text" class="form-control" value="${member.member_email }"disabled="disabled" >
                    </div>
                  </div>
                    <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">주소</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      	 <input type="text" class="form-control" value="${member.member_address  }" disabled="disabled" >
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
<%@include file="../include/footer.jsp"%>