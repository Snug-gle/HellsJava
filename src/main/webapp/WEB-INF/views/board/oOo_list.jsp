<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<h1 align="center">1:1 문의 목록</h1>
<div class="panel-body">
	<c:choose>
		<c:when test="${empty(ptonceList) }">
			<div align="center">
				<h3>문의 내역이 없습니다.</h3>
			</div>
		</c:when>
		<c:otherwise>
			<c:set var="cnt" value="1" />
			<c:forEach var="oOo" items="${oOoList}">
				<div class="panel-group accordion" id="accordion">
					<!-- 문의글 -->
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">
								<c:set var="index1" value="${index1+1 }" />
								<!-- 글번호 -->
								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false"> ${index1 }</a>
								<!-- 제목 -->
								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									${oOo.noticeServiceTitle}</a>
								<!-- 날짜 -->
								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									${oOo.noticeServiceDate}</a>
								<!-- 글내용 보기 -->
								<a data-toggle="collapse" data-parent="#accordion"
									href="#${oOo.noticeServiceNo}" class="collapsed"
									aria-expanded="false"> 상세보기</a>
								<!-- 조회수 -->
								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									${ptOnce.ptOnceStatus }</a>
							</div>
							<!-- 글내용 -->
							<div id="${oOo.noticeServiceNo}" class="panel-collapse collapse"
								aria-expanded="false" style="height: 0px;">
								<div class="panel-body">${oOo.noticeServiceContent}</div>
								<div class="panel-body">(확인용) 회원번호 :${oOo.memberNo}</div>
							</div>
						</div>
						<!-- 답글 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title">
									<c:set var="index1" value="${index1+1 }" />
									<!-- 글번호 -->
									<a data-toggle="collapse" data-parent="#accordion" href="#"
										class="collapsed" aria-expanded="false"> ${index1 }</a>
									<!-- 제목 -->
									<a data-toggle="collapse" data-parent="#accordion" href="#"
										class="collapsed" aria-expanded="false">
										${oOo.noticeServiceTitle}</a>
									<!-- 날짜 -->
									<a data-toggle="collapse" data-parent="#accordion" href="#"
										class="collapsed" aria-expanded="false">
										${oOo.noticeServiceDate}</a>
									<!-- 글내용 보기 -->
									<a data-toggle="collapse" data-parent="#accordion"
										href="#${oOo.noticeServiceNo}" class="collapsed"
										aria-expanded="false"> 상세보기</a>
									<!-- 조회수 -->
									<a data-toggle="collapse" data-parent="#accordion" href="#"
										class="collapsed" aria-expanded="false">
										${ptOnce.ptOnceStatus }</a>
								</div>
								<!-- 글내용 -->
								<div id="${oOo.noticeServiceNo}" class="panel-collapse collapse"
									aria-expanded="false" style="height: 0px;">
									<div class="panel-body">${oOo.noticeServiceReply}</div>
									<div class="panel-body">(확인용) 회원번호 :${oOo.memberNo}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<button type="button"
		onclick="location.href='<c:url value="/mypage"/>';">확인</button>
	<button type="button" onclick="history.back()">목록</button>
	<%-- 페이지 번호 출력 --%>
	<div class="panel panel-default">
		<div class="panel-body" id="pageNumDiv"></div>
	</div>
</div>

<script type="text/javascript">
	var page = 1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
	var html = ""; //페이지 번호 출력하기 위한 전역 변수
	//페이징 처리 
	//[처음], [이전] 이동 설정
	if (${pager.startPage} > ${pager.blockSize}) {
		html += "<a href='<c:url value="/ptonce/list?pageNum=1"/>'>[처음]</a>";
		html += "<a href='<c:url value="/ptonce/list?pageNum=${pager.prevPage}"/>'>[이전]</a>";
	} else {
		html += "[처음][이전]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptonce/list?pageNum=i"/>'>[" + i+ "]</a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptonce/list?pageNum=${pager.nextPage}"/>'>[다음]</a>";
		html += "<a href='<c:url value="/ptonce/list?pageNum=${pager.totalPage}"/>'>[마지막]</a>";
	} else {
		html += "[다음][마지막]";
	}
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html);
</script>


</html>







