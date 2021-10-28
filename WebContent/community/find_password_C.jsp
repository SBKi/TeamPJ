<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/login.css?v=3">
<link rel="stylesheet" href="css/find.css?v=3">
</head>
<body>
	<div id="login">
		<div id="body" style="padding-top: 19.5px;">
			<div class="container" style="padding-top: 28px;">
				<div class="ANBD_logo">
					<img src="img/logo.png?v3"
						onclick="location.href='./index.jsp'" style="cursor: pointer;">
				</div>
				<div class="header_title">비밀번호 재설정</div>
				<div class="navigation_list">
						<div class="navigation_item ">01</div>
						<div class="navigation_item on">02 본인인증</div>
					</div>
				<form action="update_password.do" method="post">
				<input type="hidden" name="member_id" value="${bean.member_id}">
				<div class="login_line"></div>
				<div class="input_section">
				<input class="input" type="password" id="pswd1" name="member_password" placeholder="비밀번호(8자 이상)" required="required">
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="password" id="pswd2" placeholder="비밀번호 재확인" required="required" maxlength="20"required="required">
						<span class="error_next_box"></span>
				
				</div>
				<div>
					<input class="button1 input" type="submit" value="확인">
				</div>
				</form>
				<div class="button_section">
					<a class="" href="../find_id.do">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="../find_password.do">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="./join.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	
	<script src="../js/main.js"  type="text/javascript"></script>
</body>
</html>