<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="container">
	<div class="notice-list-print">
		<div class="notice-list-title">
			<h1 class="panel-title">PT 문의 내역 리스트</h1>
		</div>
		<br>
		<div >
		<select id="category" name="category">
			<option <c:if test="${status==9 }">selected="selected"</c:if> value="9" >전체</option>
			<option <c:if test="${status==2 }">selected="selected"</c:if> value="2">미확인</option>
			<option <c:if test="${status==3 }">selected="selected"</c:if> value="3">확인</option>
		</select>
		</div>
		<div class="panel-body">
			<c:choose>
				<c:when test="${empty(ptQnaList) }">
					<div align="center">
						<h3>확인 내역이 없습니다.</h3>
					</div>
				</c:when>
				<c:otherwise>
					<c:set var="cnt" value="1" />
					<c:forEach var="ptQna" items="${ptQnaList }">
						<div class="panel-group accordion" id="accordion">
							<!-- 문의글 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title" style="font-size: 20px;">
										<!-- 글번호 -->
										<c:set var="index1" value="${index1+1 }" />
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false"><strong>${index1 }</strong></a>
										<!-- 제목 -->
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false">
											${ptQna.ptServiceTitle}</a>
										<!-- 날짜 -->
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false">
											${fn:substring({ptQna.ptServiceDate},1,12)} </a>
										<!-- 글내용 보기 -->
										<a data-toggle="collapse" data-parent="#accordion"
											href="#${index1 }" class="collapsed" aria-expanded="false">
											상세보기</a>
										<!-- 확인여부 -->
										<a data-toggle="collapse" data-parent="#accordion" href="#"
											class="collapsed" aria-expanded="false">
											확인</a>
									</div>
									<!-- 글 상세내용 -->
									<div id="${index1 }" class="panel-collapse collapse"
										aria-expanded="false" style="height: 0px;">
										<div class="panel-body">${ptQna.ptServiceContent}</div>
										
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<!-- 버튼 -->
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
		html += "<a href='<c:url value="/ptqna/list/status"/>?pageNum=1&confirmStatus="+$("category").val()+"'>[처음]</a>";
		html += "<a href='<c:url value="/ptqna/list/status"/>?pageNum=${pager.prevPage}&confirmStatus="+$("category").val()+"'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/ptqna/list/status"/>?pageNum="+i+"&confirmStatus="+$("category").val()+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/ptqna/list/status"/>?pageNum=${pager.nextPage}&confirmStatus="+$("category").val()+"'>[>]</a>";
		html += "<a href='<c:url value="/ptqna/list/status"/>?pageNum=${pager.totalPage}&confirmStatus="+$("category").val()+"'>[마지막]</a>";
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
		location.href = "${pageContext.request.contextPath}/ptqna/list/status?confirmStatus="+confirmStatus;
	})
	</script>
</html>







