<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container animated fadeInUp">
	<div class="my-page-box">
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>1회 피티 신청 내역 목록</h1>
				</div>
			</div>
			<div>
				<select id="category" name="category">
					<option <c:if test="${status==9 }">selected="selected"</c:if>
						value="9">전체</option>
					<option <c:if test="${status==0 }">selected="selected"</c:if>
						value="0">미확인</option>
					<option <c:if test="${status==1 }">selected="selected"</c:if>
						value="1">확인</option>
					<option <c:if test="${status==2 }">selected="selected"</c:if>
						value="2">완료</option>
				</select>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty(ptOnceList) }">
						<div align="center">
							<h3>검색된 내역이 없습니다.</h3>
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
													<td style="width: 100px; text-align: center;">${number2 }</td>
													<!-- 날짜 -->
													<td style="width: 100px;">${fn:substring({ptOnce.ptOnceApplicationDate},1,12)}</td>
													<!-- 회원이름,연락처 -->
													<td style="width: 300px;">${ptOnce.memberName }&nbsp;&nbsp;&nbsp;${ptOnce.memberPhone}
													</td>
													<!-- 상태 -->
													<c:if test="${ptOnce.ptOnceStatus eq '0'}"><td style="width: 100px;">미확인</td></c:if>
													<c:if test="${ptOnce.ptOnceStatus eq '1'}"><td style="width: 100px;">확인</td></c:if>
													<c:if test="${ptOnce.ptOnceStatus eq '2'}"><td style="width: 100px;">완료</td></c:if>
													<!-- 상세보기 -->
													<td style="width: auto;"><a data-toggle="collapse"
														data-parent="#accordion" href="#${ptOnce.ptOnceNo }"
														class="collapsed" aria-expanded="false"> 상세보기</a></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 글 상세내용 (성별, 나이, 경험, 목적, 특이사항)-->
									<div id="${ptOnce.ptOnceNo }" class="panel-collapse collapse"
										aria-expanded="false" style="height: 100px;">
										<!-- 성별 -->
										<c:if test="${ptOnce.ptOnceGender eq '1' }">
											<div class="personalContent">남자</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceGender eq '2' }">
											<div class="personalContent">여자</div>
										</c:if>
										<!-- 연령대 -->
										<c:if test="${ptOnce.ptOnceAge eq '1' }">
											<div class="personalContent">10대</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceAge eq '2' }">
											<div class="personalContent">20대</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceAge eq '3' }">
											<div class="personalContent">30대</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceAge eq '4' }">
											<div class="personalContent">40대</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceAge eq '5' }">
											<div class="personalContent">50대</div>
										</c:if>
										<!-- 운동 경험 -->
										<c:if test="${ptOnce.ptOncePurpose eq '1' }">
											<div class="personalContent">1달 미만</div>
										</c:if>
										<c:if test="${ptOnce.ptOncePurpose eq '2' }">
											<div class="personalContent">3개월</div>
										</c:if>
										<c:if test="${ptOnce.ptOncePurpose eq '3' }">
											<div class="personalContent">6개월</div>
										</c:if>
										<c:if test="${ptOnce.ptOncePurpose eq '4' }">
											<div class="personalContent">1년이상</div>
										</c:if>
										<!-- 운동 목적 -->
										<c:if test="${ptOnce.ptOnceExperience eq '1' }">
											<div class="personalContent">다이어트</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceExperience eq '2' }">
											<div class="personalContent">체력 증진</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceExperience eq '3' }">
											<div class="personalContent">취미활동</div>
										</c:if>
										<c:if test="${ptOnce.ptOnceExperience eq '4' }">
											<div class="personalContent">기타</div>
										</c:if>
										<!-- 특이 사항 -->
										<div class="personalContent">${ptOnce.ptOnceSignificant}</div>
											<div class="btnGroup">
										<!-- 버튼 -->
										<c:choose>
											<c:when test="${ptOnce.ptOnceStatus eq '0' }">
										
										<!-- 미확인 상태일시  -->
											 <button class="btn btn-primary" type="button" style="align-content: center;"
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
					<div class="btnGroup">
				<!-- 버튼 -->
				<button type="button"
					onclick="location.href='<c:url value="/mypage"/>';">마이페이지로
					이동</button>
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
		html += "<a href='<c:url value="/ptqna/list/miss"/>?pageNum=1'>[처음]</a>";
		html += "<a href='<c:url value="/ptqna/list/miss"/>?pageNum=${pager.prevPage}'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptqna/list/miss"/>?pageNum="+i+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptqna/list/miss"/>?pageNum=${pager.nextPage}'>[>]</a>";
		html += "<a href='<c:url value="/ptqna/list/miss"/>?pageNum=${pager.totalPage}'>[마지막]</a>";
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