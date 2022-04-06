<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


  

</style>
</head>
<body>
	<h1 style=" text-align:center; font-size: 40px;" ><strong>마이페이지</strong></h1>
	<br>
	<div class="trainer-my-container-body">
	 	<div class="trainer-my-container">
	        <div class="trainer-my-item">회원정보수정</div>
	        <div class="trainer-my-item">트레이너 정보 관리</div>
	        <div class="trainer-my-item">1:1 문의 내역</div>
	        <div class="trainer-my-item">계좌관리</div>
	    </div>
	    <br>
	    <div class="trainer-my-container">
	        <div class="trainer-my-item">1회 PT 신청 목록</div>
	        <div class="trainer-my-item">PT 문의 목록</div>
	        <div class="trainer-my-item" onclick="location.href='<c:url value="/myposting/detail/${loginUserinfo.memberNo }"/>';">포스팅 관리</div>
	    </div>
	    
	    
	</div>
</html>