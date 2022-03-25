<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring</title>
</head>
<body>
	<h1 align="center">공지사항</h1>
		<table align="center" border="1" cellspacing="0" cellpadding="1" width="800">
			<tr bgcolor="yellow">
				<th width="100">번호</th>
				<th width="100">제목</th>
				<th width="150">내용</th>
				<th width="250">작성일</th>
				<th width="100">조회수</th>
			</tr>
		
		<c:choose>
			<c:when test="${empty(noticeList) }">
				<tr align="center">
					<td colspan="5">검색된 정보가 없습니다.</td>
				</tr>	
			</c:when>
			<c:otherwise>
				<c:forEach var="notice" items="${noticeList }">
					<tr align="center">
						<td width="100">${notice.no }</td>				
						<td width="100">${notice.title}</td>				
						<td width="150">${notice.content}</td>				
						<td width="250">${notice.date}</td>				
						<td width="100">${notice.hts}</td>				
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>







