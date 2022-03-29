<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<br>

	<h3>공지사항</h3>


	<form action="">
		<table>
			<thead>
				<tr>
					<th width=40 align=center height="22">${notice.noticeServiceNo}</th>
					<th width=80 align=center height="22">${notice.noticeServiceTitle}</th>
					<th width=40 align=center height="22">${notice.noticeServiceDate}</th>
					<%-- <th width=40 align=center height="22">${notice.noticeServiceWriter}</td> --%>
					<th width=40 align=center height="22">${notice.noticeServiceHits}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width=480 >
						${notice.noticeServiceContent}</td>
				</tr>
			</tbody>
		</table>
		<br> <input type="hidden">
		<table>
			<tr>
				<td align=center><input type="button" value="목록"
					onClick="location.href='<c:url value="/notice/board"/>';"> <%-- <c:if test="${loginUserinfo.status==9 }"> --%>
					<input type="button" value="수정"
					onClick="location.href='<c:url value="/notice/modify"/>?noticeServiceNo=${notice.noticeServiceNo }';">
					<input type="button" value="삭제"
					onClick="location.href='<c:url value="/notice/remove"/>/${notice.noticeServiceNo }';"> <%-- </c:if> --%>
				</td>
			</tr>
		</table>
	</form>




	<script language="JavaScript">
		function noticeRemove(num) {
			if (confirm("정말로 삭제 하시겠습니까?")) {
				location.href = '<c:url value="/notice/remove/"/>${notice.noticeServiceNo}';
			}
		}
	</script>
</body>
</html>