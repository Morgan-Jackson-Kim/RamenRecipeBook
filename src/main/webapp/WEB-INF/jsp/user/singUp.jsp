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
		<section style="padding-top: 200px; padding-bottom: 200px" class="content  d-flex justify-content-center">
			<div class="signUp-box d-flex justify-content-center align-items-center">
				<div class="w-100 ">
					<form id="signUpForm">
						<h1 class="text-center">회원가입</h1>
						<div class="d-flex  mt-3">
							<input type="text" id="loginIdInput" class="form-control" placeholder="아이디">
							<button type="button" class="btn btn-info btn-sm" id="isDuplicateBtn">중복확인</button>
						</div>
						<input type="password" class="form-control mt-3" id="passwordInput" placeholder="패스워드">
						<input type="password" class="form-control mt-3" id="passwordConfirmInput" placeholder="패스워드 확인">
						<small class="text-danger d-none " id="errorPassword">비밀번호가 일치하지 않습니다.</small>
						<input type="text" class="form-control mt-3" id="nameInput" placeholder="이름">
						<input type="text" class="form-control mt-3" id="emailInput" placeholder="이메일">
						<button id="signUpBtn" type="submit" class="btn btn-primary btn-block mt-3">회원가입</button>
					</form>
				</div>
			</div>
		</section>
	
	</div>



</body>
</html>