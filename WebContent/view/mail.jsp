<%@include file="/include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" type="text/css" href="./css/mail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<section class="content">
	<div id="__next">
		<section class="content">
			<div class="main_area">
				<div class="left_main">
					<div class="left_main_header">
						<div class="title">아나바다</div>
					</div>
					<ul>
					<c:forEach items="${list }" var="item"> <!-- room 반복 -->
					
						<div class="card_box active" onclick="getMailList('${item.room_no}','${item.id }','${item.product_no }')">
								<li>
								<div class="profile">
									<img src="/img/${item.img}" alt="${item.name }">
								</div>
								<div class="info">
									<div class="nick">${item.name }</div>
									<div class="description size_limite">${item.product_name }</div>
<!-- 									<div class="time_ago">날짜</div> -->
								</div>
							</li>
						</div>
					</c:forEach>
					</ul>
				</div>
				<div class="right_main">
				<div id="message"></div>
				<div id="footer_input" class="chat_footer"></div>
				</div>
			</div>
		</section>
	</div>
	</div>
</section>
<script>
function getMailList(room,id,p_no){

	$.ajax({
			type : 'post', //post 방식으로 전송
			url : './view/mail/GetMailList_Ajax.jsp', //데이터를 주고받을 파일 주소
			data : {"room":room,"order_id":id,"p_no":p_no}, //위의 변수에 담긴 데이터를 전송해준다.
			dataType : 'html', //html 파일 형식으로 값을 담아온다.
			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data); //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
		getInputBox(room,id,p_no);
	}
	
function getInputBox(room,id,p_no){
	$.ajax({
			type : 'get', //post 방식으로 전송
			url : './view/mail/InputBox_Ajax.jsp', //데이터를 주고받을 파일 주소
			data : {"room":room,"order_id":id,"p_no":p_no}, //위의 변수에 담긴 데이터를 전송해준다.
			dataType : 'html', //html 파일 형식으로 값을 담아온다.
			success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#footer_input').html(data); //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
	}
	
function insert_mail(room){
	var postid =  $('#postid_'+room).val();
	var product_no =  $('#product_no_'+room).val();
	var content =  $('#content_'+room).val();
	
	$.ajax({
			type : 'post', //post 방식으로 전송
			url : './view/mail/InsertMail.jsp', //데이터를 주고받을 파일 주소
			data : {"room":room,"postid":postid,"p_no":product_no,"content":content}, //위의 변수에 담긴 데이터를 전송해준다.
			dataType : 'html', //html 파일 형식으로 값을 담아온다.
			success : function() { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				getMailList(room,postid,product_no);
			}
		});
	}
</script>
<%@include file="/include/footer.jsp"%>