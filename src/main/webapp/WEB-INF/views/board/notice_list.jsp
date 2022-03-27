<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<body>
	<%-- 공지사항 작성 버튼  --%>
	<c:if test="${loginUserinfo.status==9}"> 
	<button type="button" value="공지사항 작성" onclick="location.href='<c:url value="/notice/write"/>?notice.service.no=${notice.service.no }';"></button>
	</c:if>
	<%-- 공지사항 리스트 --%>
	<h1 align="center"></h1>
		<table>
			<tr>
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
						<td width="100">${notice.service.no }</td>				
						<td width="100">${notice.service.title}</td>				
						<td width="150">${notice.service.content}</td>				
						<td width="250">${notice.service.date}</td>				
						<td width="100">${notice.service.hits}</td>				
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>







