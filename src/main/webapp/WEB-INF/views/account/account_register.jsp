<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">계좌 등록</h3>
		</div>
		<div class="panel-body">
			<form id="registerForm" method="post" name="accountForm"
				class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label">은행명</label>
					<div class="col-sm-3">


						<select id="selbox" name="accountBank" class="form-control">
							<option selected="selected" style="text-align: center;">====선택====</option>
							<option value="0">국민은행</option>
							<option value="1">신한은행</option>
							<option value="2">하나은행</option>
							<option value="3">농협은행</option>
							<option value="4">우체국은행</option>
							<option value="5">우리은행</option>
						</select>

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">계좌번호</label>
					<div class="col-sm-3">
						<input id="accountNum" type="text" class="form-control"
							name="accountNumber" value="${account.accountNumber}"
							placeholder="계좌번호를 입력해주세요" />
						<div id="idMsg" class="error">계좌 번호를 입력해 주세요.</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">결제비밀번호</label>
					<div class="col-sm-4">
						<input id="passwd" type="password" class="form-control"
							name="accountPw" value="${account.accountPw}"
							placeholder="6자리의 숫자를 입력해주세요" />
						<p id="passwdMsg" class="error">비밀번호를 입력해 주세요.</p>
						<p id="passwdMsg2" class="error">비밀번호는 6자리의 숫자를 입력해주세요</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">결제비밀번호확인</label>
					<div class="col-sm-3">
						<input id="passwd2" type="password" class="form-control"
							value="${account.accountPw }" placeholder="비밀번호 확인" />
						<p id="passwd2Msg" class="error">결제 비밀번호 확인을 입력해 주세요.</p>
						<p id="pwMatchMsg" class="error">입력한 비밀번호가 일치하지 않습니다.</p>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">확인</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>

<script type="text/javascript">
	$("#registerForm").submit(function() {
		var submitResult = true;

		$(".error").css("display", "none");

		//계좌번호 유효성 검사
		var idReg = /^([0-9,\-]{3,6}\-[0-9,\-]{2,6}\-[0-9,\-])$/g;
		if ($("#accountNum").val() == "") {
			$("#idMsg").css("display", "block");
			submitResult = false;
		} else if (!idReg.test($("#accountNum").val())) {
			$("#idRegMsg").css("display", "block");
			submitResult = false;
		}

		//비밀번호 유효성 검사
		//숫자 6자리
		var pwReg = /^[0-9]{6}$/g;
		//비밀번호 공백 검사
		if ($("#passwd").val() == "") {
			$("#passwdMsg").css("display", "block");
			submitResult = false;
			//비밀번호 형식 검사
		} else if (!pwReg.test($("#passwd").val())) {
			$("#passwdMsg2").css("display", "block");
			submitResult = false;
		}

		//비밀번호 확인 유효성 검사
		//비밀번호 확인 공백 검사
		if ($("#passwd2").val() == "") {
			$("#passwd2Msg").css("display", "block");
			submitResult = false;
			//비밀번호 일치 검사
		} else if ($("#passwd").val() != $("#passwd2").val()) {
			$("#pwMatchMsg").css("display", "block");
			submitResult = false;
		}

		return submitResult;
	});
</script>
</html>