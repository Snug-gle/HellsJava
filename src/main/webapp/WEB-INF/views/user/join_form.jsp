<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원가입</h1>
	<hr>
	<form action="join" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="passwd2"></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
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
			<td>이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit">회원가입</button></td>
		</tr>
	</table>
	</form>
	<p style="color: red;"></p>