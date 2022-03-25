<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<h1 align="center">공지사항 수정</h1>
	<hr>
	<form name="noticeForm">
	<input type="hidden" name="no" value="${notice.no }">
	<table align="center" border="1" cellpadding="1" cellspacing="0" width="300">
		<tr height="40">
			<td>제목</td>
			<td>
				<input type="text" name="title" value="${notice.title}">
			</td>
		</tr>
		<tr height="40">
			<td>내용</td>
			<td width="200" align="center">
				<input type="text" name="content" value="${notice.content}">
			</td>
		</tr>
		<%-- <tr height="40">
			<td>작성일</td>
			<td width="200" align="center">
				<input type="hidden" name="date" value="${notice.date}">
			</td>
		</tr>
		<tr height="40">
			<td>조회수</td>
			<td width="200" align="center">
				<input type="hidden" name="hits" value="${notice.hits}">
			</td>
		</tr> --%>
		<tr height="40">
			<td width="200" colspan="2" align="center">
				<button type="submit" value="확인" ></button>
				<button type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/notice/list ';"></button>
			</td>
		</tr>
	</table>
	</form>

</body>
</html>