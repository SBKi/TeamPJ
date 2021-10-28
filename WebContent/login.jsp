<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ANBD</title>
<link rel="stylesheet" href="css/login.css?v=3">
</head>
<body>
	<div id="login">
		<div id="body" style="padding-top: 75px;">
			<div class="container">
				<div class="ANBD_logo">
					<img src="img/logo.png?v3"
						onclick="location.href='index.do'"
						style="cursor: pointer;">
				</div>
				<div class="header_title">로그인</div>
				<form action="loginAction.do" method="post">
					<div class="input_section">
						<input class="input" type="text" id="id" name="member_id" placeholder="ID">
						<input class="input" type="password" id="password" name="member_password" placeholder="PASSWORD">
					</div>
					<input class="button1 input" type="submit" id="" value="로그인" class="login_button">
				</form>
				<div class="login_line"></div>
					<div class="button_section">
						<a class="" href="find_id.do">아이디 찾기</a>
						<span class="hor_line">|</span>
						<a class="" href="find_password.do">비밀번호 찾기</a>
						<span class="hor_line ">|</span>
						<a class="" href="join.do">회원가입</a>
					</div>
			</div>
		</div>
	</div>
</body>
</html>