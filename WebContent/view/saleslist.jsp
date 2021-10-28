<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/my_product.css">

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
                    <a class="list-group-item " href="modifyProfile_Check.do"> <i class="bi bi-info-circle" style="margin-right: 10px;"></i>개인 정보 변경</a>
                    <a class="list-group-item " href="my_product.do"> <i class="bi bi-bag-plus" style="margin-right: 10px;"></i>판매 물품 관리<span class="badge badge-success">${cnt.product }</span></a>
                     <a class="list-group-item " href="purchaselist.do"><i class="bi bi-bag-fill" style="margin-right: 10px;"></i>구매 내역<span class="badge badge-success">${cnt.buy }</span></a>
                    <a class="list-group-item active"  href="saleslist.do"> <i class="bi bi-journal-text" style="margin-right: 10px;"></i>판매 내역<span class="badge badge-success">${cnt.sell }</span></a>
                     <a class="list-group-item " href="favoriteslist.do"><i class="bi bi-heart-fill" style="margin-right: 10px;"></i>관심 목록<span class="badge badge-success">${cnt.like }</span></a>
                     <a class="list-group-item" href="mail.do"><i class="bi bi-mailbox" style="margin-right: 10px;"></i>쪽지 함<span class="badge badge-success">${cnt.mail }</span></a>
                  </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                <h4 style="margin-bottom: 20px;"><i class="bi bi-journal-text" style="margin-right: 10px;"></i>판매 내역</h4>
                <table class="table table-hover">
                	<tr>
                		<th><p class="product_list_p">구매자</p></th>
                		<th><p class="product_list_p">상품이름</p></th>
                		<th><p class="product_list_p">거래날짜</p></th>
                		<th><p class="product_list_p">가격</p></th>
                	</tr>
                	<c:forEach items="${list }" var="item" varStatus="index">
                	<tr>
                		<td><p class="product_list_p">${memlist[index.count-1].member_name}</p></td>
						<td><p class="product_list_p">${item.product_name}</p></td>
						<td><p class="product_list_p"><fmt:formatDate value="${item.product_done_date}" pattern="yyyy-MM-dd"/></p></td>
						<td><p class="product_list_p"><fmt:formatNumber value="${item.product_price}" pattern="#,###"/>원</p></td>
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
</div>
<%@include file="../include/footer.jsp"%>