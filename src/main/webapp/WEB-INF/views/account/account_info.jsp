<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	margin: 100px;
	align-items: center;
}
.panel panel-default {
 	margin-top: 100px;
}
</style>
</head>
<body>
<div class="panel panel-default">
	<div class="panel-heading">
		<h1><strong>계좌 정보</strong></h1>
	</div>
	<div class="panel-body">
		<table class="table table-hover">
			<c:choose>
				<c:when test="${empty(account) }">
					<tr>
						<td class="panel-title">등록된 계좌가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td><strong>은행</strong></td>
						<td><strong>${bankName}</strong></td>

					</tr>
					<tr>
						<td><strong>계좌번호</strong></td>
						<td><strong>${account.accountNumber}</strong></td>

					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<button type="button" class="btn btn-primary"
			onclick="location.href='<c:url value ="/account/register"/>';">등록</button>
		<button type="button" class="btn btn-primary"
			onclick="location.href='<c:url value ="/account/remove/"/>${account.accountNo }';">삭제</button>
	
	</div>
</div>
</body>

</html>