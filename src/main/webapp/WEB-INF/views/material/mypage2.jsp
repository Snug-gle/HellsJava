<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.flex-container1 {
	justify-content: center;
	display: flex;
    flex-wrap: wrap;
}

.flex-container2 {
	display: inline-flex;
} 

.flex-item {
	width: 200px;
	height: 200px;
    margin: 20px;
    text-align: center;
}
.color-red{
    background-color: darksalmon;
}
.color-blue{
    background-color: dodgerblue;
}

</style>
</head>
<body>
	<h1 style=" text-align:center; font-size: 50px;" ><strong>마이페이지</strong></h1>
	<br>
	<div class="flex-container1">
	 	<div class="flex-container2">
	        <div class="flex-item color-red">회원정보수정</div>
	        <div class="flex-item color-red">내 리뷰 관리</div>
	        <div class="flex-item color-red">1:1 문의 내역</div>
	        <div class="flex-item color-red">계좌관리</div>
	    </div>
	    <br>
	    <div class="flex-container2">
	        <div class="flex-item color-blue">1회 PT 신청 내역</div>
	        <div class="flex-item color-blue">PT 문의 내역</div>
	        <div class="flex-item color-blue">트레이너 신청내역</div>
	    </div>
	</div>
</html>