<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/login.css?v=3">
<link rel="stylesheet" href="css/find.css?v=3">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div id="login">
		<div id="body" style="padding-top: 19.5px;">
			<div class="container" style="padding-top: 28px;">
				<div class="ANBD_logo">
					<img src="img/logo.png?v3"
						onclick="location.href='index.do'" style="cursor: pointer;">
				</div>
				<div class="header_title">회원가입</div>
				<div class="login_line"></div>
				<form action="sign_up.do" method="post">
				
					<div class="input_section">
						<!-- ID -->	
						<input class="input" type="text" id="id" name="id" placeholder="아이디" maxlength="20">
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="password" id="pswd1" name="password" placeholder="비밀번호(8자 이상)" maxlength="20">
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="password" id="pswd2" placeholder="비밀번호 재확인">
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="text" id="name" name="name" placeholder="이름" maxlength="5"> 
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="text" id="tel" name="tel" placeholder="전화번호 입력" maxlength="16"> 
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="email" id="Postcode" name="email" placeholder="본인확인 이메일"> 
						<span class="error_next_box"></span>
						<!-- ID -->	
						<div>
						<input class="input2" type="button" value="주소 검색" onclick="findAddr()"><br>
						<input class="input" type="text" name="address" id="userAddress" placeholder="주소를 입력"/> <br>
						<input class="input" type="text" name="address1" class="form-control" placeholder="상세 주소를 입력하세요"/> <br>
						</div>
						<span class="error_next_box"></span>
						<input class="button1 input" type="submit" value="회원가입하기">
					</div>
				</form>
				<div class="button_section">
					<a class="" href="find_id.do">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="find_password.do">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="join.do">회원가입</a>
				</div>
				<div>
					<p>이미 회원이신가요? <a href="./login.do">로그인하기</a> </p>
				</div>
			</div>
		</div>
	</div>
	<script src="js/main.js"  type="text/javascript"></script>
	
	<script>
// 사용할 function명 적어주기
function findAddr() {
	daum.postcode.load(function() {
		new daum.Postcode({
			oncomplete: function(data){
				// 각 주소의 규칙에 따라 주소 조합
				// 가져올 변수가 없을때는 공백을 가지기 때문에 이를 참고해 분기한다고 한다
				var addr = ''; //주소 변수
				
				
				// 사용자가 선택한 주소타입(도로명/지번)에 따라 해당 값 가져오기
				// 만약 사용자가 도로명 주소를 선택했을 때
				if (data.userSelectedType == 'R') {
					addr = data.roadAddress;
				// 만약 사용자가 구주소를 선택했을 때
				} else {
					addr = data.jibunaddress;
				}
				// 주소정보
				document.getElementById('userAddress').value = addr;
				}
		}).open();
	});
}
</script>
</body>
</html>