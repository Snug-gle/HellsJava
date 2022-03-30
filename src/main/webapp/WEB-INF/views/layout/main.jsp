<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div class="main-banner-image">
	<img class="main-banner-image_01" src="<spring:url value="/img/vac-4.jpg"/>">
</div>

<div class="main-banner-image-contorller">
	<button type="button" class="fa fa-chevron-left main-contorller image-contorller-left"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-chevron-right main-contorller image-contorller-right"></button>
</div>
<form action="<spring:url value="/content/search_list"/>" method="get">
	<div class="main-search-area">
		<input class="main-search" placeholder="트레이너명/지역/헬스장 이름" name ="mainSearch">
		<button type="submit" class="fa fa-search main-contorller"></button>
	</div>
</form>
<div>
	<h4>이달의 트레이너</h4>
	<hr style="border: solid 1px black;" align="left" width="20%">
</div>

	<div class="panel-list">
		<a href="<c:url value="/content/posting_detail"/>">
		<div class="panel-body profile-wrapper panel-unit">
		    <div class="profile-photo">
		        <div class="profile-pic text-center">
		            <img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle" >
		        </div>
		    </div>
		    <div class="profile-text">
		        <div class="profile-info">
		            <h1>으어어어어어 </h1>
		            <span class="text-muted">에헤헤헤헤</span>
		           	<input type="text" value="${loginMember}">
		        </div>
		    </div>
		</div>
		</a>
	</div>
<div>
	<h4>많이 도움된 리뷰</h4>
	<hr style="border: solid 1px black;" align="left" width="20%">
</div>
<div class="panel-list">
	<div class="main-review-panel panel-unit">
		<div class="main-review-panel-text">
			<label>최정인 회원님</label>
			<p>
			개쩔고 여튼 막 좋아요 자세도 잘잡아줘요 이쌤 최고!!!!
			</p>
			<button type="button" class="main-trainer-name main-contorller">김남영 트레이너</button>
		</div>
		<div class="main-review-panel-score">
			<i type="button" class="fa fa-heart"></i>
			<label>566</label>
			<i class="fa fa-star"></i>
			<i type="button" class="fa fa-star-half-o"></i>
			<i type="button" class="fa fa-star-o"></i>
		</div>
	</div>
</div>