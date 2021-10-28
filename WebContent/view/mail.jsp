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
</section>
<script>
function getMailList(room,id,p_no){
	$.ajax({
			type : 'post',
			url : './view/mail/GetMailList_Ajax.jsp',
			data : {"room":room,"order_id":id,"p_no":p_no}, 
			dataType : 'html', 
			success : function(data) { 
				$('#message').html(data); 
			}
		});
		readCheck(room,id,p_no);
	}
	
function readCheck(room,id,p_no){
	$.ajax({
			type : 'post',
			url : './view/mail/MailReadCheck_Ajax.jsp',
			data : {"room":room,"order_id":id,"p_no":p_no}, 
		});
		getInputBox(room,id,p_no);
	}
	
function getInputBox(room,id,p_no){
	$.ajax({
			type : 'get', 
			url : './view/mail/InputBox_Ajax.jsp', 
			data : {"room":room,"order_id":id,"p_no":p_no},
			dataType : 'html', 
			success : function(data) { 
				$('#footer_input').html(data);
			}
		});
	}
	
function insert_mail(room){
	var postid =  $('#postid_'+room).val();
	var product_no =  $('#product_no_'+room).val();
	var content =  $('#content_'+room).val();
	
	$.ajax({
			type : 'post', 
			url : './view/mail/InsertMail.jsp', 
			data : {"room":room,"postid":postid,"p_no":product_no,"content":content}, 
			dataType : 'html', 
			success : function() { 
				getMailList(room,postid,product_no);
			}
		});
	}
</script>
<%@include file="/include/footer.jsp"%>