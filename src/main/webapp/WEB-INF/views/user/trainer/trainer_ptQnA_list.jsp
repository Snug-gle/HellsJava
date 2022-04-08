<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container">
	<div class="my-page-box">
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>
						PT 문의 내역
						<div class="reviewRight" style="float: right;">
							<select id="category" name="category"
								class="btn btn-primary dropdown-toggle">
								<option <c:if test="${status==9 }">selected="selected"</c:if>
									value="9">전체</option>
								<option <c:if test="${status==2 }">selected="selected"</c:if>
									value="2">미확인</option>
								<option <c:if test="${status==3 }">selected="selected"</c:if>
									value="3">확인</option>
							</select>
						</div>
					</h1>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty(ptQnaList) }">
						<div class="panel panel-default">
							<div align="center" class="boardEmptyWriting">
								<h3>확인 내역이 없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="su" value="${number}" />
						<c:forEach var="ptQna" items="${ptQnaList }" varStatus="status">
							<c:set var="number2" value="${su-status.index}" />
							<div class="panel-group accordion" id="accordion">
								<!-- 문의글 -->
								<div class="panel panel-default">
									<div class="">
										<table class="table table-hover personalTable">
											<tbody>
												<tr>
													<td class="accordionBoard" style="width: 70px;"><strong>${number2 }</strong></td>
													<td class="accordionBoard" style="width: auto;">${ptQna.ptServiceTitle }</td>
													<td class="accordionBoard" style="width: 100px;">${fn:substring({ptQna.ptServiceDate},1,12)}</td>
													<td class="accordionBoard"
														style="width: 180px; text-align: justify;">${ptQna.memberName }&nbsp;회원</td>
													<!-- 확인여부 -->
													<td class="accordionBoard" style="width: 65px;"><c:choose>
															<c:when test="${ptQna.ptServiceStatus eq '2' }">미확인</c:when>
															<c:when test="${ptQna.ptServiceStatus eq '3' }">확인</c:when>
															<c:otherwise>완료</c:otherwise>
														</c:choose></td>
													<td style="width: 76px;"><a data-toggle="collapse"
														data-parent="#accordion" href="#${number2 }"
														class="collapsed btn btn-default ptOnceBtn"
														aria-expanded="false"> 상세보기</a></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- 글 상세내용 -->
									<div id="${number2 }" class="panel-collapse collapse"
										aria-expanded="false" style="height: 0px;">
										<div class="personalContent">${ptQna.ptServiceContent}
											<!-- 모달 버튼 -->
											<!-- 답글 있으면 수정 못하게 해야겠지? -->
											<div class="reviewRight">
												<button class="btn btn-primary" type="button"
													data-toggle="modal" data-target="#formModal">수정</button>
											</div>
											<!-- 수정페이지 모달 -->
											<div class="modal fade" id="formModal" role="dialog">
												<div class="modal-dialog" id="modal-dialog"
													style="text-align: left;">
													<div class="modal-content">
														<div class="modal-header">
															<div class="logo-location">
																<a href="<c:url value="/"/>" class="modal-header-logo"><i
																	class="icon-layers"></i>오늘의 짐</a>
															</div>
														</div>
														<div class="modal-body">
															<div id="login-wrapper">
																<div class="panel panel-primary">
																	<div class="panel-heading">
																		<h3 class="panel-title">PT 문의 수정</h3>
																	</div>
																	<form action="<c:url value='/ptqna/trainer/modify'/>"
																		method="post" class="form-horizontal" role="form">
																		<div class="form-group">
																			<label for="inputTitle"
																				class="col-sm-2 control-label">제목</label>
																			<div class="col-sm-10">
																				<input type="hidden" name="ptServiceNo"
																					class="form-control" value="${ptQna.ptServiceNo }">
																				<input type="text" name="ptServiceTitle"
																					class="form-control" value="${ptQna.ptServiceTitle }">
																			</div>
																		</div>
																		<div class="form-group">
																			<label for="inputTitle"
																				class="col-sm-2 control-label">내용</label>
																			<div class="col-sm-10">
																				<textarea name="ptServiceContent"
																					class="form-control">${ptQna.ptServiceContent}</textarea>
																			</div>
																		</div>
																		<div class="reviewRight">
																			<button type="submit" class="btn btn-primary">수정</button>
																			<button type="button" class="btn btn-primary"
																				onclick="location.href='<c:url value="/ptqna/list"/>';">목록</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<!-- 버튼 -->
				<div style="text-align: right; margin: 10px;">
					<%--<button type="button" class="btn btn-primary" onclick="">PT 문의 작성</button>--%>
					<button type="button" class="btn btn-primary"
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
		html += "<a href='<c:url value="/ptqna/trainer/list/status"/>?pageNum=1&confirmStatus="+$("#category").val()+"'>[처음]</a>";
		html += "<a href='<c:url value="/ptqna/trainer/list/status"/>?pageNum=${pager.prevPage}&confirmStatus="+$("#category").val()+"'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptqna/trainer/list/status"/>?pageNum="+i+"&confirmStatus="+$("#category").val()+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptqna/trainer/list/status"/>?pageNum=${pager.nextPage}&confirmStatus="+$("#category").val()+"'>[>]</a>";
		html += "<a href='<c:url value="/ptqna/trainer/list/status"/>?pageNum=${pager.totalPage}&confirmStatus="+$("#category").val()+"'>[마지막]</a>";
	} else {
		html += "[>][마지막]";
	}
	
	
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html);
	
	// 확인,미확인 상태 변경 시 해당 리스트 요청 함수
	$("#category").change(function() {
		
		// 확인여부 상태 값
		var confirmStatus = $(this).val();
		// 값 담아서 get 요청
		location.href = "${pageContext.request.contextPath}/ptqna/trainer/list/status?confirmStatus="+confirmStatus;
	})
	</script>
</html>







