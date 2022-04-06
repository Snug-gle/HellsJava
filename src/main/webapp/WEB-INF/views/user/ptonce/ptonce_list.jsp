<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="container">
	<div class="notice-list-print">
		<div class="notice-list-title">
			<h1 class="panel-title">1회 PT 신청 내역 목록(회원)</h1>
		</div>
		<div class="panel-body">
			<c:choose>
				<c:when test="${empty(ptonceList) }">
					<div align="center">
						<h3>신청 내역이 없습니다.</h3>
					</div>
				</c:when>
				<c:otherwise>
					<c:set var="cnt" value="1" />
					<c:forEach var="ptOnce" items="${ptonceList}" >
						<div class="panel-group accordion" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title">
										<!-- 글번호 -->
										<c:set var="index" value="${index+1 }" />
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false"><strong>${index }</strong></a>
										<!-- 제목 -->
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false">
											${fn:substring(ptOnce.ptOnceApplicationDate,0,11) }</a>
										<!-- 트레이너 이름 -->
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false"> 트레이너 이름 들어가야함</a>
										<!-- 확인 상태 -->
										<c:choose>
											<c:when test="${ptOnce.ptOnceStatus eq '0' }">
												<a data-toggle="collapse" data-parent="#accordion" href="#"
													class="collapsed" aria-expanded="false">미확인</a>
											</c:when>
											<c:when test="${ptOnce.ptOnceStatus eq '1' }">
												<a data-toggle="collapse" data-parent="#accordion" href="#"
													class="collapsed" aria-expanded="false">확인</a>
											</c:when>
											<c:otherwise>
												<a data-toggle="collapse" data-parent="#accordion" href="#"
													class="collapsed" aria-expanded="false">완료</a>
											</c:otherwise>
										</c:choose>
										<!-- 상세보기 -->
										<a data-toggle="collapse" data-parent="#accordion"
											href="#${ptOnce.ptOnceNo}" class="collapsed" aria-expanded="false">
											상세보기</a>
										<!-- 리뷰쓰기 -->
										<a data-toggle="collapse" data-parent="#accordion"
											href="<c:url value='review/write'/>" class="collapsed"
											aria-expanded="false"> 리뷰쓰기</a>
									</div>
									<!-- 상세내용 -->
									<div id="${ptOnce.ptOnceNo }" class="panel-collapse collapse"
										aria-expanded="false" style="height: 0px;">
										<!-- 성별, 연령, 운동경험, 운동목적 , 특이사항  -->
									
								<div class="panel-body">성별 : ${ptOnce.ptOnceGender}</div>
								<div class="panel-body">연령 : ${ptOnce.ptOnceAge}</div>
								<div class="panel-body">운동경험 : ${ptOnce.ptOnceExperience}</div>
								<div class="panel-body">운동목적 :${ptOnce.ptOncePurpose}<br></div>
								<div class="panel-body">특이사항 :${ptOnce.ptOnceSignificant }</div>
								<div class="panel-body">(확인용) 회원번호 :${ptOnce.ptOnceNo }</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<button type="button"
				onclick="location.href='<c:url value="/mypage"/>';">마이페이지로
				이동</button>
			<%-- 페이지 번호 출력 --%>
			<div class="panel panel-default">
				<div class="panel-body" id="pageNumDiv"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var page = 1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
	var html = ""; //페이지 번호 출력하기 위한 전역 변수
	//페이징 처리 
	//[처음], [이전] 이동 설정
	if (${pager.startPage} > ${pager.blockSize}) {
		html += "<a href='<c:url value="/ptonce/list"/>?pageNum=1'>[처음]</a>";
		html += "<a href='<c:url value="/ptonce/list"/>?pageNum=${pager.prevPage}'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptonce/list"/>?pageNum="+i+"'>[" + i + "]</a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptonce/list"/>?pageNum=${pager.nextPage}'>[다음]</a>";
		html += "<a href='<c:url value="/ptonce/list"/>?pageNum=${pager.totalPage}'>[마지막]</a>";
	} else {
		html += "[>][마지막]";
	}
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html);
</script>


</html>







