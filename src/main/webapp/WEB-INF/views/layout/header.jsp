<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div class="heard-banner">
	<div class="main-title">
		<p class="title_01" onclick="location.href='<c:url value="/"/>';">오늘의 짐</p>
	</div>
	<div class="main-top-banner" >
		<div class="main-top-btn login" >
			<button type="button" onclick="location.href='<c:url value="/user/login_form"/>';">로그인</button>
		</div>
		<div class="main-top-btn join" >
			<button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button>
		</div>
	</div>
</div>