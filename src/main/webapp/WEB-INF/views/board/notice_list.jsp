<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><strong>공지사항</strong></h3>
				<%-- 공지사항 작성 버튼  --%>
				<div class="actions pull-right">
                                   
				<%-- <c:if test="${loginUserinfo.status==9}"> --%>
					<button type="button"
						onclick="location.href='<c:url value="/notice/write"/>';">공지사항 작성</button>
				<%-- </c:if> --%>
                                </div>
			</div>

			<div class="panel-body">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="100">번호</th>
							<th width="100">제목</th>
							<th width="250">내용</th>
							<th width="150">작성일</th>
							<th width="100">조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${empty(noticeList) }">
								<tr align="center">
									<td colspan="5">검색된 정보가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${noticeList }">
									<tr>
										<td width="100">${notice.noticeServiceNo }</td>
										<td width="100">${notice.noticeServiceTitle}</td>
										<td width="150">${notice.noticeServiceContent}</td>
										<td width="250">${notice.noticeServiceDate}</td>
										<td width="100">${notice.noticeServiceHits}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>