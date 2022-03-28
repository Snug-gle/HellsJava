<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="posting-detail-content">
		<div class="posting-detail-content-header">
			<div>
				<table>
					<tr>
						<td>트레이너</td>
						<td>후기</td>
					</tr>
					<tr>
						<td>소개</td>
						<td>자격사항</td>
						<td>스케쥴</td>
						<td>프로그램</td>
						<td>최근후기</td>
						<td>이용가격</td>
						<td>위치</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="posting-detail-content-body">
			<div class="search-list-body">
				<div class="panel-list">
					<div class="panel-body profile-wrapper">
				        <div class="col-md-3">
				            <div class="profile-pic text-center">
				                <img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle">
				            </div>
				        </div>
				        <div class="col-md-9">
				            <div class="profile-info">
				                <h1>Aaron Adams</h1>
				                <span class="text-muted">UI Designer</span>
				                <p>
				                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
				                </p>
				                <div class="connect">
				                    <button type="button" class="btn btn-success btn-trans"><span class="fa fa-check"></span> Following</button>
				                    <button type="button" class="btn btn-primary btn-trans"><span class="fa fa-comments"></span> Chat</button>
				                </div>
				                
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
		<div class="posting-detail-content-footer">
		
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
</body>
</html>