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
  
  
<title>라면 레시피 북 - 회원가입</title>


</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section style="padding-top: 100px; padding-bottom: 100px" class="content  d-flex justify-content-center">
			<div class="border rounded signUp-box d-flex justify-content-center align-items-center">
				<div class="w-100 mr-3 ml-3">
					<form id="signUpForm" >
						<h1 class="text-center mb-4">회원가입</h1>
				
						<div class="text-center mt-2 mb-4">라면 레시피를 공유 하려면 가입하세요!</div>
				
						<div class="hr-sect">또는</div>
						
						<div class="d-flex">
							<input  type="text" id="loginIdInput" class="form-control" placeholder="아이디">
							<button type="button" class="btn btn-info btn-sm" id="isDuplicateBtn">중복확인</button>
						</div>
						<div id="duplicateDiv" class="d-none"><small class="text-danger">중복 ID 입니다.</small></div>
						<div id="noneDuplicateDiv" class="d-none"><small class="text-success">사용 가능한 ID 입니다.</small></div>
							
						<input type="password" class="form-control mt-3" id="passwordInput" placeholder="패스워드">
									
						<input type="password" class="form-control mt-3" id="passwordConfirmInput" placeholder="패스워드 확인">
									
						<small class="text-danger d-none " id="errorPassword">비밀번호가 일치하지 않습니다.</small>
														
						<input type="text" class="form-control mt-3" id="nameInput" placeholder="이름" >
																				
						<input type="text" class="form-control mt-3" id="phoneInput" placeholder="전화번호" >
													
						<input type="text" class="form-control mt-3" id="emailInput" placeholder="이메일">
																	
						<button id="signUpBtn" type="submit" class="btn btn-primary btn-block mt-3">회원가입</button>
					</form>
					
					<div class="text-center mt-2 mb-4" >이미 아이디가 있으신가요? <a href="/user/signin_view">로그인 하기</a></div>
					
				</div>
			</div>
		</section>
	 	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		var isIdCheck = false;
		var isDuplicateId = true;
		
		$("#signUpForm").on("submit", function(e){
			
			e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var name = $("#nameInput").val().trim();
			var email = $("#emailInput").val().trim();
			var phone = $("#phoneInput").val().trim();
			
			if(loginId == null || loginId == "") {
				alert("아이디를 입력하세요");
				return ;
			}
			
			if(password == null || password == "") {
				alert("비밀번호를 입력하세요");
				return ;
			}
			
			if(password != passwordConfirm) {
				$("#errorPassword").removeClass("d-none");
				return ;
			}
			
			if(name == null || name == "") {
				alert("이름을 입력하세요");
				return ;
			}
			
			if(email == null || email == "") {
				alert("이메일을 입력하세요");
				return ;
			}
			
			if(phone == null || phone == "") {
				alert("전화번호를 입력하세요");
				return ;
			}
			
			
			if(isIdCheck == false) {
				alert("중복체크를 진행하세요");
				return ;
			}
					
			
			if(isDuplicate == true) {
				alert("아이디가 중복되었습니다.");
				return ;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId, "password":password, "name":name, "email":email ,"phone":phone},
				success:function(data) {
					if(data.result == "success") {
						location.href="/user/signin_view";
						
					} else {
						alert("회원 가입 실패");
					}
				}, 
				error:function(e) {
					alert("회원 가입 실패");
				}
			});
		});
		
		$("#isDuplicateBtn").on("click", function() {
			
			var loginId = $("#loginIdInput").val();
			
			if(loginId == null || loginId == "") {
				alert("아이디를 입력하세요");
				return ;
			}
			
			$.ajax({
				type:"get",
				url:"/user/is_duplicate_id",
				data:{"loginId":loginId},
				success:function(data) {
					isIdCheck = true;
					
					if(data.is_duplicate) {
						isDuplicate = true;
						$("#duplicateDiv").removeClass("d-none");
						$("#noneDuplicateDiv").addClass("d-none");
					} else {
						isDuplicate = false;
						$("#duplicateDiv").addClass("d-none");
						$("#noneDuplicateDiv").removeClass("d-none");
					}
					
				},
				error:function(e){
					alert("중복확인 실패");
				}
			});
			
		})
	});
	</script>
</body>
</html>