<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/login.css?v=3">
<link rel="stylesheet" href="./css/find.css?v=3">
</head>
<body>
<%
	Object name = session.getAttribute("user_name");
	Object id = session.getAttribute("user_id");
	Object tel = session.getAttribute("user_tel");
	Object email = session.getAttribute("user_email");
	Object address = session.getAttribute("user_address");
	String user_id = (String)id;
	String user_name = (String)name;
	String user_tel = (String)tel;
	String user_email = (String)email;
	String user_address = (String)address;
%>
	<div id="login">
		<div id="body" style="padding-top: 19.5px;">
			<div class="container" style="padding-top: 28px;">
				<div class="ANBD_logo">
					<img src="./img/logo.png?v3"
						onclick="location.href='./index.jsp'" style="cursor: pointer;">
				</div>
				<div class="header_title">회원가입을 축하드립니다!!</div>
				<div class="login_line"></div>
				<div class="">
					<table>
					<tr> 
					<td>아이디 : </td>
					<td>${user_id }</td>
					</tr>
					<tr> 
					<td>이름 : </td>
					<td>${user_name }</td>
					</tr>
					<tr> 
					<td>전화번호 : </td>
					<td>${user_tel }</td>
					</tr>
					<tr> 
					<td>이메일 : </td>
					<td>${user_email }</td>
					</tr>
					<tr> 
					<td>주소 : </td>
					<td>${user_address }</td>
					</tr>
					</table>
					
				</div>
				<div>
					<input class="button input" type="button" value="확인" onclick="location.href='./index.do'">
					<input class="button input" type="button" value="수정" onclick="location.href='update.jsp'">
				</div>
				<div class="button_section">
					<a class="" href="find_id.do">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="find_password.do">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="sign_up.do">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>