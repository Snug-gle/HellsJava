<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container animated fadeInUp">
	<div class="my-page-box">	
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>1회 PT 신청 내역 목록</h1>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty(ptonceList) }">
						<div class="panel panel-default">
							<div align="center" class="boardEmptyWriting">
								<h3>신청 내역이 없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="su" value="${number }" />
						<c:forEach var="ptOnce" items="${ptonceList}" varStatus="status" >
						<c:set var="number2" value="${su-status.index }"/>
							<div class="panel-group accordion" id="accordion">
							<!-- 신청글 -->
								<div class="panel panel-default">
									<div class="">
		                                  <table class="table table-hover personalTable">
		                                    <tbody>
		                                        <tr>
		                                            <td class="accordionBoard" style="width: 70px;"><strong>${number2 }</strong></td>
		                                            <td class="accordionBoard" style="width: auto;"></td>
		                                            <td class="accordionBoard" style="width: 100px;">${fn:substring(ptOnce.ptOnceApplicationDate,0,11) }</td>
		                                        	<td class="accordionBoard" style="width: 180px; text-align: justify;">${ptOnce.memberName}&nbsp;트레이너</td>
		                                        	<!-- 확인 상태 -->
		                                        	<td class="accordionBoard" style="width: 65px;">
			                                        	<c:choose>
			                                        		<c:when test="${ptOnce.ptOnceStatus eq '0' }">미확인</c:when>
		                                        			<c:when test="${ptOnce.ptOnceStatus eq '1' }">확인</c:when>
		                                        			<c:otherwise>완료</c:otherwise>
		                                        		</c:choose>
		                                        	</td>
		                                        	<td style="width: 76px;">
		                                        	<button data-toggle="collapse" data-parent="#accordion" href="#${number2 }" class="collapsed btn btn-default ptOnceBtn" aria-expanded="false">
														상세보기</button></td>
													
													<c:if test="${not empty existsReview}">
														<c:set var="existsReview" value="${existsReview}"/>
														<c:set var="ptOnceTrainerNo" value="${ptOnce.trainerNo }"/>
														
														<c:if test="${fn:contains(existsReview, ptOnceTrainerNo) }"></c:if>	
													</c:if>
													<td style="width: 76px;">
														<button data-toggle="collapse" data-parent="#accordion" class="collapsed btn btn-primary ptOnceBtn" aria-expanded="false"
														type="button" onclick="location.href='${pageContext.request.contextPath}/review/write?trainerNo=${ptOnce.trainerNo }';" >리뷰 작성</button>
													</td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
									<div id="${number2 }" class="panel-collapse collapse"
											aria-expanded="false" style="height: 0px;">
									<hr>
									<!-- 성별, 연령, 운동경험, 운동목적 , 특이사항  -->
										<div class="ptOncePersonalContent">
												<div class="">
													<c:choose>
														<c:when test="${ptOnce.ptOnceGender eq 1}">
															성별 : 남자	
														</c:when>
														<c:when test="${ptOnce.ptOnceGender eq 2}">
															성별 : 여자	
														</c:when>
													</c:choose>
												</div>
												<div class="">
													<c:choose>
														<c:when test="${ptOnce.ptOnceAge eq 1}">연령 : 10대</c:when>
														<c:when test="${ptOnce.ptOnceAge eq 2}">연령 : 20대</c:when>
														<c:when test="${ptOnce.ptOnceAge eq 3}">연령 : 30대</c:when>
														<c:when test="${ptOnce.ptOnceAge eq 4}">연령 : 40대</c:when>
														<c:when test="${ptOnce.ptOnceAge eq 5}">연령 : 50대</c:when>
														<c:otherwise>연령 : 60대</c:otherwise>
													</c:choose>
												</div>
												<div class="">
													<c:choose>
														<c:when test="${ptOnce.ptOnceExperience eq 1}">운동경험 : 1달 미만</c:when>
														<c:when test="${ptOnce.ptOnceExperience eq 2}">운동경험 : 3개월</c:when>
														<c:when test="${ptOnce.ptOnceExperience eq 3}">운동경험 : 6개월</c:when>
														<c:otherwise>1년 이상</c:otherwise>
													</c:choose>
												</div>
												<div class="">
													<c:choose>
														<c:when test="${ptOnce.ptOncePurpose eq 1}">운동목적 : 다이어트</c:when>
														<c:when test="${ptOnce.ptOncePurpose eq 2}">운동목적 : 체력 증진</c:when>
														<c:when test="${ptOnce.ptOncePurpose eq 3}">운동목적 : 취미 활동</c:when>
														<c:otherwise>기타</c:otherwise>
													</c:choose>
												</div>
											<div class="">특이사항 :${ptOnce.ptOnceSignificant }</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<!-- 작성버튼, 마이페이지 이동 버튼 -->
				<div style="text-align: right; margin: 10px;">
					<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/mypage"/>';">마이페이지로 이동</button>
				</div>							
				<%-- 페이지 번호 출력 --%>
				<div class="panel panel-default">
					<div class="panel-body" id="pageNumDiv"></div>
				</div>
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