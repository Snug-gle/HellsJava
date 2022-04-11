<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.tab-wrapper .tab-content {
    border: 0;
    border-top: 0;
    padding: 0;
}
</style>
<div class="posting-box">
	<div class="panel-body">
		<div class="tab-wrapper tab-primary">
			<ul class="nav nav-tabs">
				<li class="active tabTitle"><a href="#trainer-posting" data-toggle="tab">트레이너</a></li>
				<li class="tabTitle"><a href="#review-posting" data-toggle="tab">후기</a></li>
			</ul>
			
			<div class="tab-content">
				<div class="tab-pane active" id="trainer-posting">
					<div  style="text-align: center;">
					<ul class="nav nav-tabs tabSideMenu">
						<li class="trainer-sidemenu"><a href="#posting-detail-frofile">소개</a></li>
						<li class="trainer-sidemenu"><a href="#posting-detail-award">자격사항</a></li>
						<li class="trainer-sidemenu"><a href="#posting-detail-schedule">스케줄</a></li>
						<li class="trainer-sidemenu"><a href="#posting-detail-program">프로그램</a></li>
						<li class="trainer-sidemenu"><a href="#posting-detail-price">이용가격</a></li>
						<li class="trainer-sidemenu"><a href="#posting-detail-shop">위치</a></li>
					</ul>
					</div>
					<div class="posting-detail-frofile-top posting-detail-content-panel pdm">
						<div class="trainer-profile">
							<div class="panel-body profile-wrapper" style="background-color: #fff; margin-bottom: 30px;">
								<div class="col-md-3">
									<div class="profile-pic text-center">
										<img src="<spring:url value="/profileImages/${trainer.trainerProfileImg}"/>"
											class="img-circle">
									</div>
								</div>
								<div class="col-md-9">
									<div class="profile-info">
										<h1>${trainer.memberName} 트레이너</h1>
										<span class="text-muted">${trainer.trainerCentername} 센터</span>
										<button type="button" data-toggle="modal"
											data-target="#pt-application" class="btn btn-primary">1회 PT
											신청</button>
										<button type="button" data-toggle="modal"
											data-target="#pt-ask" class="btn btn-primary">문의</button>
										<c:if test="${loginUserinfo.memberNo == trainer.memberNo }">
											<button class="btn btn-primary" type="button" 
											onclick="location.href='${pageContext.request.contextPath}/posting/modify'">포스팅 수정</button>
										</c:if>
									</div>

								</div>
							</div>
							
							<!-- 트레이너 소개 -->
							<div class="col-md-12" id="posting-detail-frofile">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h2 class="h2BoldWhite">트레이너 소개</h2>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
									<div class="frofile-content-body-imglist">
										<img src="<spring:url value="/postingSelfIntroductionImages/${posting.postingSelfIntroductionImg1}"/>" />
										<c:if test="${not empty posting.postingSelfIntroductionImg2}">
											<img src="<spring:url value="/postingSelfIntroductionImages/${posting.postingSelfIntroductionImg2}"/>" />
										</c:if>
										<c:if test="${not empty posting.postingSelfIntroductionImg3}">
											<img src="<spring:url value="/postingSelfIntroductionImages/${posting.postingSelfIntroductionImg3}"/>" />
										</c:if>
										<c:if test="${not empty posting.postingSelfIntroductionImg4}">
											<img src="<spring:url value="/postingSelfIntroductionImages/${posting.postingSelfIntroductionImg4}"/>" />
										</c:if>
									</div>
									<div class="frofile-content-body-text">
										<p>${posting.postingSelfIntroduction}</p>				
									</div>
								</div>
								</div>
							</div>
							
							<!-- 자격사항 -->
							<div class="col-md-12" id="posting-detail-award">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h2 class="h2BoldWhite">수상경력 및 이력</h2>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
										<hr>
										<c:forEach var="awarditem" items="${award}">
											<div class="frofile-award-content-body" >
													<img style="display: inline-block; width: 60px; height: 60px;" alt="" src="<spring:url value="/awardImages/${awarditem.awardImage}"/>"> 
													<label class="posting-label">${awarditem.awardContent}</label>
												<hr>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>

							<!-- PT 스케쥴 -->
							<div class="col-md-12" id="posting-detail-schedule">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h2 class="h2BoldWhite">PT 스케줄</h2>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
										<div class="frofile-schedule-content-body">
											<table>
												<c:forEach var="itemSchedule" items="${schedule}">
													<tr>
														<c:choose>
															<c:when test="${itemSchedule.scheduleWorkday eq 1}">
																<td>평일</td>
															</c:when>
															<c:when test="${itemSchedule.scheduleWorkday eq 2}">
																<td>토요일</td>
															</c:when>
															<c:when test="${itemSchedule.scheduleWorkday eq 3}">
																<td>일요일</td>
															</c:when>
															<c:when test="${itemSchedule.scheduleWorkday eq 4}">
																<td>휴무일</td>
															</c:when>
														</c:choose>
														<c:if test="${empty itemSchedule.scheduleHours}">
															<td>${itemSchedule.scheduleDayoff }</td>
														</c:if>
														<td>${itemSchedule.scheduleHours}</td>
													</tr>
												</c:forEach>	
											</table>
										</div>
									</div>
								</div>
							</div>

							<!-- 프로그램 -->
							<div class="col-md-12" id="posting-detail-program">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h2 class="h2BoldWhite">프로그램 소개</h2>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
										<div class="frofile-program-content-body">
											<p>${posting.postingProgramIntroduction}</p>
										</div>
									</div>
								</div>
							</div>

							<!-- PT 이용가격 -->
							<div class="col-md-12" id="posting-detail-price">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h2 class="h2BoldWhite">PT 이용가격</h2>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
										<div class="posting-price-content-body">
											<c:forEach var="itemPtPricing" items="${ptPricing}">	
												<div class="fposting-price-content-body-num">
													<p>${itemPtPricing.ptPricingRound}회</p>
												</div>
												<div class="posting-price-content-body-text">
													<div class="posting-price-content-body-top">
														<p>
															<span>회당 :</span>&nbsp;<span class="oncePrice">${itemPtPricing.ptPricingPrice}원</span>
														</p>
													</div>
													<div class="posting-price-content-body-low">
														
														<p>
															총 ${itemPtPricing.ptPricingRound * itemPtPricing.ptPricingPrice}<span>원</span>
														</p>
													</div>
												</div>
												<hr>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>

							<!-- 위치 -->
							<div class="col-md-12" id="posting-detail-shop">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h2 class="h2BoldWhite">센터 위치</h2>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
										<div class="posting-shop-content-body">
											<div id="map" style="width:100%;height:350px;"></div>
										</div>
									</div>
								</div>
							</div>
							<!-- 위치 끝 -->
						</div>
					</div>
				</div>
				<!-- 트레이너 끝 -->
				
				<!-- 후기 -->
				
			<div class="tab-pane" id="review-posting" style="text-align: center;">
				
				<c:if test="${empty reviews }">
					<p>등록된 리뷰가 없습니다.</p>
				</c:if>
				
				<c:forEach var="review"  items="${reviews }">
						<div class="panel panel-solid-primary review-posting-box" style="float: left">
							<div class="panel-heading">
								<div style="float: left; ">
									<h3 class="panel-title" style="vertical-align: middle;">${review.ptServiceTitle }</h3>
								</div>
								<div class="reviewRight">
									<a href="${pageContext.request.contextPath}/review/good/${review.ptServiceNo}/${trainer.trainerNo}"><i class="fa fa-heart"></i></a> <label>${review.ptServiceGood }</label>
								</div>
							<hr>
							</div>
							<div class="reviewColor" >
								<div class="reviewNameDate" style="float: left;">
									${review.memberName} ${fn:substring(review.ptServiceDate,0,11)}
								</div>
								<div style=" text-align: right;">
								
								<div>
									<fmt:parseNumber var="star" value="${review.ptServiceStars }" integerOnly="true" />
										<c:set var="starhalf"
											value="${(review.ptServiceStars /0.5)%2 }" />

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
							</div>
							<div class="panel-body">
	 							<p>${review.ptServiceContent }</p>
							</div>
							<c:choose>
								<c:when test="${review.ptServiceReply == null}">	<!-- 답글이 없으면 -->
									<c:if test="${loginUserinfo.memberNo == trainer.memberNo}">
										<div class="reviewColor reviewRight">
											<button type="button" class="btn btn-primary collapsed" data-toggle="collapse" data-target="#ptServiceReply" aria-expanded="false">
				                                    댓글달기</button>
										</div>
										<div class="panel-body collapse" id="ptServiceReply" aria-expanded="false">
											<form action="${pageContext.request.contextPath}/review/reply/write" method="post" id = "replyTextForm">
												<textarea id="ptServiceReplyText" name="ptServiceReply" class="form-control">${review.ptServiceReply }</textarea>
												<input type="hidden" name="ptServiceNo" value="${review.ptServiceNo }">
												<input type="hidden" name="ptServiceStars" value="${review.ptServiceStars }">
												<input type="hidden" name="ptServiceStatus" value="${review.ptServiceStatus }">
												<div class="reviewColor reviewRight">
													<button type="submit" class="btn btn-primary review-btn1">입력</button>
													<button type="reset" class="btn btn-primary review-btn1">다시 쓰기</button>
												</div>
											</form>
										</div>
									</c:if>
								</c:when>
								<c:otherwise> <!-- 답글이 있으면 -->
									<div class="panel-body" id="ptServiceReply" >
										<textarea style="color: #556b8d; background-color: #fff;" readonly="readonly" id="ptServiceReplyText" name="ptServiceReply" class="form-control">${review.ptServiceReply }</textarea>
									</div>
								</c:otherwise>
							</c:choose>
							
						</div>
				</c:forEach>
					</div>
						
				<!-- 후기 끝 -->
				</div>
				
			</div>
		</div>
	</div>

<!-- 1회 PT 신청 모달창 -->
<div class="modal fade" id="pt-application" role="dialog">
	<div class="modal-dialog" id="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="logo-location">
					<a href="<c:url value="/"/>" class="modal-header-logo"><i
						class="icon-layers"></i>오늘의 짐</a>
				</div>
			</div>
			<form id="onemodalForm" role="form" action='<c:url value="/ptonce/request/${trainer.trainerNo}"/>' method="post"
				style="text-align: -webkit-center;">
				<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h2 class="h2BoldWhite">1회 PT 신청</h2>
							</div>
							<div class="panel-body">
								<div class="form-group">
										<h3 class="ptOnceMemberInfoTitle">회원 정보</h3>
									<hr>
									<table>
										<tr>
											<td style="width: 150px"><strong>성별</strong></td>
											<td style="width: 280px"><input name="ptOnceGender" type="radio"
												class="iradio_flat-grey checked" value="1" checked="checked"> <label>남자</label>&nbsp;&nbsp;
												<input name="ptOnceGender" type="radio"
												class="iradio_flat-grey checked" value="2"> <label>여자</label>
											</td>
										</tr>
										<tr>
											<td><strong>연령대</strong></td>
											<td><select class="btn btn-primary dropdown-toggle" name="ptOnceAge">
													<option value="1">&nbsp;10대&nbsp;</option>
													<option value="2" selected="selected">&nbsp;20대&nbsp;</option>
													<option value="3">&nbsp;30대&nbsp;</option>
													<option value="4">&nbsp;40대&nbsp;</option>
													<option value="5">&nbsp;50대&nbsp;</option>
													<option value="6">&nbsp;60대&nbsp;</option>
											</select></td>
										</tr>
										<tr>
											<td><strong>운동 목적</strong></td>
											<td><select class="btn btn-primary dropdown-toggle" name="ptOncePurpose">
													<option value="1">다이어트</option>
													<option value="2" selected="selected">체력증진</option>
													<option value="3">취미활동</option>
													<option value="4">기타</option>
											</select></td>
										</tr>
										<tr>
											<td><strong>운동 경험 여부</strong></td>
											<td><select class="btn btn-primary dropdown-toggle" name="ptOnceExperience">
													<option value="1">1달 미만</option>
													<option value="2" selected="selected">3개월</option>
													<option value="3">6개월</option>
													<option value="4">1년 이상</option>
											</select></td>
										</tr>
	
										<tr>
											<td><strong>특이사항</strong></td>
										</tr>
									</table>
									<textarea id="nestable-output" name="ptOnceSignificant" class="form-control ptOnceSignificantForm" placeholder="1회 PT를 신청하면서 트레이너님께 궁금한 점이나 특이사항이 있으시다면 이곳에 적어주세요."></textarea>
									<h3 style="text-align: left;"><strong>결제 정보</strong></h3>
									<hr>
									<table>
										<tr>
											<td style="width: 150px"><strong>결제금액</strong></td>
											<td style="width: 280px"><span id="payOnce"></span></td>
										</tr>
										<tr>
											<td><strong>결제 비밀번호</strong></td>
											<td>
												<input type="password" name="accountPw" id="accountPw" class="form-control" placeholder="결제 비밀번호를 입력해 주세요.">
												<p id="passwordMsg" class="error">비밀번호를 입력해 주세요.</p>
											</td>
										</tr>
									</table>
									<p id="accountValidMsg" style="color: red; font-weight: bold;">${message}</p>
									<p id="amountPayValidMsg" style="color: red; font-weight: bold;">${cashMessage}</p>
									<input id = "payoPrice" type="hidden" name ="payoPrice" value=""/>
							</div>
						</div>
					<div class="modal-footer">
						<div>
							<button type="submit" class="btn btn-primary btn-block">결제</button>
							<button type="button" data-dismiss="modal" class="btn btn-default btn-block">닫기</button>
						</div>
					</div>
				</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- PT 문의 모달창 -->
<div class="modal fade" id="pt-ask" role="dialog">
	<div class="modal-dialog" id="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="logo-location">
					<a href="<c:url value="/"/>" class="modal-header-logo"><i class="icon-layers"></i>오늘의 짐</a>
				</div>
			</div>
			<form id="ptmodalForm" action="<c:url value='/pt/request/${trainer.trainerNo}'/>" method="post" style="text-align: -webkit-center;">
				<div class="modal-body">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h2 class="h2BoldWhite">PT 문의</h2>
						</div>
						<div class="panel-body">
						<hr>
							<table>
								<tr style="margin-top: 30px;">
									<br>
									<td style="width: 150px;"><strong>이름</strong></td>
									<td style="width: 280px"><input type="text"
										readonly="readonly" class="form-control" id="memberName"
										name="memberName" value="${loginUserinfo.memberName }">
									</td>
								</tr>
								<tr>
									<td style="width: 150px"><strong>연락처</strong></td>
									<td style="width: 280px"><input
										type="text" readonly="readonly" class="form-control"
										id="memberPhone" name="memberPhone"
										value="${loginUserinfo.memberPhone }">
									</td>
								</tr>
								<tr>
									<td style="width: 150px"><strong>문의내용</strong></td>
								</tr>
							</table>
							<textarea id="nestable-output1" name="ptServiceContent" class="form-control ptServiceContentForm" placeholder="문의사항을 적어주세요."></textarea>
							<p id="nestable-outputMsg1" class="error">문의내용을 입력해 주세요.</p>
							<br>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div>
						<button type="submit" class="btn btn-primary btn-block">확인</button>
						<button type="button" data-dismiss="modal" class="btn btn-default btn-block">닫기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a41271e5cae48dd897d0c0b0de3a89b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${trainer.trainerAddress}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">센터 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    




//---------------------------------------------------------------
// 1회 PT 가격 1회 pt 결제 모달창에 띄우기
var oncePrice = $(".oncePrice").html();
$("#payOnce").text(oncePrice);
$('input[name=payoPrice]').attr('value',oncePrice);


	$("#onemodalForm").submit( function() {
		var submitResult = true;
	
		$(".error").css("display", "none");
		$("#nestable-output").val($("#nestable-output").val().trim());
		$("#accountPw").val($("#accountPw").val().trim());
		
	
		//아이디 유효성 검사
		//정규식 영문자로 시작하는 영문자 또는 숫자 6~20자 
		if ($("#accountPw").val() == "") {
			$("#passwordMsg").css("display", "block");
			submitResult = false;
		}
	
		return submitResult;
	});
	
	$("#ptmodalForm").submit( function() {
		var submitResult = true;
		
		$(".error").css("display", "none");
		$("#nestable-output1").val($("#nestable-output1").val().trim());
		
	
		//아이디 유효성 검사
		//정규식 영문자로 시작하는 영문자 또는 숫자 6~20자 
		if ($("#nestable-output1").val() == "") {
			$("#nestable-outputMsg1").css("display", "block");
			submitResult = false;
		}
	
		return submitResult;
	});

</script>