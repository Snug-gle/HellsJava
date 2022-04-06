<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="container animated fadeInUp">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div id="login-wrapper">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">회원가입</h3>
					</div>
					<div class="panel-body">
						<p>
							이미 회원이십니까? <a href="<c:url value="/user/login/login_form"/>"><strong>로그인
									하기</strong></a>
						</p>
						<form role="form" id="joinForm"
							action="<c:url value = "/user/join"/>" method="post">
							<div class="form-group">
								<label for="IdLabel">아이디</label> <input type="text"
									class="form-control" id="memberId" placeholder="아이디를 입력해 주세요"
									name="memberId">
								<button type="button" id="idCheck"
									class="btn btn-default btn-block">아이디 중복검사</button>
								<p id="idMsg" class="error">아이디를 입력해 주세요.</p>
								<p id="idRegMsg" class="error">아이디 형식에 알맞게 작성해 주세요.(영문자로 시작하는
									영문자 또는 숫자 6~20자)</p>
								<p id="idCheckMsg" class="error">아이디 중복검사를 반드시 실행해 주세요.</p>
								<div>${message}</div>
							</div>
							<div class="form-group">
								<label for="passwordLabel">비밀번호</label> <input type="password"
									class="form-control" id="memberPw" name="memberPw"
									placeholder="비밀번호를 입력해 주세요">
								<p id="passwdMsg" class="error">비밀번호를 입력해 주세요.</p>
								<p id="passwdMsg2" class="error">비밀번호는 8 ~ 16자 영문, 숫자 조합으로
									입력해주세요</p>
							</div>
							<div class="form-group">
								<label for="passwordLabel2">비밀번호 확인</label> <input
									type="password" class="form-control" id="passwd2" name="passwd2"
									placeholder="비밀번호를 다시 입력해 주세요">
								<p id="passwd2Msg" class="error">비밀번호 확인을 입력해 주세요.</p>
								<p id="pwMatchMsg" class="error">비밀번호와 비밀번호확인이 일치하지 않습니다.</p>
							</div>
							<div class="form-group">
								<label for="nameLabel">이름</label> <input type="text"
									class="form-control" id="memberName" name="memberName"
									placeholder="이름을 입력해 주세요">
								<p id="nameMsg" class="error">이름을 입력해 주세요.</p>
							</div>
							<div class="form-group">
								<label for="phoneLabel">연락처</label>
								<div class="formDiv">
									<select id="member_phone1" name="member_phone1"
										class="btn btn-primary dropdown-toggle">
										<option value="010" selected="selected">&nbsp;010&nbsp;</option>
										<option value="011">&nbsp;011&nbsp;</option>
										<option value="016">&nbsp;016&nbsp;</option>
										<option value="017">&nbsp;017&nbsp;</option>
										<option value="018">&nbsp;018&nbsp;</option>
										<option value="019">&nbsp;019&nbsp;</option>
									</select> <input type="text" name="member_phone2"
										class="phone-form-control" id="member_phone2" maxlength="4">
									<input type="text" name="member_phone3"
										class="phone-form-control" id="member_phone3" maxlength="4">
									<p id="phoneMsg" class="error">연락처를 입력해 주세요.</p>
									<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해
										주세요.</div>
								</div>
							</div>
	
							<div class="form-group">
								<label for="emailLabel">Email</label> <input type="text"
									class="form-control" id="memberEmail" name="email1"
									placeholder="이메일을 입력해 주세요">
								<p>@</p>
								<select id="selbox" name="email2" class="form-control">
									<option selected="selected" value="1">==선택==</option>
									<option value="google.com">google.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="direct">==직접입력==</option>
								</select> <input type="text" id="selboxDirect" name="selboxDirect"
									class="form-control" />
								<p id="emailMsg" class="error">이메일을 입력해 주세요.</p>
								<p id="emailMsg2" class="error">이메일주소를 입력해 주세요.</p>
								<p id="emailRegMsg" class="error">이메일 아이디 형식에 알맞게 작성해 주세요.</p>
								<p id="emailRegMsg2" class="error">이메일 주소 형식에 알맞게 작성해 주세요.</p>
	
							</div>
							<button type="submit" class="btn btn-primary btn-block">회원가입</button>
						</form>
						<p style="color: red;"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(function() {
		$("#selboxDirect").hide();

		$("#selbox").change(function() {
			//직접입력을 누를 때 나타남

			if ($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
			} else {

				$("#selboxDirect").hide();
			}
		})
	});

	$("#joinForm").submit( function() {
		var submitResult = true;

		$(".error").css("display", "none");
		$("#memberId").val($("#memberId").val().replace(/\s/g, ""));
		$("#memberPw").val($("#memberPw").val().replace(/\s/g, ""));
		$("#memberName").val($("#memberName").val().replace(/\s/g, ""));
		$("#member_phone2").val($("#member_phone2").val().replace(/\s/g, ""));
		$("#member_phone3").val($("#member_phone3").val().replace(/\s/g, ""));
		$("#memberEmail").val($("#memberEmail").val().replace(/\s/g, ""));
		$("#selbox").val($("#selbox").val().replace(/\s/g, ""));

		//아이디 유효성 검사
		//정규식 영문자로 시작하는 영문자 또는 숫자 6~20자 
		var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		if ($("#memberId").val() == "") {
			$("#idMsg").css("display", "block");
			submitResult = false;
		} else if (!idReg.test($("#memberId").val())) {
			$("#idRegMsg").css("display", "block");
			submitResult = false;
		}

		//비밀번호 유효성 검사
		//8 ~ 16자 영문, 숫자 조합
		var pwReg = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
		//비밀번호 공백 검사
		if ($("#memberPw").val() == "") {
			$("#passwdMsg").css("display", "block");
			submitResult = false;
			//비밀번호 형식 검사
		} else if (!pwReg.test($("#memberPw").val())) {
			$("#passwdMsg2").css("display", "block");
			submitResult = false;
		}

		//비밀번호 확인 유효성 검사
		//비밀번호 확인 공백 검사
		if ($("#passwd2").val() == "") {
			$("#passwd2Msg").css("display", "block");
			submitResult = false;
			//비밀번호 일치 검사
		} else if ($("#memberPw").val() != $("#passwd2").val()) {
			$("#pwMatchMsg").css("display", "block");
			submitResult = false;
		}

		//이름 공백 검사
		if ($("#memberName").val() == "") {
			$("#nameMsg").css("display", "block");
			submitResult = false;
		}

		//연락처 공백 검사
		var phone2Reg = /\d{3,4}/;
		var phone3Reg = /\d{4}/;
		if ($("#member_phone2").val() == ""
				|| $("#member_phone3").val() == "") {
			$("#phoneMsg").css("display", "block");
			submitResult = false;
		} else if (!phone2Reg.test($("#member_phone2").val())
				|| !phone3Reg.test($("#member_phone3").val())) {
			$("#phoneRegMsg").css("display", "block");
			submitResult = false;
		}

		if ($("#member_phone2").val() == "") {
			$("phoneMsg").css("display", "block");
			submitResult = false;
		}
		if ($("#member_phone3").val() == "") {
			$("#phoneMsg").css("display", "block");
			submitResult = false;
		}
		//아이디 중복검사 체크여부
		if (idck == 0) {
			alert("아이디 중복확인을 해주세요");
			submitResult = false;
		}

		//이메일 정규식

		var emailIdReg = /^[a-z]+[a-z0-9]{5,19}$/g;
		var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if ($("#memberEmail").val() == "") {
			$("#emailMsg").css("display", "block");
			submitResult = false;
		} else if (!emailIdReg.test($("#memberEmail").val())) {
			$("#emailRegMsg").css("display", "block");
			submitResult = false;
		}

		if ($("#selbox").val() == "1") {
			$("#emailRegMsg2").css("display", "block");
			submitResult = false;
		}

		if ($("#selbox").val() == "direct") {
			if ($("#selboxDirect").val() == "") {
				$("#emailMsg2").css("display", "block");
				submitResult = false;
			} else if (!emailReg.test($("#selboxDirect").val())) {
				$("#emailRegMsg2").css("display", "block");
				submitResult = false;
			}
		}

		return submitResult;
	});

	//id 중복검사
	var idck = 0;
	$(function() {
		//idck 버튼을 클릭했을 때 
		$("#idCheck").click(function() {

			$("#memberId").val($("#memberId").val().replace(/\s/g, ""));

			if ($("#memberId").val() != "") {

				//userid 를 param.
				var userid = $("#memberId").val();

				$.ajax({
					async : true,
					type : 'get',
					data : userid,
					url : "user/idcheck?id=" + userid,
					contentType : "application/json; charset=UTF-8",
					success : function(cnt) {
						if (cnt > 0) {

							alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
							$("#memberId").focus();
							idck = 0;

						} else {
							alert("사용가능한 아이디입니다.");
							$("#memberPw").focus();
							//아이디가 중복하지 않으면  idck = 1 
							idck = 1;

						}
					},
					error : function(error) {

						alert("error : " + error);
					}
				});
			} else {
				$("#idMsg").css("display", "block");

			}
		});
	});
</script>