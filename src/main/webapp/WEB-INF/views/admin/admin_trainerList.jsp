<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>염병할 고갱님들</title>
</head>
<body>
<div class="userList">
	<div class="userList-title">
		<h2>관리자 페이지</h2>
	</div>
	<div class="userList-content">
		<div class="userList-side admin-listPanel">
			<div class="admin-side-bar">
				<div class="userList-side-bar-btn">회원 목록</div>
				<div class="userList-side-bar-btn">트레이너 목록</div>
				<div class="userList-side-bar-btn">1:1 문의 목록</div>
			</div>
		</div>
		<div class="userList-body admin-listPanel">
			<div class="admin-side-bar">
				<h4>트레이너 목록</h4>
				<div class="userList-body-list">
					<table class="userList-body-list-table">
						<colgroup>
							<col style="width:140px">
							<col style="width:150px">
							<col style="width:100px">
							<col style="width:140px">
							<col style="width:200px">
							<col style="width:100px">
							<col style="width:80px">
						</colgroup>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">연락처</th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col">상세</th>
						</tr>
					
						<tr>
							<td>번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>연락처</td>
							<td>이메일</td>
							<td></td>
							<td>
								<button type="button">상세보기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>	
		</div>
	</div>
</div>
</body>
</html>