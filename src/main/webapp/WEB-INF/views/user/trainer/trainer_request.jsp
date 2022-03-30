<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  


<form id="requestForm" action="<c:url value = "/trainer/request"/>" method = "post">
	<input type="hidden" name="memberNo" value="${loginUserinfo.memberNo }">
		<div class="tr-in-centent" >
			<div class="tr-in-header">
				<div class="tr-in-header-title">
					<h2>트레이너 신청</h2>
					<hr>
				</div>
				<div class="tr-in-header-img">
					<div class="">
						<img alt="" src="">
						<input id ="trainer_profile_image" type="file" readonly="readonly" name="trainer_profile_image" placeholder="프로필 사진 첨부">
						<button>첨부</button>
						<p id="trainerProfileImgRegMsg" class="error">프로필 사진을 필히 첨부하시오.</p>
					</div>
				
					<div class="tr-in-header-info">
						<table>
							<tr>
								<td>이름</td>
								<td>${loginUserinfo.member_name }</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>${loginUserinfo.member_phone }</td>
							</tr>
							<tr>
								<td>소속 센터 주소</td>
								<td>
									<input type="text" name="trainer_zip" id="sample6_postcode" placeholder="우편번호">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" name="trainer_address" id="sample6_address" placeholder="주소"><br>
									<input type="text" name="trainer_centername" id="sample6_detailAddress" placeholder="센터명">
									<div id="addressRegMsg" class = "error">소속 센터 주소를 필히 입력하세요.</div>
									<div id="centernameRegMsg" class="error">소속 센터명을 필히 입력하세요.</div>
									<div id="centernameValidRegMsg" class = "error">등록된 센터명을 입력하세요.</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
				<div class="tr-in-header-award-title">
					<h3>수상경력 및 이력</h3>
					<i class="fa fa-plus-square"></i>
					<hr>
					<div class="tr-in-header-award-list">
						<div class="tr-in-header-award-unit">
							<div class="tr-in-header-award-rego">
								<i class="fa fa-minus-square"></i>
								<input type="text" id="award_content" name= "award_content">
								<p id="awardContentRegMsg" class="error">수상 경력 설명을 필히 입력하세요.</p>
							</div>
							<div class="tr-in-header-award-rego">
								<input type="file" id = "award_image" name = "award_image"> 
								<p id="awardImageRegMsg" class="error">수상 경력 사진을 필히 첨부하세요.</p>
								<button>첨부</button>
							</div>
						</div>
					</div>	
				</div>
				
				<div class="tr-in-payment">
					<div class="tr-in-payment-title">
						<h3>결제</h3>
						<hr>
						<div class="tr-in-payment-body">
							<div class="tr-in-payment-text">
								<p>결제는 30일 단위로 결제됩니다.</p>
								<p>결제 금액 : 15000</p>
							</div>
							<div>
								<h3>결제 비밀번호</h3>
								<input type="password" id="account_pw" name="account_pw">
								<p id="accountPwRegMsg" class="error">결제 비밀번호를 필히 입력하시오.</p>
							</div>
						</div>
					</div>
				</div>
			<div class="tr-in-footer">
				<button id="submitBtn" type="submit">확인</button>
				<button type="reset">다시쓰기</button>
			</div>
		</div>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	if($("#submitBtn").submit(function(){
		
		var submitResult = true;
		
		$(".error").css("display","none");
		
		//프로필 이미지 유효성 검사
		if($("#trainer_profile_image").val() == ""){
			$("#trainerProfileImageRegMsg").css("display","block");
			submitResult = false;
		}
		
		// 주소 유효성 검사
		if($("#sample6_address").val() == ""){
			$("#addressRegMsg").css("display","block");
			$()
			submitResult = false;
		}
		
		// 등록 센터명 배열
		var centerNameArr = {"헬스장1", "헬스장2", "헬스장3", "헬스장4", "헬스장5", "헬스장6"
				,"헬스장7", "헬스장8", "헬스장9", "헬스장10""};
		
		if($("#sample6_detailAddress").val()==""){
			$("#centernameRegMsg").css("display","block");
			submitResult=false;	
			//centerNameArr 배열에 센터명이 포함되어 있는지 확인
		} else if($.inArray($("#sample6_detailAddress").val(), centerNameArr == -1){
			$("#centernameValidRegMsg").css("display","block");
			submitResult=false;	
		}
		
		// 수상 경력 세부 내용 유효성 검사
		if($("#award_content").val() == ""){
			$("#awardContentRegMsg").css("display","block");
			submitResult=false;	
		}
		
		// 수상 이미지 파일 첨부 여부 유효성 검사
		if($("#award_image").val() == ""){
			$("#awardImageRegMsg").css("display","block");
			submitResult = false;
		}
		
		// 결제 비밀번호 유효성 검사
		if($("#account_pw").val() == ""){
			$("#accountPwRegMsg").css("display","block");
			submitResult = false;
		}
		
		return submitResult;
	})                                

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
</script>
