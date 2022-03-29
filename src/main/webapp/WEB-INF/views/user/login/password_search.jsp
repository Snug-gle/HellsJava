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
					<form action="<c:url value="/user/login/password_update"/>" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" placeholder="아이디를 입력해주세요" name="memberId">
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" placeholder="이름을 입력해주세요" name="memberName">
								</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>
									<select id="member_phone1" name="member_phone1">											
										<option value="010" selected="selected">&nbsp;010&nbsp;</option>
										<option value="011">&nbsp;011&nbsp;</option>
										<option value="016">&nbsp;016&nbsp;</option>
										<option value="017">&nbsp;017&nbsp;</option>
										<option value="018">&nbsp;018&nbsp;</option>
										<option value="019">&nbsp;019&nbsp;</option>
									</select>
									<input id="member_phone2" name="member_phone2" size="7" maxlength="4" type="text">
									<input id="member_phone3" name="member_phone3" size="7" maxlength="4" type="text">
								</td>
							</tr>
							
							<tr>
								<td><button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button></td>
							</tr>
							<tr>
								<td><button type="submit">비밀번호 찾기/수정</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
