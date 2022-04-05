<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="account-info-box">
		<div class="panel panel-default">
			<div class="notice-list-title">
				<h3 class="panel-title"><strong>계좌정보</strong></h3>
			</div>
	
			<div class="panel-body">
				<div class="account-table">
					<table class="table table-hover">
						<c:choose>
							<c:when test="${empty(account) }">
								<tr>
									<td class="panel-title">등록된 계좌가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td><strong>은행명</strong></td>
									<td><strong>${bankName}은행</strong></td>
			
								</tr>
								<tr>
									<td><strong>계좌번호</strong></td>
									<td><strong>${account.accountNumber}</strong></td>
			
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<c:if test="${empty(account) }">
					<button type="button" class="btn btn-primary"
						onclick="location.href='<c:url value ="/account/register"/>';">등록</button>
				</c:if>
				<div style="text-align: right;">
				<button type="button" class="btn btn-primary"
					onclick="location.href='<c:url value ="/account/remove/"/>${account.accountNo }';">삭제</button>
				</div>
			
			</div>
		</div>
	</div>
</div>