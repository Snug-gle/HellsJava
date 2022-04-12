<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container animated fadeInUp">
	<div class="my-page-box">
		<div class="notice-list-print">
			<div class="pageheader" style="font-size: 20px;">
				<div style="text-align: center;">
					<h1>내가 쓴 리뷰</h1>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty(reviewrList) }">
						<div class="panel panel-default">
							<div align="center" class="boardEmptyWriting">
								<h3>작성된 리뷰가 없습니다.</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="reviewList" items="${reviewrList }" >
							<form class="reviewUpdateForm${reviewList.ptServiceNo}">
								<input type="hidden" id="ptServiceNo${reviewList.ptServiceNo}" name="ptServiceNo" value="${reviewList.ptServiceNo}">
								<input type="hidden" id="ptServiceStatus${reviewList.ptServiceNo}" name="ptServiceStatus" value="1">
							</form>
							<div id="review-posting">
								<div class="panel panel-solid-primary reviewlistContent">
									<div class="form-group">
										<div style="float: left; ">
											<h3 class="panel-title" style="vertical-align: middle;"><strong>${reviewList.ptServiceTitle }</strong></h3>
										</div>
										<div class="reviewRight">
											<h3 class="tr-name${reviewList.ptServiceNo}"><strong>${reviewList.memberName }&nbsp;트레이너</strong></h3>
											<input type="hidden" class="tr-trainerNo${reviewList.ptServiceNo }" value="${reviewList.trainerNo }">
										</div>
									</div>
									<div class="form-group">
										<div style="float: left; ">
											<label style="float: left; text-align: right; padding-right: 10px;">별점</label>
											<div style="float: left; ">
												<fmt:parseNumber var="star" value="${reviewList.ptServiceStars }" integerOnly="true" />
												<c:set var="starhalf"
													value="${(reviewList.ptServiceStars /0.5)%2 }" />

												<c:forEach begin="1" step="1" end="${star}">
													<i class="fa fa-star"></i>
												</c:forEach>
												<c:if test="${starhalf == 1}">
													<i class="fa fa-star-half-o"></i>

													<c:forEach begin="1" step="1" end="${(5-starhalf)-star}">
														<i class="fa fa-star-o"></i>
													</c:forEach>
												</c:if>
												<c:if test="${starhalf != 1}">
													<c:forEach begin="1" step="1" end="${5-star}">
														<i class="fa fa-star-o"></i>
													</c:forEach>
												</c:if>
											</div>
										</div>
										<div class="reviewRight">
											<span>${fn:substring({reviewList.ptServiceDate},1,12)}</span>
										</div>
										<hr>
									</div>
									<div class="form-group">
										<p>${reviewList.ptServiceContent}</p>
									</div>
				
									<c:if test="${reviewList.ptServiceReply != null}">
										<div class="reviewbody-body-re">
											<p><span>${reviewList.memberName }</span> : ${reviewList.ptServiceReply}</p>
										</div>
									</c:if>
									<div class="reviewRight">
										<c:if test="${reviewList.ptServiceReply == null}">
											<button class="reviewMobtn btn btn-primary" type="button">수정</button> 
											<button class="reviewDebtn btn btn-default" type="button">삭제</button>
										</c:if>
										<c:if test="${reviewList.ptServiceReply != null}">
											<p>댓글이 달린 리뷰는 수정 및 삭제를 할 수 없습니다</p>
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
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
	html += "<a href='<c:url value="/review/list/"/>?pageNum=1'>[처음]</a>";
	html += "<a href='<c:url value="/review/list/"/>?pageNum=${pager.prevPage}'>[<]</a>";
} else {
	html += "[처음][<]";
}
//페이지 번호 설정
for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
	if (${pager.pageNum} != i) {
		html += "<a href='<c:url value="/review/list/"/>?pageNum="+i+"'> [" + i + "] </a>";
	} else {
		html += "[" + i + "]";
	}
}
//[다음],[마지막] 이동 설정
if (${pager.endPage} != ${pager.totalPage}) {
	html += "<a href='<c:url value="/review/list/"/>?pageNum=${pager.nextPage}'>[>]</a>";
	html += "<a href='<c:url value="/review/list/"/>?pageNum=${pager.totalPage}'>[마지막]</a>";
} else {
	html += "[>][마지막]";
}
	
//페이징 처리 결과 출력
$("#pageNumDiv").html(html);
	
	// 작성한 리뷰가 있을 때
	//alert(${reviewExistsMsg});

	
	//삭제
	$(".reviewDebtn").click(function() {
		var ptServiceNo =  $(this).parent().parent().parent().prev().children(
		'input:eq(0)').val(); // #ptServiceNo

		
		location.href = "${pageContext.request.contextPath}/review/reviewDelete?ptServiceNo="+ptServiceNo;
	})
	
	//수정
	$(".reviewMobtn").click(function() {

		var ptServiceNo = $(this).parent().parent().parent().prev().children(
		'input:eq(0)').val(); // ptServiceNo
		var trainerNo = $(".tr-trainerNo"+ptServiceNo).val(); // 트레이너 번호

		// 그냥 url get 요청으로 트레이너 번호랑 ptservieno 보내면 댐
		location.href = "${pageContext.request.contextPath}/review/update?ptServiceNo="+ptServiceNo+"&trainerNo="+trainerNo;
	})
			
</script>
	