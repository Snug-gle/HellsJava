<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<h1>계좌 정보</h1>
<!-- 밑줄 -->
<!-- 은행, 계좌번호 , 등록된 계좌가 없습니다, 등록 삭제 버튼 -->
<table>
<c:choose>
	<c:when test="${empty(bankList) }">
		<tr>
			<td>등록된 계좌가 없습니다.</td> 
		</tr> 
	</c:when>
	<c:otherwise>
		<tr>
			<td>은행</td>
			<td>qq<%-- ${ } --%></td>
			
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>qq<%-- ${ } --%></td>
			
		</tr>
	</c:otherwise>
</c:choose>
</table>

</html>