<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="my-page-box">
		<div class="search-list-content">
			<div class="search-list-header">
				<div class="search-list-top-text">
				</div>
				<form action="<spring:url value="/content/search"/>" method="post">
				<div class="search-list-top-search">
					<select name="searchKeyword" class="btn btn-primary dropdown-toggle">
						<option value="member_name" <c:if test="${searchKeyword == 'member_name'}">selected="selected"</c:if>>트레이너 이름</option>
						<option value="trainer_centername" <c:if test="${searchKeyword == 'trainer_centername'}">selected="selected"</c:if>>센터명</option>
						<option value="trainer_address" <c:if test="${searchKeyword == 'trainer_address'}">selected="selected"</c:if>>센터 주소(동)</option>
					</select>
					<input class="main-search" placeholder="트레이너명/지역/헬스장 이름" name ="searchValue" value="${searchValue }">
					<!-- <input class="content-search"  placeholder="트레이너명/지역/헬스장 이름" name ="searchValue" value="${searchValue }">-->
					<button type="submit" class="fa fa-search main-contorller"></button>
				</div>
			</form>	
			</div>
			<hr>
		<c:forEach var="searchTrainer" items="${searchList }">
			<section class="panel">
				<div class="mainSearchBody profile-wrapper">
					<div class="panel-list-unit" onclick="location.href='<spring:url value="/posting/detail/${searchTrainer.trainerNo}"/>';">
						<div class="panel-body profile-wrapper">
					        <div class="searchProfileImg">
					            <div class="profile-pic text-center">
					                <img src="<spring:url value="/profileImages/${searchTrainer.trainerProfileImg}"/>" alt="" class="img-circle">
					            </div>
					        </div>
					            <div class="profile-info">
					                <h1>${searchTrainer.memberName }</h1>
					                <hr>
					                <span class="text-muted">${searchTrainer.trainerCentername }</span>
					                <hr>
					                <p>
					                	${fn:substring(searchTrainer.postingSelfIntroduction,0,100)  }. . .
					                </p>
					            </div>
					    </div>
					</div>
				</div>
			</section>
				</c:forEach>
		</div>
		<hr>
	</div>
</div>
