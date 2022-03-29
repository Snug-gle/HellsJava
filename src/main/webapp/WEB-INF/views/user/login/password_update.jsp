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
					<form action="<c:url value='/user/login/password_update'/>" method="post">
						<input type="hidden" name = "memberNo" value="${member.memberNo}">
						<table>
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" placeholder="새로 설정할 비밀번호를 입력해주세요">
								</td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td>
									<input type="password" placeholder="비밀번호를 다시 입력해주세요">
								</td>
							</tr>
							<tr>
								<td><button type="submit">확인</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
