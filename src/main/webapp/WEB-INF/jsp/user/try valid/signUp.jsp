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
					<form id="signUpForm" class="needs-validation" novalidate>
						<h1 class="text-center mb-4">회원가입</h1>
						<div class="mt-3 form-group">
							<label for="loginIdInput">아이디*</label>
							<div class="d-flex">
								<input  type="text" id="loginIdInput" class="form-control" placeholder="아이디" required>
								<div class="valid-tooltip">
	            					아이디 입력완료
	          					</div>
								<div class="invalid-tooltip">
	       						 	아이디를 입력해 주세요
	     						</div>
								<button type="button" class="btn btn-info btn-sm" id="isDuplicateBtn">중복확인</button>
							</div>
						</div>
						
						<div class="form-group">
							<input type="password" class="form-control mt-3" id="passwordInput" placeholder="패스워드" required>
									<div class="valid-tooltip">
		            					비밀번호 입력완료
		          					</div>
									<div class="invalid-tooltip">
		       						 	비밀번호를 입력해 주세요
		     						</div>
	     				</div>
	     				
	     				<div class="form-group">
							<input type="password" class="form-control mt-3" id="passwordConfirmInput" placeholder="패스워드 확인" required minlength="7" maxlength="12">
									<div class="invalid-tooltip">
		       						 	비밀번호를 확인해 주세요
		     						</div>
							<small class="text-danger d-none " id="errorPassword">비밀번호가 일치하지 않습니다.</small>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control mt-3" id="nameInput" placeholder="이름" required>
								<div class="invalid-tooltip">
	       						 	이름을 입력해 주세요
	     						</div>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control mt-3" id="phoneInput" placeholder="전화번호" required minlength="7" maxlength="12">
								<div class="invalid-tooltip">
	       						 	전화번호를 입력해 주세요
	     						</div>
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control mt-3" id="emailInput" placeholder="이메일" required>
						
							<div class="invalid-tooltip">
	       						 이메일을 입력해 주세요
	     					</div>
						</div>						
						<button id="signUpBtn" type="submit" class="btn btn-primary btn-block mt-3">회원가입</button>
					</form>
				</div>
			</div>
		</section>
	 	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script type="text/javascript">
	(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    
		    var forms = document.getElementsByClassName('needs-validation');
		    
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
	</script>
</body>
</html>