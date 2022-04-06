<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
.tab-wrapper .tab-content {
    border: 0;
    border-top: 0;
    padding: 0;
}

.trainer-sidemenu {
	margin-left: 2%;
	margin-right: 2%;
}
#ask-label {
	width: 20%;
	float: left;
}

.form-control {
	width: 80%;
}

.ptOnce-form-group {
	border-bottom: 1px solid #444444;
    padding: 5px;
	margin-bottom: 0px;
}
}
</style>
<div class="posting-box">
	<div class="panel-body">
		<div class="tab-wrapper tab-primary">
			<ul class="nav nav-tabs">
				<li class="active"  style="width: 50%; text-align: center;"><a href="#trainer-posting" data-toggle="tab">트레이너</a></li>
				<li style="width: 50%; text-align: center;"><a href="#review-posting" data-toggle="tab">후기</a></li>
			</ul>
			
			<div class="tab-content">
				<div class="tab-pane active" id="trainer-posting">
					<div  style="text-align: center;">
					<ul class="nav nav-tabs" style="margin-bottom: 20px; display: inline-block; width: 100%;">
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
							<div class="panel-body profile-wrapper">
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
									</div>

								</div>
							</div>
							
							<!-- 트레이너 소개 -->
							<div class="col-md-12" id="posting-detail-frofile">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h3 class="panel-title">트레이너 소개</h3>
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
										<h3 class="panel-title">자격 사항</h3>
									</div>
									<div class="frofile-content-body posting-detail-content-panel">
										<c:forEach var="awarditem" items="${award}">
											<div class="frofile-award-content-body">
												<div class="frofile-award-content-body-img">
													<img alt="" src="<spring:url value="/awardImages/${awarditem.awardImage}"/>"> 
												</div>
												<div class="frofile-award-content-body-title">
													<h4>${awarditem.awardContent}</h4>
												</div>
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
										<h3 class="panel-title">PT 스케줄</h3>
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
										<h3 class="panel-title">프로그램 소개</h3>
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
										<h3 class="panel-title">PT 이용가격</h3>
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
										<h3 class="panel-title">센터 위치</h3>
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
				<div class="tab-pane" id="review-posting">
					<div class="search-review-panel panel-unit">
						<div class="search-review-panel-top">
							<h4>제목</h4>
							<div class="search-review-panel-score">
								<i class="fa fa-heart"></i> <label>566</label>
							</div>
							<hr>
						</div>
						<div class="search-review-panel-profile">
							<img alt="" src="">
							<table>
								<tr>
									<td>이름</td>
									<td>날짜</td>
									<td><i class="fa fa-star"></i> <i
										class="fa fa-star-half-o"></i> <i class="fa fa-star-o"></i></td>
								</tr>
								<tr>
									<td>1회 체험</td>
								</tr>
							</table>
							<br>
						</div>
						<div class="search-review-panel-text">
							<p>아수라 발발타 아아아아아아아아앙내가 미쳐간다으림나디ㅏ펌닝ㄹㅈ디맨ㅇ래맨ㅇ러ㅐ</p>
						</div>
						<div class="search-review-panel-re">
							<div class="search-review-panel-re-text">
								<textarea class="review-review review-textInsert1" rows=""
									cols=""></textarea>
							</div>
							<div class="search-review-panel-re-btn">
								<button type="button" class="review-btn1">댓글달기</button>
							</div>
						</div>

					</div>
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
			<div class="modal-body">
				<div id="login-wrapper">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">1회 PT 신청</h3>
						</div>
						<div class="panel-body">
							<form role="form" action='<c:url value="/ptonce/request/${trainer.trainerNo}"/>' method="post"
								style="text-align: -webkit-center;">
								<table>
									<tr>
										<td>회원정보</td>
									</tr>
									<tr>
										<td>성별</td>
										<td><input name="ptOnceGender" type="radio"
											class="iradio_flat-grey checked" value="1"> <label>남자</label>
											<input name="ptOnceGender" type="radio"
											class="iradio_flat-grey checked" value="2"> <label>여자</label>
										</td>
									</tr>
									<tr>
										<td>연령대</td>
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
										<td>운동 목적</td>
										<td><select class="btn btn-primary dropdown-toggle" name="ptOncePurpose">
												<option value="1">다이어트</option>
												<option value="2" selected="selected">체력증진</option>
												<option value="3">취미활동</option>
												<option value="4">기타</option>
										</select></td>
									</tr>
									<tr>
										<td>운동 경험 여부</td>
										<td><select class="btn btn-primary dropdown-toggle" name="ptOnceExperience">
												<option value="1">1달 미만</option>
												<option value="2" selected="selected">3개월</option>
												<option value="3">6개월</option>
												<option value="4">1년 이상</option>
										</select></td>
									</tr>

									<tr>
										<td>특이사항</td>
										<td>
											<div class="panel-body">
												<textarea id="nestable-output" name="ptOnceSignificant" class="form-control"
													style="resize: none;"></textarea>
											</div>
										</td>
									</tr>
								</table>
								<table>
									<tr>
										<td>결제정보</td>
									</tr>
									<tr>
										<td>결제금액</td>
										<td><span id="payOnce"></span></td>
									</tr>
									<tr>
										<td>결제 비밀번호</td>
										<td><input type="password" name="accountPw"></td>
									</tr>
								</table>
										<p id="accountValidMsg">${message}</p>
										<input id = "payoPrice" type="hidden" name ="payoPrice" value=""/>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div>
					<button type="submit" class="btn btn-primary">결제</button>
					<button type="button" data-dismiss="modal" class="btn btn-primary">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 1회 PT 문의 모달창 -->
<div class="modal fade" id="pt-ask" role="dialog">
	<div class="modal-dialog" id="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="logo-location">
					<a href="<c:url value="/"/>" class="modal-header-logo"><i class="icon-layers"></i>오늘의 짐</a>
				</div>
			</div>
			<div class="modal-body">
				<div id="login-wrapper">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">1회 PT 문의</h3>
						</div>
						<div class="panel-body">
							<form action="" method="post" style="text-align: -webkit-center;">
								<div class="ptOnce-form-group">
									<label for="name" id="ask-label">이름</label> 
									<input type="text" readonly="readonly" class="form-control" id="memberName"name="memberName" value="${loginUserinfo.memberName }">
								</div>
								<br>
								<div class="ptOnce-form-group">
									<label for="phone" id="ask-label">연락처</label> 
									<input type="text" readonly="readonly" class="form-control" id="memberName"name="memberName" value="${loginUserinfo.memberPhone }">
								</div>
								<br>
								<div class="ptOnce-form-group">
									<label for="ask" id="ask-label">문의내용</label> 
									<textarea id="nestable-output" class="form-control" style="resize: none;"></textarea>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
				<div class="modal-footer">
					<div>
						<button type="submit">확인</button>
						<button type="button" data-dismiss="modal">닫기</button>
					</div>
				</div>
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



</script>
