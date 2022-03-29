<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<strong>공지사항</strong>
			</h3>
			<%-- 공지사항 작성 버튼  --%>
			<div class="actions pull-right">

				<%-- <c:if test="${loginUserinfo.status==9}"> --%>
				<button type="button"
					onclick="location.href='<c:url value="/notice/write"/>';">공지사항
					작성</button>
				<%-- </c:if> --%>
			</div>
		</div>

		<div class="panel-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="100">번호</th>
						<th width="100">제목</th>
						<th width="150">작성일</th>
						<th width="250">관리자</th>
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
									<td width="100"><a
										href="<c:url value='/notice/view/'/>${notice.noticeServiceNo}">${notice.noticeServiceTitle}</a></td>
									<td width="250">${notice.noticeServiceDate}</td>
									<td width="150">${notice.memberName}</td>
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
<%-- 페이지 번호를 출력하는 영역 --%>
	<div id="pageNumDiv"></div>
<script type="text/javascript">		
var page=1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
boardDisplay(page);

/* 게시글 목록을 검색하여 JSON 텍스트로 응답하는 웹프로그램을 AJAX로 요청하여 처리하는 함수 */
function boardDisplay(pageNum) {
		page=pageNum;
		$.ajax({
			type: "get",
			url: "/pager?pageNum="+pageNum,
			dataType: "json",
			success: function(json) {		
				//페이지 번호를 출력하는 함수 호출
				pagerDisplay(json.pager);
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status);
			}
		});		
	}

		/* 페이지 번호를 출력하는 함수 */
	function pagerDisplay(pager) {
		var html="";
		
		if(pager.startPage>pager.blockSize) {
			html+="<a href='javascript:boardDisplay(1);'>[처음]</a>";
			html+="<a href='javascript:boardDisplay("+pager.prevPage+");'>[이전]</a>";
		} else {
			html+="[처음][이전]";
		}
		
		for(i=pager.startPage;i<=pager.endPage;i++) {
			if(pager.pageNum!=i) {
				html+="<a href='javascript:boardDisplay("+i+");'>["+i+"]</a>";
			} else {
				html+="["+i+"]";
			}
		}
		
		if(pager.endPage!=pager.totalPage) {
			html+="<a href='javascript:boardDisplay("+pager.nextPage+");'>[다음]</a>";
			html+="<a href='javascript:boardDisplay("+pager.totalPage+");'>[마지막]</a>";
		} else {
			html+="[다음][마지막]";
		}
		
		$("#pageNumDiv").html(html);
	}
		</script>
		
