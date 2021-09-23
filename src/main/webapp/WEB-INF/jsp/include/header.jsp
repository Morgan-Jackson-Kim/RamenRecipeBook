<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<header class="d-flex align-items-center justify-content-between mt-3">
	<h2 class="display-4 text-danger">라면 레시피 북</h2>
	<c:if test="${not empty userProfileImage }">
		<div class="mr-4">${userProfileImage } <a href="/user/sign_out">로그아웃</a> </div>
	</c:if>
</header>
<hr>