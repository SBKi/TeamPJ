<%@include file="../../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/admin.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
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
                        <a class="list-group-item " href="Admin.do"> <i   class="bi bi-info-circle" style="margin-right: 10px;"></i>통계</a> 
                        <a class="list-group-item active" href="Admin-Product.do"><i class="bi bi-cart-fill"  style="margin-right: 10px;">   </i>상품 관리<span   class="badge badge-success">${cnt.product }</span></a> 
                        <a class="list-group-item" href="Admin-Member.do"><i class="bi bi-people-fill"    style="margin-right: 10px;"></i>회원 관리<span   class="badge badge-success">${cnt.buy }</span></a> 
                        <a   class="list-group-item" href="Admin-Category.do"><i class="bi bi-journal-text" style="margin-right: 10px;"></i>카테고리    관리<span class="badge badge-success">${cnt.sell }</span></a>
                     </div>
                  </div>
               </div>
               <div class="col-md-8">
                  <h3>신고 상품 내역</h3>
                  <div class="row">
                     <table class="table">
                        <tr>
                           <th>상품 번호</th>
                           <th>판매자 ID</th>
                           <th>상품 제목</th>
                        </tr>
                        <c:forEach items="${list }" var="item">
                        <tr data-toggle="collapse" href="#product_${item.product_no }"aria-expanded="false" aria-controls="product_${item.product_no }">
                                 <td>${item.product_no }</td>
                                 <td>${item.product_seller }</td>
                                 <td>${item.product_name }</td>
                              </tr>
                           <tr class="collapse" id="product_${item.product_no }">
                              <td colspan="3">
                              
                              <div class="a-d-t">
                              <c:forEach items="${de_list }" var="de_item">
                                 <c:if test="${item.product_no == de_item.declration_product_no}">
                                 <p> - ${de_item.declration_id } : <span>${de_item.declration_comment }</span><a style="margin-left: 1em;" href="Admin_Declaration_Delete.do?pno=${de_item.declration_no }"><i class="bi bi-x-circle" ></i></a></p>
                                 
                                 </c:if>
                              </c:forEach>
                              </div>
                                 <div class="product-detail-btn">
                                    <a href="detail.do?pno=${item.product_no }" class="btn btn-success btn-block">상품 확인</a> 
                                    <a class="btn btn-danger btn-block" href="Admin_Product_Delete.do?pno=${item.product_no }">게시물 삭제</a>
                                 </div></td>
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
<%@include file="../../include/footer.jsp"%>