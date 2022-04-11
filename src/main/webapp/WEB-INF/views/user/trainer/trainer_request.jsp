<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<div class="container animated fadeInUp">
	<div class="panel panel-default">
		<div id="login-wrapper">
			<div class="panel panel-primary">
				<div class="panel-body">
					<h1>
						<strong>트레이너 신청</strong>
					</h1>
					<hr>
					<br>
					<div class="trainerRequestBody">
						<form id="trainerReqestForm" enctype="multipart/form-data" action="<c:url value = "/trainer/request"/>" method="post">
							<input type="hidden" name="memberNo" value="${loginUserinfo.memberNo }">
							<div class="trainer-profile-img">
								<hr>
								<h3><strong>프로필 사진 등록</strong></h3>
								<hr>
								<img alt="" src="" class="trainer-Profile-img"> 
								<input id="trainer_profile_image" type="file" readonly="readonly" name="profileImage" placeholder="프로필 사진 첨부" required accept="image/*">
								<div id="trainerProfileImgRegMsg" class="error">프로필 사진을 반드시 첨부하세요.</div>
							</div>
							<br>
							<div class="form-group" style="overflow: auto;">
								<hr>
								<h3><strong>트레이너 정보</strong></h3>
								<hr>
									<div class="col-sm-12">
										<label for="nameLabel" class="col-sm-2 control-label">이름</label>
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
									<div class="col-sm-12" >
										<label class="col-sm-2 control-label" for="centerLabel">소속 센터 주소</label>
										<div class="col-sm-9">
											<input type="text" id="sample4_postcode" name="trainerZip" placeholder="우편번호" class="center-form-control"> 
											<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
											<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class=" center-form-control"> 
											<input type="text" id="sample4_jibunAddress" name="trainerAddress" placeholder="지번주소" class=" center-form-control"> 
											<span id="guide" style="color: #999; display: none"></span> 
											<input type="text" id="sample4_detailAddress" name="trainerCentername" placeholder="센터명" class=" center-form-control"> 
											<input type="text" id="sample4_extraAddress" placeholder="참고항목" class=" center-form-control">
											
											<p style="color: blue; font-weight: bold;">주소 변경 시 지번 주소로 등록해주세요.</p>
											<div id="addressRegMsg" class="error">소속 센터 주소를 반드시 입력하세요.</div>
											<div id="centernameRegMsg" class="error">소속 센터명을 반드시 입력하세요.</div>
											<div id="centernameValidRegMsg" class="error">등록된 센터명을 입력하세요. [스마일짐], [앵그리짐], [네모짐], [세모짐], [동글짐], [마이짐], [별짐], [달짐], [골드짐], [해피짐]</div>
										</div>
									</div>
							</div>
							<br>
							<div class="tr-in-header-award-title">
								<hr>
								<h3><strong>수상경력 및 이력</strong>&nbsp;&nbsp;<i class="fa fa-plus-square" id="award-plus-btn"></i></h3> 
								<hr>
								<div class="tr-in-header-award-list">
									<ul class="tr-in-header-award-unit" style="list-style: none;">
										<li class="tr-in-header-award-rego" >
											<img alt="" src="" class="award-load-img">
											<input type="file" id="award_image0" name="aImage" onchange='setImageFromFile(this)' required placeholder="사진 첨부" accept="image/*" style="display: inline-block;"><br>
											<input type="text" id="award_content0" name="aContent" placeholder="수상 경력 및 이력" class="trainer-profile-form-control" style="display: inline-block;">
										</li>
									</ul>
									<p id="awardContentRegMsg" class="error">수상 경력 설명을 반드시 입력하세요.</p>
									<p id="awardImageRegMsg" class="error">수상 경력 사진을 반드시 첨부하세요.</p>
								</div>
							</div>
							<br>
							<div class="tr-in-payment">
								<hr>
								<h3><strong>결제 정보</strong></h3>
								<hr>
								<div class="tr-in-payment-title">
									<div class="tr-in-payment-body">
										<div class="tr-in-payment-text">
											<div class="ad-t-v-header-award-footer-text">
												<h3><strong>결제는 30일 단위로 결제됩니다.</strong></h3>
											</div>
											<div class="ad-t-v-header-award-footer-text">
												<h3><strong>결제금액</strong> : 15000 원</h3>
											</div>
										<div style="padding: 50px;">
										<label class="col-sm-2 control-label">결제 비밀번호</label>
										<div class="col-sm-4">
											<input type="password" id="account_pw" name="accountPw"
												class="form-control" placeholder="">
											<p id="accountPwRegMsg" class="error">결제 비밀번호를 반드시 입력하세요.</p>
											<p id="accountErrorMsg">${message}</p>
											<p id="cashErrorMsg">${cashMessage}</p>
											<br>
										</div>
										</div>
									</div>
									</div>
								</div>
							</div>
						<br>
						<br>
						<div class="tr-in-footer btnGroup">
							<button id="submitBtn" type="submit" class="btn btn-primary">확인</button>
							<button type="reset" class="btn btn-primary">다시쓰기</button>
							<br>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	$("#trainerReqestForm").submit(function(){
		var submitResult = true;
		
		$(".error").css("display","none");
		
		//센터명 트림
		$("#sample4_detailAddress").val($("#sample4_detailAddress").val().trim());
		
		// 결제 비밀번호 유효성 검사
		if($("#account_pw").val() == ""){
			$("#accountPwRegMsg").css("display","block");
			submitResult = false;
		}
		
		//수상 경력 및 이력 유효성 검사
		for(var i=0; i<=onp; i++){
			if($("#award_image"+i).val()==""){
				submitResult=false;
				$("#awardImageRegMsg").css("display","block");
				$("#award_image"+i).focus();
			}
			
			$("#award_content"+i).val($("#award_content"+i).val().trim());
			if($("#award_content"+i).val()==""){
				submitResult=false;
				$("#awardContentRegMsg").css("display","block");
				$("#award_content"+i).focus();
			}
		}
		
		// 등록 센터명 배열
		var centerNameArr = ['스마일짐','앵그리짐','네모짐','세모짐','동글짐','마이짐','별짐','달짐','골드짐','해피짐'];
		
		//centerNameArr 배열에 센터명이 포함되어 있는지 확인
		if((centerNameArr.includes($("#sample4_detailAddress").val()))==false){
			$("#centernameValidRegMsg").css("display","block");
			submitResult=false;	
		}
		
		// 센터명 유효성 검사
		if($("#sample4_detailAddress").val()==""){
			$("#centernameRegMsg").css("display","block");
			submitResult=false;	
		}
		
		// 주소 유효성 검사
		if($("#sample4_jibunAddress").val() == ""){
			$("#addressRegMsg").css("display","block");
			submitResult = false;
		}
		
		//프로필 이미지 유효성 검사
		if($("#trainer_profile_image").val() == ""){
			$("#trainerProfileImgRegMsg").css("display","block");
			submitResult = false;
		}
		
		return submitResult;
	});                                
	
	var onp = 0*1;		
	var html2;
	//동적 태그 생성(수상경력 추가시)
	$(document).on("click", "#award-plus-btn", function() {
		onp += 1; //카운트로 식별자 구분
		onp = onp *1;
		html2 = "<li class='tr-in-header-award-rego'>";
		html2 += "<i class='fa fa-minus-square' id='award-remove-btn'></i>&nbsp;";
		html2 += "<img alt='' src='' class='award-load-img'>&nbsp;";
		html2 += "<input type='file' id='award_image"+onp+"' onchange='setImageFromFile(this)' required name='aImage' accept='image/*' style='display: inline-block;'><br>";
		html2 += "<input type='text' id='award_content"+onp+"' style='margin-left: 17px;' name='aContent' placeholder='수상 경력 및 이력' style='display: inline-block;' class='trainer-profile-form-control'>";
		html2 += "</li>";
		
	    $(".tr-in-header-award-unit").append(html2);
	    
	});
	
	//동적 태그 삭제(수상경력 삭제시)
	$(document).on("click", "#award-remove-btn", function() {
		onp -= 1;
	    $(this).parent().remove();
	});
	     
	//프로필 이미지 미리보기
	$(document).on("change", "#trainer_profile_image", function() {
	    setImageFromFile(this);
	
	});
	
	function setImageFromFile(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(input).prev().attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
</script>