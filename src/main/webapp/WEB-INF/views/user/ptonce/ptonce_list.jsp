<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container animated fadeInUp">
	<div class="my-page-box">	
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>1회 PT 신청 내역 목록(회원)</h1>
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
						<c:set var="cnt" value="1" />
						<c:forEach var="ptOnce" items="${ptonceList}" >
							<div class="panel-group accordion" id="accordion">
							<!-- 신청글 -->
								<div class="panel panel-default">
									<div class="">
		                               <c:set var="index" value="${index+1 }" />
		                               <table class="table table-hover personalTable">
		                                    <tbody>
		                                        <tr>
		                                            <td class="accordionBoard" style="width: 70px;"><strong>${index }</strong></td>
		                                            <td class="accordionBoard" style="width: auto;"></td>
		                                            <td class="accordionBoard" style="width: 100px;">${fn:substring(ptOnce.ptOnceApplicationDate,0,11) }</td>
		                                        	<td class="accordionBoard" style="width: 140px;">${ptOnce.trainerNo}</td>
		                                        	<!-- 확인 상태 -->
		                                        	<td class="accordionBoard" style="width: 65px;">
			                                        	<c:choose>
			                                        		<c:when test="${ptOnce.ptOnceStatus eq '0' }">미확인</c:when>
		                                        			<c:when test="${ptOnce.ptOnceStatus eq '1' }">확인</c:when>
		                                        			<c:otherwise>완료</c:otherwise>
		                                        		</c:choose>
		                                        	</td>
		                                        	<td style="width: 76px;">
		                                        	<butoon data-toggle="collapse" data-parent="#accordion" href="#${ptOnce.ptOnceNo}" class="collapsed btn btn-default ptOnceBtn" aria-expanded="false">
														상세보기</butoon>></td>
													<td style="width: 76px;">
														<button data-toggle="collapse" data-parent="#accordion" class="collapsed btn btn-primary ptOnceBtn" aria-expanded="false"
														type="button" onclick="location.href='${pageContext.request.contextPath}/review/write?trainerNo=${ptOnce.trainerNo }';" >리뷰쓰기</button>
													</td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
									<div id="${ptOnce.ptOnceNo}" class="panel-collapse collapse"
											aria-expanded="false" style="height: 0px;">
									<hr>
									<!-- 성별, 연령, 운동경험, 운동목적 , 특이사항  -->
										<div class="ptOncePersonalContent">
											<div class="">성별 : ${ptOnce.ptOnceGender}</div>
											<div class="">연령 : ${ptOnce.ptOnceAge}</div>
											<div class="">운동경험 : ${ptOnce.ptOnceExperience}</div>
											<div class="">운동목적 :${ptOnce.ptOncePurpose}<br></div>
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