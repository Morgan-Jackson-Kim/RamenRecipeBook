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
  
  
<title>라면 레시피 북 - 메인페이지</title>
</head>
<body>
	<div class="wrap">
		<c:import url="/WEB-INF/jsp/include/mainheader.jsp"/>
		<section class="">
			<div class="d-flex">
				<nav class="menu-nav">
					<h2>메뉴</h2>
					<ul class="menu">
						<li>라면목록</li>
						<li>추천라면</li>
						<li>기타</li>
					</ul>
				</nav>
				<div class="gallery bg-secondary d-flex">
					<c:forEach  var="PostOnlyGallery" items="${postList }">
						<div class="card border rounded mt-3">
							<!--이미지만 -->
							<div>
								<img src="${PostOnlyGallery.post.imagePath }" class="w-100 imageClick" data-post-id="${PostOnlyGallery.post.id }">
							</div>				
						</div>								
					</c:forEach>
	
				</div>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>