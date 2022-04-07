<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<style type="text/css">
ul {
	list-style: none;
	padding-left: 0px;		
}
</style>
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
											<td> <img alt="tawardImage" src="<spring:url value="/awardImages/${taward.awardImage}"/>"></td>
											<td>${taward.awardContent}</td>
										</tr>	
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<form enctype="multipart/form-data" id="postingForm" action='<c:url value="/posting/write"/>'  method="post">
							<br>
							<div class="pd-insert-body-myprofile">
								<hr>
								<h3><strong>자기소개</strong></h3>
								<hr>
								<textarea name="postingSelfIntroduction" class="noticeFormContent" id="profile-text" style="height: 500px;"></textarea>
						
								<div class="pd-insert-body-myprofile-body">
									<h5><i class="fa fa-file-image-o"></i>자기 소개 이미지 첨부 요망</h5>
									<input type="file" id="postingSelfIntroductionImg1" name="Img" accept="image/*">
									<input type="file" id="postingSelfIntroductionImg2" name="Img" accept="image/*">
									<input type="file" id="postingSelfIntroductionImg3" name="Img" accept="image/*">
									<input type="file" id="postingSelfIntroductionImg4" name="Img" accept="image/*">	
								</div>
							</div>
							<br>
							<div class="pd-insert-body-profile">
								<hr>
									<h3><strong>프로그램 소개</strong></h3>
								<hr>
								<textarea id="programProfile-text" name="postingProgramIntroduction" class="noticeFormContent" style="height: 500px;"></textarea>
							</div>
							<br>
							<div class="pd-insert-body-pt-schedule">	
								<hr>
									<h3><strong>PT 스케줄</strong></h3>
								<hr>
								<div>
									<ul>
										<c:forEach var="j" begin="1" end="3">
											<li>
												<input name = "workdayCheck" type="checkbox" class="cb${j}" value="${j}">
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
												
												<select id="pt-hour1" name = "hour1" class="time-form-control">
													<option value="06" selected="selected">06</option>
													<c:forEach var="i" begin="7" end="23">
													   <c:if test="${i>0 && i<10}">
															<option value="0${i}"><c:out value="0${i}" /></option>
														</c:if>
														<c:if test="${i>=10}">
													  		<option value="<c:out value="${i}"/>"><c:out value="${i}" /></option>
														</c:if>
													</c:forEach>
												</select>
												
												<select id="minute1" name="minute1" class="time-form-control">
													<option value="00" selected="selected">00</option>
													<option value="30">30</option>
												</select>
												~
												<select id="pt-hour2" name="hour2" class="time-form-control">
													<option value="06" selected="selected">06</option>
													<c:forEach var="i" begin="7" end="23">
													  <c:if test="${i>0 && i<10}">
															<option value="0${i}"><c:out value="0${i}" /></option>
														</c:if>
														<c:if test="${i>=10}">
													  		<option value="<c:out value="${i}"/>"><c:out value="${i}" /></option>
														</c:if>
													</c:forEach>
												</select>
												
												<select id="minute2" name="minute2" class="time-form-control">
													<option value="00" selected="selected">00</option>
													<option value="30">30</option>
												</select>
											</li>
										</c:forEach>
										<li>
											<input type="checkbox" class="cb4" value="4" name="dayoff">
											<label style="width: 60px;">휴무일</label>	
											<input id="cb4-text" type="text" name="dayOffText" class="posting-form-control">
										</li>	
									</ul>
								</div>
							</div>
							<br>
							<div class="pd-insert-body-pt-price">
								<hr>
									<h3><strong>PT 이용가격</strong>&nbsp;&nbsp;<i class="fa fa-plus-square" id="price-plus-btn"></i></h3>
								<hr>
								<div class="pd-insert-body-pt-price-body">
									<ul class="pt-price-unit">
										<li>
											<input readonly="readonly" class="p-pt posting-form-control" id="p-pt0" name="round" type="number" min="1" value = "1" placeholder="1회">
											<input class="p-pr posting-form-control" id="p-pr0" name ="roundPrice" type="number" min="1000" placeholder="1회 PT 가격">
											<span>&nbsp;&nbsp;&nbsp;총 가격= <span id="totPrice"></span>원</span>
										</li>
									</ul>
								</div>
							</div>
						
						</form>
						</div>
						<br>
						<div class="pd-insert-footer btnGroup">
							<button type="submit" class="btn btn-primary">확인</button>
							<button type="reset" class="btn btn-default">다시쓰기</button>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	$("#postingForm").submit(function() {
		var submitResult=true;
		

		/* $(".error").css("display","none");
		$("#memberId").val($("#memberId").val().replace(/\s/g, "")); */
		
		
		$("#profile-text").val($("#profile-text").val().trim());
		$("#programProfile-text").val($("#programProfile-text").val().trim());
	
		//자기소개 유효성 검사
		if($("#profile-text").val()=="") {
			/* $("#idMsg").css("display","block"); */
			alert("자기소개 공백 ㄴㄴ");
			submitResult=false;
		} 
		
		//프로그램소개 유효성 검사
		if($("#programProfile-text").val()=="") {
		 
			alert("소개 공백 ㄴㄴ");
			submitResult=false;
		} 
		
		
		//이미지 파일 첨부 유무 체크 (최소 1개)
		var fileCheck = 0;
		if($("#postingSelfIntroductionImg1").val()!=""){ fileCheck += 1; } //사진 첨부시 카운트 +1
		if($("#postingSelfIntroductionImg2").val()!=""){ fileCheck += 1; }
		if($("#postingSelfIntroductionImg3").val()!=""){ fileCheck += 1; }
		if($("#postingSelfIntroductionImg4").val()!=""){ fileCheck += 1; }
		if(fileCheck == 0){ //카운트가 0일경우
			alert("이미지 한개라도 체크하셈");
			submitResult=false;
		}
		
		//스케쥴 
		var check = 0;
		for(var i = 1; i<=3; i++) {
			if($(".cb"+i).is(":checked")==true){
				check +=1; //체크시 카운트 +1
				var hour1 = $(".cb"+i).next().next().next().val();
				var hour2 = $(".cb"+i).next().next().next().next().next().val();
				if(hour1>=hour2){ //스케쥴 시간이 동일하거나 시작시간이 끝나는 시간보다 낮은 경우
					alert("시간을 다시 확인해 주세요");
					alert(hour1);
					alert(hour2);
					submitResult=false;
				}
			}
		}
		
		//스케쥴 체크 유무 (최소 1개)
		if(check == 0){ //카운트가 0일경우
			alert("한개라도 체크하셈");
			submitResult=false;
		}
		
		//휴무일 체크시 휴무일 입력 여부 확인
		if($(".cb4").is(":checked")==true){ 
			if($("#cb4-text").val()==""){
				alert("휴무일 체크했으면 입력좀요....");
				$(".cb4").focus();
				submitResult=false;
			}
		}
		
		//회차 및 가격 미 입력 확인
		for(var i=0; i<=onp; i++){
			if($("#p-pt"+i).val()==""){
				submitResult=false;
				alert("p-pt"+i+"= 공백임");
				$("#p-pt"+i).focus();
			}
			
			if($("#p-pr"+i).val()==""){
				submitResult=false;
				alert("p-pr"+i+"= 공백임");
				$("#p-pr"+i).focus();
			}
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

	var onp = 0;
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