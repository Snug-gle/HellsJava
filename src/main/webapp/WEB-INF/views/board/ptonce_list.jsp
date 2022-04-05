<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<h1 align="center">1회 PT 신청 내역 목록(회원)</h1>

<%-- <c:choose>
	<c:when test="${empty(ptOnceList) }">
		<div align="center">
			<h3>검색된 정보가 없습니다.</h3>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="ptOnce" items="${ptOnceList}" >
			<!-- 리스트 타이틀 -->
			<div class="panel-body">
				<div class="panel-group accordion" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">
							${전체게시글수 - (현재페이지-1)*페이지당 보여지는 게시물수 - i.index}
								<div>번호</div>
								<div>날짜</div>
								<div>트레이너</div>
								<div>${ptOnce.ptOnceStatus } </div>
								<div>
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" class="collapsed" aria-expanded="false">
										상세보기</a>
								</div>
								<div class="collapsed">
									<a href="#">리뷰쓰기</a>
								</div>
							</div>
						</div>
						<!-- 상세내용 -->
						<div id="collapseOne" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">
							성별 : ${ptOnce.ptOnceGender}<br>
							나이대 : ${ptOnce.ptOnceAge}<br>
							경험 : ${ptOnce.ptOnceExperience}<br>
							목적 : ${ptOnce.ptOncePurpose}<br>
							특이사항 : ${ptOnce.ptOnceSignificant}<br>
						</div>
							<button type="button" onclick="location.href='<c:url value="/mypage"/>';">확인</button>
							<button type="button" onclick="history.back()">목록</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</c:otherwise>
</c:choose> 
 --%>


<%-- <c:forEach var="pager" items="{pager}" begin="${pager.starRow }" end="${pager.endRow }">
			<li class="${pager.pageNum eq pageNum ? 'active' : '' }">
			<a href="<c:url value='ptonce/list?pageNum=${pager.pageNum }'/>"></a></li>
		</c:forEach>  --%>
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
								<div class="panel-body">
									특이사항
									:${ptOnce.ptOnceSignificant }
								</div>
								<div class="panel-body">
									(확인용) 회원번호
									:${ptOnce.ptOnceNo }
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
</div>

</html>







