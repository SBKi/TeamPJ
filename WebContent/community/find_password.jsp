<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<link rel="stylesheet" href="./css/login.css?v=3">
<link rel="stylesheet" href="./css/find.css?v=3">
</head>
<body>
	<div id="login">
		<div id="body" style="padding-top: 19.5px;">
			<div class="container" style="padding-top: 28px;">
				<div class="ANBD_logo">
					<img src="./img/logo.png?v3"
						onclick="location.href='index.do'" style="cursor: pointer;">
				</div>
				<div>
					<div class="header_title">비밀번호 찾기</div>
					<div class="navigation_list">
						<div class="navigation_item on">01 본인인증</div>
						<div class="navigation_item">02</div>
					</div>
				</div>
				<div class="login_line"></div>
				<form action="find_id.do" method="post">
					<div class="input_section">
						<input class="input" type="text" id="id" placeholder="아이디">
						<input class="input" type="text" id="phone" placeholder="본인 휴대폰번호">
					</div>
					<div>
						<input class="button input" type="submit" value="확인">
						<input class="button input" type="button" value="취소" onclick="location.href='login.do'">
					</div>
				</form>
				<div class="button_section">
					<a class="" href="find_id.do">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="find_password.do">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="./join.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>