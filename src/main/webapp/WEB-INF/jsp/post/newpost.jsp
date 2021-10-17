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

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	 
  <link rel="stylesheet" href="/static/css/style.css">
  
  
<title>라면 레시피 북 - 새 레시피</title>
</head>
<body>
	<div class="wrap">
		<c:import url="/WEB-INF/jsp/include/mainheader.jsp"/>
			<section class="newpostsection">
				<div class="d-flex">
				<nav class="menu-nav">
					<h2>메뉴</h2>
					<ul class="menu">
						<li>라면목록</li>
						<li>추천라면</li>
						<li>기타</li>
					</ul>
				</nav>
				<div class="gallery" >
					<form id="postForm">
						<div class="form-inline form-group">
							<label for="racipeName " class="control-label display-4">레시피 이름 : </label> 
							<input class="form-control nameBox ml-3 mt-2 mb-2" type="text" id="racipeNameInput" placeholder="레시피 이름">
						</div>
						<div class="ingredientBox justify-content-between d-flex">
							<div class="form-inline form-group">
								<label for="ingredient" class="control-label">필요재료:</label> 
								<input class="form-control nameBox" type="text" id="ingredientInput" placeholder="재료">
							</div>
							<div class="form-inline form-group">
								<label for="usedRamen" class="control-label">사용한 라면:</label> 
								<input class="form-control nameBox" type="text" id="usedRamenInput" placeholder="사용한 라면">
							</div>
						</div>
						
						<section class="progressArea border rounded ">
							<textarea class="form-control w-100 border-0 non-resize" rows="20"  id="contentInput"></textarea>
						</section>
						
						<div class="d-flex justify-content-between ml-2">
							<div>
								<a href="#" id="imageUploadBtn"><i class="bi bi-image image-upload-icon"></i></a>
								<input class="input-control " type="file" id="fileInput">				
							</div>
							<div>
								<input class="form-control nameBox" type="text" id="tagInput" placeholder="태그">
							</div>
							
						</div>
						<div class="d-flex justify-content-between mt-2 ml-2">
							<%-- <button class="btn btn-lg btn-danger" id="cocktimerBtn">쿠킹 타이머(비활성화)</button>--%>
							<button class="btn btn-lg btn-primary" type="submit" id="submitBtn">작성 완료</button>
						</div>
					</form>
				</div>
			</div>
			</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#postForm").on("submit", function(e) {
				
				e.preventDefault();
				
				let content = $("#contentInput").val().trim();
				let racipeName = $("#racipeNameInput").val().trim();
				let ingredient = $("#ingredientInput").val().trim();
				let usedRamen = $("#usedRamenInput").val().trim();
				let tag = $("#tagInput").val().trim();
					
				if(racipeName == null || racipeName == "") {
					alert("레시피 이름을 입력하세요");
					return ;
				}
				
				if(ingredient == null || ingredient == "") {
					alert("재료들을 입력하세요");
					return ;
				}
				
				if(usedRamen == null || usedRamen == "") {
					alert("사용한 라면을 입력하세요");
					return ;
				}
				
				if(content == null || content == "") {
					alert("내용을 입력하세요");
					return ;
				}
			
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 추가하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("file", $("#fileInput")[0].files[0]);
				formData.append("content", content);
				
				$.ajax({
					enctype: 'multipart/form-data', 
					type:"post",
					url:"/post/create",
					processData: false, 
		        	contentType: false,  
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/main";
						} else {
							alert("레시피 등록에 실패했습니다.");
						}
						
					}, error:function(e) {
						alert("error ");
					}
				});
				
			});		
			
			$("#imageUploadBtn").on("click", function() {
				$("#fileInput").click();
			});
			
		});	
		
				
	</script>
	
	
</body>
</html>