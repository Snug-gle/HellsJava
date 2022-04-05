<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<h1 align="center">1회 PT 신청 내역 목록(회원)</h1>

<div class="panel-body">

	<c:choose>
		<c:when test="${empty(ptonceList) }">
			<div align="center">
				<h3>신청 내역이 없습니다.</h3>
			</div>
		</c:when>
		<c:otherwise>
			<%-- ${(현재 페이지 * 페이지 당 행 개수) - 페이지 당 행 개수 - i.index} --%>
			<c:forEach var="ptOnce" items="${ptonceList}">
				<div class="panel-group accordion" id="accordion">

					<div class="panel panel-default">

						<div class="panel-heading">

							<div class="panel-title">


								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false"> ${ptOnce.ptOnceNo }</a>
								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									${ptOnce.ptOnceApplicationDate }</a> <a data-toggle="collapse"
									data-parent="#accordion" href="#" class="collapsed"
									aria-expanded="false"> ${ptOnce.trainerNo }</a> <a
									data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									${ptOnce.ptOnceStatus }</a> <a data-toggle="collapse"
									data-parent="#accordion" href="#${ptOnce.ptOnceNo }"
									class="collapsed" aria-expanded="false"> 상세보기</a> <a
									data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false"> 리뷰쓰기</a>

							</div>
							<div id="${ptOnce.ptOnceNo }" class="panel-collapse collapse"
								aria-expanded="false" style="height: 0px;">

								<!-- 성별, 연령, 운동경험, 운동목적 , 특이사항  -->
								<div class="panel-body">성별 : ${ptOnce.ptOnceGender}</div>
								<div class="panel-body">연령 : ${ptOnce.ptOnceAge}</div>
								<div class="panel-body">운동경험 : ${ptOnce.ptOnceExperience}
								</div>
								<div class="panel-body">
									운동목적 :${ptOnce.ptOncePurpose}<br>
								</div>
								<div class="panel-body">특이사항 :${ptOnce.ptOnceSignificant }
								</div>
								<div class="panel-body">(확인용) 회원번호 :${ptOnce.ptOnceNo }</div>

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
	
	var page = 1; 
	var html = "";

	if (${pager.startPage} > ${pager.blockSize}) {
		html += "<a href='<c:url value="/ptonce/list?pageNum=1"/>'>[처음]</a>";
		html += "<a href='<c:url value="/ptonce/list?pageNum=${pager.prevPage}"/>'>[이전]</a>";
	} else {
		html += "[처음][이전]";
	}

	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptonce/list?pageNum=i"/>'>[" + i+ "]</a>";
		} else {
			html += "[" + i + "]";
		}
	}

	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptonce/list?pageNum=${pager.nextPage}"/>'>[다음]</a>";
		html += "<a href='<c:url value="/ptonce/list?pageNum=${pager.totalPage}"/>'>[마지막]</a>";
	} else {
		html += "[다음][마지막]";
	}

	$("#pageNumDiv").html(html);
	
</script>


</html>







