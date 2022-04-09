<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@	page import="org.springframework.util.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

  
<div class="container animated fadeInUp">
	<div class="panel panel-default">
		<div id="login-wrapper">
			<div class="panel panel-primary">
				<div class="panel-body">
					<h1>
						<strong>트레이너 포스팅 작성</strong>
					</h1>
					<hr>
					<br>
					<div class="noticeBody">
						<div class="pd-insert-header-info" style="overflow: auto;">
							<hr>
							<h3><strong>트레이너 정보</strong></h3>
							<hr>
							<div class="col-sm-12" style="vertical-align: middle;">
								<label for="nameLabel" class="col-sm-2 control-label" >이름</label>
								<div class="col-sm-7">
									<input id="nameLabel" type="text" readonly="readonly" class="trainer-profile-form-control" name="memberName" value="${loginUserinfo.memberName}" />
								</div>
							</div>
							<br>
							<div class="col-sm-12">
								<label class="col-sm-2 control-label" for="phoneLabel">연락처</label>
								<div class="col-sm-7">
									<input id="phoneLabel" type="text" readonly="readonly" class="trainer-profile-form-control" name="memberPhone" value="${loginUserinfo.memberPhone }" />
								</div>
							</div>
							<br>
							<div class="col-sm-12">
								<label class="col-sm-2 control-label" for="centerLabel">소속센터명</label>
								<div class="col-sm-7">
									<input id="centerLabel" type="text" readonly="readonly" class="trainer-profile-form-control" name="trainerCentername" value="${trainer.trainerCentername }" />
								</div>
							</div>
						</div>
						<br>
						<div class="pd-insert-header-award-title">
							<hr>
							<h3><strong>수상경력 및 이력</strong></h3>
							<hr>
							<div class="pd-insert-header-award-content">
								<div class="pd-insert-header-award-body">
									<table>
										<c:forEach var="taward" items="${trainerAwards}">
										<tr>
											<td><img alt="tawardImage" src="<spring:url value='/awardImages/${taward.awardImage}'/>"></td>
											<td>${taward.awardContent}</td>
										</tr>	
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<form enctype="multipart/form-data" id="postingForm" action='<c:url value="/posting/modify"/>'  method="post">
							<%-- 포스팅을 업데이트 명령을 내리기 위해 필요한 포스팅 넘버 --%>
							<input type="hidden" name="postingNo" value="${postingInfo.postingNo }">
							<%-- 기존 저장된 파일 이름을 넘겨서 삭제시키기 위함. --%>
							<input type="hidden" name="currentImage" value="${postingInfo.postingSelfIntroductionImg1 }">
							<input type="hidden" name="currentImage" value="${postingInfo.postingSelfIntroductionImg2 }">
							<input type="hidden" name="currentImage" value="${postingInfo.postingSelfIntroductionImg3 }">
							<input type="hidden" name="currentImage" value="${postingInfo.postingSelfIntroductionImg4 }">
												
							<br>
							<div class="pd-insert-body-myprofile">
								<hr>
								<h3><strong>자기소개</strong></h3>
								<hr>
								<textarea name="postingSelfIntroduction" class="noticeFormContent" id="profile-text" style="height: 500px;">${postingInfo.postingSelfIntroduction }</textarea>
								<p id="profileMsg" class="error"></p>
								<div class="pd-insert-body-myprofile-body">
									<h5><i class="fa fa-file-image-o">자기 소개 이미지 첨부 요망</i></h5>
									<input type="file" id="postingSelfIntroductionImg1" name="Img" accept="image/*" value="${postingInfo.postingSelfIntroductionImg1 }">
									<input type="file" id="postingSelfIntroductionImg2" name="Img" accept="image/*" value="${postingInfo.postingSelfIntroductionImg2 }">
									<input type="file" id="postingSelfIntroductionImg3" name="Img" accept="image/*" value="${postingInfo.postingSelfIntroductionImg3 }">
									<input type="file" id="postingSelfIntroductionImg4" name="Img" accept="image/*" value="${postingInfo.postingSelfIntroductionImg4 }">	
									 <br> 
									 <span style="color: red;">이미지를 변경하지 않을 경우 입력하지 마세요.</span> 
									<p id="profileImgMsg" class="error">최소 1개의 이미지를 첨부해주세요.</p>
								</div>
							</div>
							<br>
							<div class="pd-insert-body-profile">
								<hr>
									<h3><strong>프로그램 소개</strong></h3>
								<hr>
								<textarea id="programProfile-text" name="postingProgramIntroduction" class="noticeFormContent" style="height: 500px;">${postingInfo.postingProgramIntroduction }</textarea>
								<p id="programMsg" class="error">프로그램 소개를 입력해주세요.</p>
							</div>
							<br>
							<div class="pd-insert-body-pt-schedule">	
								<hr>
									<h3><strong>PT 스케줄</strong></h3>
								<hr>
								<div>
									<ul>
										<c:forEach var="j" begin="1" end="3">
											
										<input type="hidden" 
											<c:if test="${scheduleInfo[j-1].scheduleWorkday == j}"> value="${scheduleInfo[j-1].scheduleNo}"</c:if> 
											name="workDayScheduleNo">
										
											<li>
											
												<c:choose>
													 <c:when test="${scheduleInfo[j-1].scheduleWorkday == j }">
													 	<input name = "workdayCheck" type="checkbox" class="cb${j}" value="${j}" checked="checked">
													 </c:when>
													 <c:otherwise>
														 <input name = "workdayCheck" type="checkbox" class="cb${j}" value="${j}">
													 </c:otherwise>
												</c:choose>
												
												<c:if test="${j eq 1}">
													<label style="width: 60px;">평일</label>
													<input type="hidden" name="weekday" value="1">
												</c:if>
												<c:if test="${j eq 2}">
													<label style="width: 60px;">토요일</label>
													<input type="hidden" name="saturday" value="2">
												</c:if>
												<c:if test="${j eq 3}">
													<label style="width: 60px;">일요일</label>
													<input type="hidden" name="sunday" value="3">
												</c:if>
												
												<%-- fn라이브러리를 이용하여 substring를 사용하기 위해 선언 --%>
												<c:set var="scheduleHours" value="${scheduleInfo[j-1].scheduleHours}"/> 

												<select id="pt-hour1" name = "hour1" class="time-form-control">
													<c:forEach var="a" begin="6" end="23">
													
														<%-- fmt라이브러리를 이용하여 01,02와 같이 표현하기 위해 넘버 포맷을 변경.   --%>
														<fmt:formatNumber var="i" value='${a }' pattern='00'/>
														
														<c:choose>
															<c:when test="${fn:substring(scheduleHours,0,2) == i}">
															  	<option value="${i}" selected="selected"><c:out value="${i}" /></option>
															</c:when>
															<c:otherwise>
															  	<option value="<c:out value="${i}"/>"><c:out value="${i}" /></option>
															</c:otherwise>
														</c:choose>
														
													</c:forEach>
												</select>
												
												<select id="minute1" name="minute1" class="time-form-control">
													<c:choose>
														<c:when test="${fn:substring(scheduleHours,3,5) != 30}">
														  	<option value="00" selected="selected">00</option>
															<option value="30" >30</option>
														</c:when>
														<c:otherwise>
														  	<option value="00" >00</option>
															<option value="30" selected="selected">30</option>
														</c:otherwise>
													</c:choose>
												
													
												</select>
												~
												<select id="pt-hour2" name="hour2" class="time-form-control">
													<c:forEach var="a" begin="7" end="23">
													 <%-- fmt라이브러리를 이용하여 01,02와 같이 표현하기 위해 넘버 포맷을 변경.   --%>
														<fmt:formatNumber var="i" value='${a }' pattern='00'/>
														
														<c:choose>
															<c:when test="${fn:substring(scheduleHours,6,8) == i}">
															  	<option value="${i}" selected="selected"><c:out value="${i}" /></option>
															</c:when>
															<c:otherwise>
															  	<option value="<c:out value="${i}"/>"><c:out value="${i}" /></option>
															</c:otherwise>
														</c:choose>
														
													</c:forEach>
												</select>
												
												<select id="minute2" name="minute2" class="time-form-control">
													<c:choose>
														<c:when test="${fn:substring(scheduleHours,9,11) != 30}">
														  	<option value="00" selected="selected">00</option>
															<option value="30" >30</option>
														</c:when>
														<c:otherwise>
														  	<option value="00" >00</option>
															<option value="30" selected="selected">30</option>
														</c:otherwise>
													</c:choose>
												</select>
											</li>
										</c:forEach>
										
										<c:set var="an" value="5"/>
										<c:forEach var="dayoffList" items="${scheduleInfo}" varStatus="status" >
											<c:if test="${dayoffList.scheduleWorkday == 4}">
												<c:set var="an" value="${status.index}"/>
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${an < 4}">
												<li>
													<input type="checkbox" class="cb4" value="4" name="dayoff" checked="checked">
													<label style="width: 60px;">휴무일</label>
													<input id="cb4-text" type="text" name="dayOffText" class="posting-form-control" value="${scheduleInfo[an].scheduleDayoff}">
													<input type="hidden" name="dayOffScheduleNo" value="${scheduleInfo[an].scheduleNo}" />
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<input type="checkbox" class="cb4" value="4" name="dayoff">
													<label style="width: 60px;">휴무일</label>
													<input id="cb4-text" type="text" name="dayOffText" class="posting-form-control" value="">
												</li>
											</c:otherwise>
										</c:choose>

									</ul>
									<p id="scheduleMsg" class="error">최소 1개의 일정을 선택해주세요</p>
									<p id="scheduleHounMsg" class="error">시간을 다시 확인해주세요</p>		
									<p id="dayoffMsg" class="error">휴무일을 입력해주세요</p>	
								</div>
							</div>
							<br>
							<div class="pd-insert-body-pt-price">
								<hr>
									<h3><strong>PT 이용가격</strong>&nbsp;&nbsp;<i class="fa fa-plus-square" id="price-plus-btn"></i></h3>
								<hr>
								<div class="pd-insert-body-pt-price-body">
									<ul class="pt-price-unit">
										<c:choose>
											<c:when test="${empty(ptPricingInfo)}">
												<li>
													<input readonly="readonly" class="p-pt posting-form-control" id="p-pt0" name="round" type="number" min="1" value = "1" placeholder="1회">
													<input class="p-pr posting-form-control" id="p-pr0" name ="roundPrice" type="number" min="1000" placeholder="1회 PT 가격">
													<span>&nbsp;&nbsp;&nbsp;총 가격= <span id="totPrice"></span>원</span>
												</li>
											</c:when>
											<c:otherwise>
												<c:set var="i" value="0" />
												<c:forEach var="ptPricingInfo" items="${ptPricingInfo}" varStatus="status">
													<input type="hidden" name="ptPricingNumber" value="${ptPricingInfo.ptPricingNo}">
													
													<c:choose>
														<c:when test="${status.index == 0}">
															<li>
																<input readonly="readonly" class="p-pt posting-form-control" id="p-pt0" name="round" type="number" min="1" value = "1" placeholder="1회">
																<input class="p-pr posting-form-control" id="p-pr0" name ="roundPrice" type="number" min="1000" value="${ptPricingInfo.ptPricingPrice}" placeholder="1회 PT 가격">
																<span>&nbsp;&nbsp;&nbsp;총 가격= <span id="totPrice"></span>원</span>
															</li>
														</c:when>
														<c:otherwise>
															<li>
																<i class='fa fa-minus-square' id='price-remove-btn'></i>&nbsp;
																<input class='p-pt posting-form-control' id='p-pt${status.index}' name='round' type='number' min='1' value="${ptPricingInfo.ptPricingRound}" placeholder='PT 회차수'>
																<input class='p-pr posting-form-control' id='p-pr${status.index}' name='roundPrice' type='number' min='1000' value="${ptPricingInfo.ptPricingPrice}" placeholder='회당 가격'>
																<span>&nbsp;&nbsp;&nbsp;총 가격=<span id='totPrice'></span>원</span>
																<input type="hidden" value="${i =status.index}">
															</li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<input id="onp" type="hidden" value="${i}">
											</c:otherwise>
										</c:choose>
									</ul>
									<p id="priceRoundMsg" class="error">회차수를 입력해주세요</p>	
									<p id="priceMsg" class="error">가격을 입력해주세요</p>	
								</div>
							</div>
							<br>
							<div class="pd-insert-footer btnGroup">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="reset" class="btn btn-default">다시쓰기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	$("#postingForm").submit(function() {
		var submitResult=true;
		//에러 메시지 출력/미출력 초기화
		$(".error").css("display","none");

		//자기 소개 및 프로그램 소개 앞뒤 공백 자름
		$("#profile-text").val($("#profile-text").val().trim());
		$("#programProfile-text").val($("#programProfile-text").val().trim());
	
		//회차 및 가격 미 입력 확인
		for(var i=0; i<=onp; i++){
			if($("#p-pt"+i).val()==""){
				submitResult=false;
				$("#priceRoundMsg").css("display","block");
				$("#p-pt"+i).focus();
			}
			
			if($("#p-pr"+i).val()==""){
				submitResult=false;
				$("#priceMsg").css("display","block");
				$("#p-pr"+i).focus();
			}
		}
		
		//휴무일 체크시 휴무일 입력 여부 확인
		if($(".cb4").is(":checked")==true){ 
			if($("#cb4-text").val()==""){
				$("#dayoffMsg").css("display","block");
				$("#cb4-text").focus();
				submitResult=false;
			}
		}
		
		//스케쥴 시간
		var check = 0;
		for(var i = 1; i<=3; i++) {
			if($(".cb"+i).is(":checked")==true){
				check +=1; //체크시 카운트 +1
				var hour1 = $(".cb"+i).next().next().next().val();
				var hour2 = $(".cb"+i).next().next().next().next().next().val();
				if(hour1>=hour2){ //스케쥴 시간이 동일하거나 시작시간이 끝나는 시간보다 낮은 경우
					$("#scheduleHounMsg").css("display","block");
					$("#pt-hour1"+i).focus();
					submitResult=false;
				}
			}
		}
		
		//스케쥴 체크 유무 (최소 1개)
		if(check == 0){ //카운트가 0일경우
			$("#scheduleMsg").css("display","block");
			$("#schedulehour1").focus();
			submitResult=false;
		}
		
		//프로그램소개 유효성 검사
		if($("#programProfile-text").val()=="") {
			$("#programMsg").css("display","block");
			$("#programProfile-text").focus();
			submitResult=false;
		}
		
		//이미지 파일 첨부 유무 체크 (최소 1개)
/* 		var fileCheck = 0;
		if($("#postingSelfIntroductionImg1").val()!=""){ fileCheck += 1; } //사진 첨부시 카운트 +1
		if($("#postingSelfIntroductionImg2").val()!=""){ fileCheck += 1; }
		if($("#postingSelfIntroductionImg3").val()!=""){ fileCheck += 1; }
		if($("#postingSelfIntroductionImg4").val()!=""){ fileCheck += 1; }
		if(fileCheck == 0){ //카운트가 0일경우
			$("#profileImgMsg").css("display","block");
			$("#postingSelfIntroductionImg1").focus();
			submitResult=false;
		}
 */		
		
		//자기소개 유효성 검사
		if($("#profile-text").val()=="") {
			$("#profileMsg").css("display","block");
			$("#profile-text").focus();
			
			submitResult=false;
		} 

		return submitResult;
	}); 
	
	//회차 및 가격의 총 가격
	$(document).on('input', '.p-pt', function() {
		var total= $(this).val()*$(this).next().val();
	    $(this).next().next().children().text(total);
	});
	
	$(document).on('input', '.p-pr', function() {
		var total= $(this).val()*$(this).prev().val();
	    $(this).next().children().text(total);
	});
	
	
	if($("#onp").val()==null){
		var onp = 0;		
	} else {
		var onp = $("#onp").val();
	}
	
	var html2;
	//동적 태그 생성(회차 추가시)
	$(document).on("click", "#price-plus-btn", function() {
		onp += 1; //카운트로 식별자 구분
		
		html2 = "<li>";
		html2 += "<i class='fa fa-minus-square' id='price-remove-btn'></i>&nbsp;";
		html2 += "<input class='p-pt posting-form-control' id='p-pt"+onp+"' name='round' type='number' min='1' placeholder='PT 회차수'>";
		html2 += "<input class='p-pr posting-form-control' id='p-pr"+onp+"' name='roundPrice' type='number' min='1000' placeholder='회당 가격'>";
		html2 += "<span>&nbsp;&nbsp;&nbsp;총 가격=<span id='totPrice'></span>원</span>";
		html2 += "</li>";
		
	    $(".pt-price-unit").append(html2);
	});
	
	//동적 태그 삭제(회차 삭제시)
	$(document).on("click", "#price-remove-btn", function() {
		onp -= 1; //카운트 재 조정?
		
	    $(this).parent().remove();
	});


</script>