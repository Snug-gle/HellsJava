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
			</div>
		</div>
	</div>
</div>

	
<script type="text/javascript">
	
	//삭제
	$(".reviewDebtn").click(function() {
		var id = $(this).parent().parent().prev().children().val(); // #ptServiceNo
		$(".reviewUpdateForm"+id).attr("action","<c:url value='/review/list/reviewUpdate'/>");
		$("#ptServiceStatus"+id).val('0');
		$(".reviewUpdateForm"+id).submit();
	})
	
	//수정
	$(".reviewMobtn").click(function() {
		var id = $(this).parent().parent().prev().children().val();
		var name = $(".tr-name"+id).text();//트레이너 이름
		$(".reviewUpdateForm"+id).attr("action","<c:url value='/review/write'/>");
		$(".reviewUpdateForm"+id).submit();
	})
			
</script>
	