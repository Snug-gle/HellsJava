<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  


<div class="pd-insert-centent" >
	<div class="pd-insert-header">
		<div class="pd-insert-header-title">
			<h2>트레이너 포스팅 작성</h2>
			<hr>
		</div>
		<div class="pd-insert-header-info">
			<table>
				<tr>
					<td>이름</td>
					<td>${trainer.memberName}</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${trainer.memberPhone}</td>
				</tr>
				<tr>
					<td>소속 센터 주소</td>
					<td>${trainer.trainerCentername }</td>
				</tr>
			</table>
			<br>
		</div>
		<div class="pd-insert-header-award-title">
			<h3>수상경력 및 이력</h3>
			<hr>
		</div>
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
			<hr>
		</div>
	</div>
	<form enctype="multipart/form-data" id="postingForm" action='<c:url value="/posting/write"/>'  method="post">
	<div class="pd-insert-body">
		
		<div class="pd-insert-body-myprofile">
			<div class="pd-insert-body-myprofile-top">
				<h3>자기 소개</h3>
				<textarea name="postingSelfIntroduction" class="profile-text" id="profile-text" rows="" cols=""></textarea>
			</div>
			<div class="pd-insert-body-myprofile-body">
				<h5>자기 소개 이미지 첨부 요망</h5>
				<input type="file" id="postingSelfIntroductionImg1" name="Img" accept="image/*">
				<input type="file" id="postingSelfIntroductionImg2" name="Img" accept="image/*">
				<input type="file" id="postingSelfIntroductionImg3" name="Img" accept="image/*">
				<input type="file" id="postingSelfIntroductionImg4" name="Img" accept="image/*">	
			</div>
		</div>
		<div class="pd-insert-body-profile">
			<br>
			<hr>
			<h3>프로그램 소개</h3>
			<textarea id="programProfile-text" rows="40" cols="100" id="postingProgramIntroduction" name="postingProgramIntroduction"></textarea>
		</div>
		<div class="pd-insert-body-pt-schedule">
			<br>
			<div class="pd-insert-body-pt-schedule-top">
				<h3>PT 스케줄</h3>
				<hr>
			</div>
			<div class="pd-insert-body-pt-schedule-body">
				<ul>
					<c:forEach var="j" begin="1" end="3">
						<li>
							<input name = "workdayCheck" type="checkbox" class="cb${j}" value="${j}">
							<c:if test="${j eq 1}">
								<label>평일</label>
								<input type="hidden" name="weekday" value="1">
							</c:if>
							<c:if test="${j eq 2}">
								<label>토요일</label>
								<input type="hidden" name="saturday" value="2">
							</c:if>
							<c:if test="${j eq 3}">
								<label>일요일</label>
								<input type="hidden" name="sunday" value="3">
							</c:if>
							
							<select id="pt-hour1" name = "hour1">
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
							
							<select id="minute1" name="minute1">
								<option value="00" selected="selected">00</option>
								<option value="30">30</option>
							</select>
							~
							<select id="pt-hour2" name="hour2">
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
							
							<select id="minute2" name="minute2">
								<option value="00" selected="selected">00</option>
								<option value="30">30</option>
							</select>
						</li>
					</c:forEach>
					<li>
						<input type="checkbox" class="cb4" value="4" name="dayoff">
						<label>휴무일</label>	
						<input id="cb4-text" type="text" name="dayOffText">
					</li>	
				</ul>
			</div>
		</div>

		<div class="pd-insert-body-pt-price">
			<br>
			<div class="pd-insert-body-pt-price-top">
				<h3>PT 이용가격</h3>
				<i class="fa fa-plus-square" id="price-plus-btn"></i>
				<hr>
			</div>
			<div class="pd-insert-body-pt-price-body">
				<ul class="pt-price-unit">
					<li>
						<input readonly="readonly" class="p-pt" id="p-pt0" name="round" type="number" min="1" value = "1" placeholder="1회">
						<input class="p-pr" id="p-pr0" name ="roundPrice" type="number" min="1000" placeholder="1회 PT 가격">
						<p>총 가격= <span id="totPrice"></span></p>
					</li>
				</ul>
			</div>
		</div>
	
	</div>
	<div class="pd-insert-footer">
		<button type="submit">확인</button>
		<button type="reset">다시쓰기</button>
	</div>
	</form>
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
		html2 += "<i class='fa fa-minus-square' id='price-remove-btn'></i>";
		html2 += "<input class='p-pt' id='p-pt"+onp+"' name='round' type='number' min='1' placeholder='PT 회차수'>";
		html2 += "<input class='p-pr' id='p-pr"+onp+"' name='roundPrice' type='number' min='1000' placeholder='회당 가격'>";
		html2 += "<p>총 가격=<span id='totPrice'></span></p>";
		html2 += "</li>";
		
	    $(".pt-price-unit").append(html2);
	});
	
	//동적 태그 삭제(회차 삭제시)
	$(document).on("click", "#price-remove-btn", function() {
		onp -= 1; //카운트 재 조정?
		
	    $(this).parent().remove();
	});


</script>