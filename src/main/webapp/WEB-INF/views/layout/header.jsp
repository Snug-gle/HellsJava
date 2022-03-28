<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div class="heard-banner">
	<div class="main-title">
		<p class="title_01" onclick="location.href='<c:url value="/"/>';">오늘의 짐</p>
	</div>
	<div class="main-top-banner" >
		<c:choose>
		  	<c:when test="${empty(loginMember) }">
		  		<div class="main-top-btn login" >
					<button type="button" onclick="location.href='<c:url value="/user/login/login_form"/>';">로그인</button>
				</div>
				<div class="main-top-btn join" >
					<button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${loginMember eq'관리자'}">
					<div class="main-top-btn admin" >
						<button type="button" >관리자 페이지</button>
					</div>
				</c:if>
				<div class="main-top-btn logout" >
					<button type="button" onclick="location.href='<c:url value="/logout"/>';" >로그아웃</button>
				</div>
				<div class="main-top-btn mypage" >
					<c:if test="${loginMember eq'김성훈' or loginMember eq '관리자'}">
						<button type="button" >마이페이지</button>
					</c:if>
					<c:if test="${loginMember eq'트레이너'}">
						<button type="button" >마이페이지(트레이너)</button>
					</c:if>
				</div>
				
				<div class="main-top-btn cache" >
					<p>2000<span>캐쉬</span></p>
				</div>
				<div class="main-top-btn cache" >
					<button type="button" onclick="location.href='<c:url value="/money/cache_charging"/>';" >충전</button>
				</div>
					
			</c:otherwise>
		</c:choose>
	
		
	
	</div>
</div>