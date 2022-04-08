<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container animated fadeInUp">
	<div class="my-page-box">
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>1회 PT 신청 내역 목록
						<div class="reviewRight" style="float: right;">
							<select id="category" name="category" class="btn btn-primary dropdown-toggle">
								<option <c:if test="${status==9 }">selected="selected"</c:if> value="9">전체</option>
								<option <c:if test="${status==0 }">selected="selected"</c:if> value="0">미확인</option>
								<option <c:if test="${status==1 }">selected="selected"</c:if> value="1">확인</option>
								<option <c:if test="${status==2 }">selected="selected"</c:if> value="2">완료</option>
							</select>
						</div>	
					</h1>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty(ptOnceList) }">
						<div class="panel panel-default">
							<div align="center" class="boardEmptyWriting">
								<h3>검색된 내역이 없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var ="su" value="${number}"/>
						<c:forEach var="ptOnce" items="${ptOnceList}" varStatus="status">
							 <c:set var ="number2" value="${su-status.index}"/>
							<div class="panel-group accordion" id="accordion">
								<!-- 문의글 -->
								<div class="panel panel-default">
									<div class="">
										<table class="table table-hover personalTable">
											<tbody>
												<tr>
													<!-- 번호 -->
													<td class="accordionBoard" style="width: 70px;"><strong>${number2 }</strong></td>
													<td class="accordionBoard" style="width: auto;"></td>
													<!-- 날짜 -->
													<td class="accordionBoard" style="width: 100px;">${fn:substring({ptOnce.ptOnceApplicationDate},1,12)}</td>
													<!-- 회원이름 -->
													<td class="accordionBoard" style="width: 80px;">${ptOnce.memberName }</td>
													<!-- 연락처 -->
													<td class="accordionBoard" style="width: 150px;">${ptOnce.memberPhone}</td>
													<!-- 상태 -->
													<c:if test="${ptOnce.ptOnceStatus eq '0'}"><td style="width: 70px;">미확인</td></c:if>
													<c:if test="${ptOnce.ptOnceStatus eq '1'}"><td style="width: 70px;">확인</td></c:if>
													<c:if test="${ptOnce.ptOnceStatus eq '2'}"><td style="width: 70px;">완료</td></c:if>
													<!-- 상세보기 -->
													<td style="width: 76px;"><a data-toggle="collapse"
														data-parent="#accordion" href="#${ptOnce.ptOnceNo }"
														class="collapsed btn btn-default ptOnceBtn" aria-expanded="false"> 상세보기</a></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 글 상세내용 (성별, 나이, 경험, 목적, 특이사항)-->
									<div id="${ptOnce.ptOnceNo }" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
										<hr>
											<!-- 성별 -->
											<div class="ptPersonalContent"><label class="trainer-ptonce-content-label">성별</label>
												<c:if test="${ptOnce.ptOnceGender eq '1' }">
													<div style="display: inline-block;">남자</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceGender eq '2' }">
													<div style="display: inline-block;">여자</div>
												</c:if>
											</div>
											<!-- 연령대 -->
											<div class="ptPersonalContent"><label class="trainer-ptonce-content-label">연령대</label>
												<c:if test="${ptOnce.ptOnceAge eq '1' }">
													<div style="display: inline-block;">10대</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceAge eq '2' }">
													<div style="display: inline-block;">20대</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceAge eq '3' }">
													<div style="display: inline-block;">30대</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceAge eq '4' }">
													<div style="display: inline-block;">40대</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceAge eq '5' }">
													<div style="display: inline-block;">50대</div>
												</c:if>
											</div>
											<!-- 운동 경험 -->
											<div class="ptPersonalContent"><label class="trainer-ptonce-content-label">운동경험</label>
												<c:if test="${ptOnce.ptOncePurpose eq '1' }">
													<div style="display: inline-block;">1달 미만</div>
												</c:if>
												<c:if test="${ptOnce.ptOncePurpose eq '2' }">
													<div style="display: inline-block;">3개월</div>
												</c:if>
												<c:if test="${ptOnce.ptOncePurpose eq '3' }">
													<div style="display: inline-block;">6개월</div>
												</c:if>
												<c:if test="${ptOnce.ptOncePurpose eq '4' }">
													<div style="display: inline-block;">1년이상</div>
												</c:if>
											</div>
											<!-- 운동 목적 -->
											<div class="ptPersonalContent"><label class="trainer-ptonce-content-label">운동목적</label>
												<c:if test="${ptOnce.ptOnceExperience eq '1' }">
													<div style="display: inline-block;">다이어트</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceExperience eq '2' }">
													<div style="display: inline-block;">체력 증진</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceExperience eq '3' }">
													<div style="display: inline-block;">취미활동</div>
												</c:if>
												<c:if test="${ptOnce.ptOnceExperience eq '4' }">
													<div style="display: inline-block;">기타</div>
												</c:if>
											</div>
											<!-- 특이 사항 -->
											<div class="ptPersonalContent"><label class="trainer-ptonce-content-label">특이사항</label>
												<div style="display: inline-block;">${ptOnce.ptOnceSignificant}</div>
											</div>
											<br>
											<div class="btnGroup">
												<!-- 버튼 -->
												<c:choose>
													<c:when test="${ptOnce.ptOnceStatus eq '0' }">
												
												<!-- 미확인 상태일시  -->
													 <button class="btn btn-primary" type="button"
														onclick="location.href='<c:url value="/ptonce/trainer/modify"/>/${ptOnce.ptOnceNo }/1';">확인</button>										
													</c:when>
													<c:when test="${ptOnce.ptOnceStatus eq '1' }">
														<button class="btn btn-primary"  type="button"
														onclick="location.href='<c:url value="/ptonce/trainer/modify"/>/${ptOnce.ptOnceNo }/2';">완료</button> 
													</c:when>
												<c:otherwise></c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div style="text-align: right; margin: 10px;">
					<!-- 버튼 -->
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
		html += "<a href='<c:url value="/ptonce/trainer/list"/>?pageNum=1'>[처음]</a>";
		html += "<a href='<c:url value="/ptonce/trainer/list"/>?pageNum=${pager.prevPage}'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptonce/trainer/list"/>?pageNum="+i+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptonce/trainer/list"/>?pageNum=${pager.nextPage}'>[>]</a>";
		html += "<a href='<c:url value="/ptonce/trainer/list"/>?pageNum=${pager.totalPage}'>[마지막]</a>";
	} else {
		html += "[>][마지막]";
	}
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html);

	// 카테고리 변경 시 get 요청
	$("#category").change(function () {
		var ptOnceStatus = $(this).val();
		location.href="${pageContext.request.contextPath}/ptonce/trainer/list/status?ptOnceStatus="+ptOnceStatus;
	})

	</script>