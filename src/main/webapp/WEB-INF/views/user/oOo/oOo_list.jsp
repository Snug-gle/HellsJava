<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container animated fadeInUp">
	<div class="my-page-box">
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>1:1 문의 내역</h1>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty(oOoList) }">
						<div class="panel panel-default">
							<div align="center" class="boardEmptyWriting">
								<h3>문의 내역이 없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:set var="cnt" value="1" />
						<c:forEach var="oOo" items="${oOoList}" >
							<div class="panel-group accordion" id="accordion">
								<!-- 문의글 -->
								<div class="panel panel-default">
		                            <div class="">
		                               <c:set var="index1" value="${index1+1 }" />
		                               <table class="table table-hover personalTable">
		                                    <tbody>
		                                        <tr>
		                                            <td style="width: 100px; text-align: center;">${index1 }</td>
		                                            <td style="width: auto;"><a data-toggle="collapse" data-parent="#accordion" href="#${index1 }"
													class="collapsed" aria-expanded="false">
													${oOo.noticeServiceTitle}</a></td>
		                                            <td style="width: 100px;">${fn:substring({oOo.noticeServiceDate},1,12)}</td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
		                            <!-- 글상세 -->
		                            <div id="${index1 }" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
										<div class="personalContent">${oOo.noticeServiceContent}</div>
									</div>
									<!-- 답글 -->
									<div class="panel panel-default">
										<c:choose>
											<c:when test="${empty(oOo.noticeServiceReply)}">
												<div class="personalContent">
													<h3>답변 드릴 예정입니다.</h3>
												</div>
											</c:when>
											<c:otherwise>
												<div class="">
													<table class="table table-hover">
														<tbody>
															<tr>
																<td style="width: 100px; text-align: center;">ㄴ답글</td>
																<td style="width: auto;"><a data-toggle="collapse" data-parent="#accordion" href="#${oOo.noticeServiceNo}"
															class="collapsed" aria-expanded="false">
															${oOo.noticeServiceTitle}</a></td>
																<td style="width: 100px;"></td>
															</tr>
														</tbody>
													</table>
												</div>
											</c:otherwise>
										</c:choose>
										<!-- 답글상세 -->
										<div id="${oOo.noticeServiceNo}" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
											<div class="personalContent">${oOo.noticeServiceReply}</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>	
				</c:choose>	
				<!-- 마이페이지 이동 버튼 -->
				<div style="text-align: right; margin: 10px;">
					<button type="button" class="btn btn-primary"
				onclick="location.href='<c:url value="/oOo/write"/>';">1:1 문의 작성</button>
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
		html += "<a href='<c:url value="/oOo/list"/>?pageNum=1'>[처음]</a>";
		html += "<a href='<c:url value="/oOo/list"/>?pageNum=${pager.prevPage}'>[c]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/oOo/list"/>?pageNum="+i+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/oOo/list"/>?pageNum=${pager.nextPage}'>[>]</a>";
		html += "<a href='<c:url value="/oOo/list"/>?pageNum=${pager.totalPage}'>[마지막]</a>";
	} else {
		html += "[>][마지막]";
	}
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html);
</script>


