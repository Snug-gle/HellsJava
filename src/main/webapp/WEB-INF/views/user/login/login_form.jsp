<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hell's Java</title>
</head>
<body>

  
	<div>
		<div>
			<div>
				<h1 onclick="location.href='<c:url value="/"/>';">오늘의 짐</h1>
			</div>
			<div>
				<div>
					<form action="<c:url value="/"/>" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td>
									<input name="memberId" type="text" placeholder="아이디를 입력해주세요" >
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input name="memberPw" type="password" placeholder="비밀번호를 입력해주세요" >
								</td>
							</tr>
							<tr>
								<td><button type="submit">로그인</button></td>
								<td><button type="button" onclick="location.href='<c:url value="/user/login/id_search"/>';">아이디/비밀번호 찾기</button></td>
							</tr>
							<tr>
								<td><button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>
