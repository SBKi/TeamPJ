<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/mypage.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/detail-imgslice.css">
<link rel="stylesheet" type="text/css" href="./css/detail.css">

<div class="mypage-main-section">
	<div class="mypage-section1">
		<div class="container">
			<div class="main-body">
			<div class="card">
			<article class="detail-img">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="http://placehold.it/250x100"width="460" height="345">
      </div>
      <div class="item">
        <img src="http://placehold.it/250x200" width="460" height="345">
      </div>
      <div class="item">
        <img src="http://placehold.it/250x300" width="460" height="345">
      </div>
    </div>

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
			</article>
			<a href="#" class="article-profile-link">
			<article class="detail-profile">
				<img alt="" src="http://placehold.it/250x100">
				<p>admin</p>
			</article></a>
			<article class="detail-content">
			<div class="detail-sub-price">
				<h2 class="detail-subject">상품 이름입니다</h2>
				<p class="detail-price">20,000원</p>
			</div>
			<div>
				<pre>
프라다 밀라노 정품입니다.
품질 보증서 있습니다.
완전 새 제품이구요!
정가 890,000만원 입니다.
사진찍는다고 잠깐 손댄거 빼고 박스에서 꺼내본적도 없는 제품입니다.
관심있으시면 연락주세용^/^
정품인지 정 못 믿으시겠으면 제 인적사항까지 드릴게요.
돈 급해서 팝니다. 연락주세요 ㅠ
				</pre>
			</div>
			</article>
			<article class="detail-other">
			<p class="article-counts">관심 0 ∙ 조회 119</p>
			</article>
			</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>