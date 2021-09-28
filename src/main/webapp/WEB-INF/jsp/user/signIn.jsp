<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- css style 적용 -->
  <link rel="stylesheet" href="/static/css/style.css">
  
  
<title>라면 레시피 북 - 로그인</title>
</head>

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<div style="padding-top: 80px;" class="d-flex justify-content-center">
			<img src="https://cdn.pixabay.com/photo/2015/09/23/08/11/if-the-953110_960_720.jpg" width="400">
		</div>
		<section style=" padding-bottom: 80px" class="content  d-flex justify-content-center">
			
			<div class="login-box d-flex justify-content-center align-items-start bg-white  border rounded">
				<div class="w-100  p-4 ">
					<div class="text-center h3 text-primary">로그인</div>
					<form id="loginForm">
						<input type="text" id="loginIdInput" class="form-control mt-3" placeholder="아이디">
						<input type="password" id="passwordInput" class="form-control mt-3" placeholder="패스워드">
						<button id="loginBtn" type="submit" class="btn btn-primary btn-block mt-3">로그인</button>
						<div class="hr-sect">또는</div>
						<div class="mt-3 text-center">아직 계정이 없으신가요? <a href="/user/signup_view"> 회원가입</a></div>
					</form>
				</div>
			</div>
		</section>				
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function() {			
			$("#loginForm").on("submit", function(e) {
				
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요");
					return ;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력해주세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/main/page_view"
							//메인페이지로 이동
						} else {
							alert("아이디 비밀번호를 확인하세요");
						}
					}
					, error:function(e) {
						alert("로그인실패");
					}
				});
			});
		});	
	</script>
		
</body>
</html>