<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1 align="center">공지사항 작성</h1>
	<hr>
	<form name="noticeForm">
	<table align="center" border="1" cellpadding="1" cellspacing="0" width="300">
		<tr height="40">
			<th>번호</th>
			<td>
				<input type="hidden" name="no" value="${notice.no }">
			</td>
		</tr>
		<tr height="40">
			<th>제목</th>
			<td>
				<input type="text" name="name" value="${notice.title}">
			</td>
		</tr>
		<tr height="40">
			<th>내용</th>
			<td width="200" align="center">
				<input type="text" name="phone" value="${notice.content}">
			</td>
		</tr>
		<tr height="40">
			<th>작성일</th>
			<td width="200" align="center">
				<input type="hidden" name="address" value="${notice.date}">
			</td>
		</tr>
		<tr height="40">
			<th>조회수</th>
			<td width="200" align="center">
				<input type="hidden" name="address" value="${notice.hits}">
			</td>
		</tr>
		<tr height="40">
			<td width="200" colspan="2" align="center">
				<button type="submit" value="확인" ></button>
				<button type="reset" value="초기화"></button>
				<button type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/display ';"></button>
			</td>
		</tr>
	</table>
	</form>

</body>
</html>