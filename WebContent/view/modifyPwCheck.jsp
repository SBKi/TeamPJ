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
                    <div class="filebox">
	                   <a href="mypage.do">
										<img  src="/img/${user_img }" class="rounded-circle"width="150" height="150" id="preview-image">
										</a>
					</div>
                    <div class="mt-3">
                      <h4>${user_name}</h4>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
                <div class="list-group list-group-flush"> 
                    <a class="list-group-item active" href="modifyProfile_Check.do"> <i class="bi bi-info-circle" style="margin-right: 10px;"></i>개인 정보 변경</a>
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
                      <h6 class="mb-0">비밀번호 확인</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    	<form action="modifyProfile_CheckAction.do" method="post" id="frm">
                    	 <input type="hidden" name="id" value="${user_id }">
                    	 <div style="display: flex;">
                      	 <input type="password" class="form-control" id="pswd1" name="password" required>
                      	 <span class="btn btn-success" style="margin-left: 1em; width: 5em" id="submit-btn">확인</span>
                      	 </div>
                      	 </form>
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
window.onload = function(){
	document.getElementById('submit-btn').onclick=function(){
		
		if((document.getElementById('pswd1').value == "")){
			alert('비밀번호를 확인해주세요!');	
		}else{
		document.getElementById('frm').submit();
		return false
		}
	}		
};
</script>
<%@include file="../include/footer.jsp"%>