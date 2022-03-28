<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div>
		<div>
			<div>
				<a href="<c:url value="/"/>"><h1>오늘의 짐</h1></a>
			</div>
			<div>
				<div>
					<form action="<c:url value="/user/login/id_print"/>" method="post">
						<table>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" placeholder="이름을 입력해주세요">
								</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>
									<input type="text" placeholder="연락처를 입력해주세요">
								</td>
							</tr>
							<tr>
								<td><button type="button" onclick="location.href='<c:url value="/user/login/password_search"/>';">비밀번호 찾기/수정</button></td>
								<td><button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button></td>
							</tr>
							<tr>
								<td><button type="submit">아이디 찾기</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>