<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.flex-container {
	justify-content: center;
	display: flex;
}
.flex-item {
	width: 240px;
    height: 220px;
    margin: 25px;
    text-align: center;
    line-height: 100px;
    font-size: 25px;
    color: black;
    border: 2px solid black;
    border-radius: 8px;
}
  

</style>
</head>
<body>
	<h1 style=" text-align:center; font-size: 40px;" ><strong>마이페이지</strong></h1>
	<br>
	<div class="flex-container1">
	 	<div class="flex-container">
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">회원정보수정</a></div>
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">내 리뷰 관리</a></div>
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">1:1 문의 내역</a></div>
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">계좌관리</a></div>
	    </div>
	    <br>
	    <div class="flex-container">
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">1회 PT 신청 내역</a></div>
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">PT 문의 내역</a></div>
	        <div class="flex-item"><a href="${pageContext.request.contextPath}/account/register"; style="color: black">트레이너 신청내역</a></div>
	    </div>
	    
	    
	</div>
</html>