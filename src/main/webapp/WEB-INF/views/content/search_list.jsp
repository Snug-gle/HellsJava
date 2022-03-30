<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="search-list-content">
		<div class="search-list-header">
			<div class="search-list-top-text">
				<p><span>검색 키워드</span>"뭐여"</p>
			</div>
			<div class="search-list-top-search">
				<input class="content-search">
				<button type="submit" class="fa fa-search main-contorller"></button>
			</div>
		</div>
		<hr>
		<div class="search-list-body">
			<div class="panel-list">
			
				<c:forEach var="searchTrainer" items="${searchList }">
					<div class="panel-list-unit" onclick="location.href='<spring:url value="/content/posting_detail"/>';">
					
							<div class="panel-body profile-wrapper">
						        <div class="col-md-3">
						            <div class="profile-pic text-center">
						                <img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle">
						            </div>
						        </div>
						        <div class="col-md-9">
						            <div class="profile-info">
						                <h1>${searchTrainer.memberName }</h1>
						                <span class="text-muted">${searchTrainer.trainerCentername }</span>
						                <p>
						                	${fn:substring(searchTrainer.postingSelfIntroduction,0,100)  }. . .
						                </p>
						                <div class="connect">
						                    <button type="button" class="btn btn-success btn-trans"><span class="fa fa-check"></span> Following</button>
						                    <button type="button" class="btn btn-primary btn-trans"><span class="fa fa-comments"></span> Chat</button>
						                </div>
						                
						            </div>
						        </div>
						    </div>
						
					</div>
				</c:forEach>
			</div>
		</div>
		<hr>
		<div class="search-list-footer">
		</div>
	</div>
	
</body>
</html>