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
	                    <img src="/img/${member.member_img1 }" class="rounded-circle" width="150" height="150" id="preview-image">
	                    <label for="input-image">변경</label>
						<input type="file" id="input-image" name="img1">
					</div>
                    <div class="mt-3">
                      <h4>${member.member_name}</h4>
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
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">이름</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" name="name" id="name" class="form-control" value="${member.member_name }">
                    </div>
                  </div>
                  <hr>     
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">아이디</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" disabled="disabled" class="form-control" value="${member.member_id }" >
                    <input type="hidden" name="id" value="${member.member_id }">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">비밀번호</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="password"class="form-control" name="password"  id="pswd1" >
                    </div>
                  </div> 
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">비밀번호 확인</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="password" class="form-control"  id="pswd2"  >
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3"> 
                      <h6 class="mb-0">전화번호</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="text" class="form-control" value="${member.member_tel }" name="tel" id="tel" >
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">메일</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                   		 <input type="text" class="form-control" value="${member.member_email }" name="email" id="email" >
                    </div>
                  </div>
                    <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">주소</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      	 <input type="text" class="form-control" value="${member.member_address  }" name="address" id="address" >
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <button class="btn btn-outline-success btn-block" type="button" id="submit-btn">수정</button>
                      <button class="btn btn-outline-danger btn-block" type="button" id="delete-btn">회원 탈퇴</button>
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
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
		
		if(document.getElementById('pswd1').value != document.getElementById('pswd2').value){
			alert('비밀번호를 확인해주세요!');				
		}else if((document.getElementById('pswd1').value == "")){
			alert('비밀번호를 확인해주세요!');	
		}else if((document.getElementById('pswd1').value.length<8)){
			alert('비밀번호 길이는 8자 이상입니다.');	
		}else if (document.getElementById('name').value == "") {
			alert('이름을 확인해주세요!');
		} else if (document.getElementById('tel').value == "") {
			alert('전화번호를 확인해주세요!');
		}else if (document.getElementById('email').value == "") {
			alert('이메일을 확인해주세요!');
		}else if(!emailRule.test($("input[id='email']").val())) {            
			alert('이메일을 확인해주세요!(정규식)');
		} else if (document.getElementById('address').value == "") {
			alert('주소를 확인해주세요!');
		} else {
		document.getElementById('frm').submit();
		return false
		}
	}		
	
	document.getElementById('delete-btn').onclick=function(){
		 if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
			document.getElementById('frm').action='MemberDeleteAction.do';
			document.getElementById('frm').enctype='application/x-www-form-urlencoded';
			document.getElementById('frm').submit();

		 }else{   //취소
		     return false;
		 }
	}	
};
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