<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div class="container">
	<div class="my-page-box" style="color: #fff">
		<div class="pageheader" style="font-size: 20px;">
				<h1>마이페이지</h1>
			</div>
		<br>
	<div class="flex-container1">
	 	<div class="flex-container">
	       <div class="flex-item">
	       	<a href="${pageContext.request.contextPath}/member/modify" style="color: #fff">회원정보수정
				<p><i class="icon-user myPageIcon"></i></p></a>
			</div>
	       	<div class="flex-item">
	        	<a href="" style="color: #fff">트레이너 정보 관리
	        	<p><i class="icon-user myPageIcon"></i></p></a>
	        </div>
	        <div class="flex-item">
				<a href="${pageContext.request.contextPath}/oOo/list" style="color: #fff">1:1 문의 내역
	       		<p><i class="icon-note myPageIcon"></i></p></a>
			</div>
	        <div class="flex-item">
	        	<a href="${pageContext.request.contextPath}/account/info" style="color: #fff">계좌관리
	        	<p><i class="icon-wallet myPageIcon"></i></p></a>
	        </div>
	    </div>
	    <br>
	    <div class="flex-container">
	        <div class="flex-item">
	        	<a href="" style="color: #fff">1회 PT 신청 목록
	        	<p><i class="icon-note myPageIcon"></i></p></a>
	        </div>
	        <div class="flex-item">
	        	<a href="" style="color: #fff">PT 문의 목록
	        	<p><i class="icon-note myPageIcon"></i></p></a>
	        </div>
		    <div class="flex-item">
	        	<a href="${pageContext.request.contextPath}/myposting/detail/${loginUserinfo.memberNo }" style="color: #fff">포스팅 관리
	        	<p><i class=" icon-user-follow myPageIcon"></i></p></a>
	        </div>   
	        <%--<div class="trainer-my-item" onclick="location.href='<c:url value="/myposting/detail/${loginUserinfo.memberNo }"/>';">포스팅 관리</div>--%>
	    </div>
	</div>
		<hr>
	</div>
</div>
