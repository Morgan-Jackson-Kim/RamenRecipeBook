<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<header class="d-flex align-items-center  mt-3">
	<h2 class="display-4 text-danger">라면 레시피 북</h2>
	<form class = 'search'>
		<div class="form-group form-control">
	        <input  type="text" id="value" placeholder="검색어를 입력하세요">
	        <button class="btn" type="submit" name="click" >검색</button>
	    </div>
	</form>
	<c:if test="${not empty userName}">
		<div class="mr-4">${userName } <a href="/user/sign_out">로그아웃</a> </div>
	</c:if>
</header>
<hr>