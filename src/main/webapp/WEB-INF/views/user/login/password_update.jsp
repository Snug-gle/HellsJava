<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div>
		<div>
			<div>
				<a href="<c:url value="/"/>"><h1>오늘의 짐</h1></a>
			</div>
			<div>
				<div>
					<form id="passwordUpdateForm" action="<c:url value='/user/login/password_update'/>" method="post">
						<input type="hidden" name = "memberNo" value="${member.memberNo}">
						<table>
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" id="passwd" placeholder="새로 설정할 비밀번호를 입력해주세요">
									<p id="passwdMsg" class="error">비밀번호를 입력해 주세요.</p>
									<p id="passwdMsg2" class="error">비밀번호는 8 ~ 16자 영문, 숫자 조합으로 입력해주세요</p>
								</td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td>
									<input type="password" id="passwd2" placeholder="비밀번호를 다시 입력해주세요">
									<p id="passwd2Msg" class="error">비밀번호 확인을 입력해 주세요.</p>
									<p id="pwMatchMsg" class="error">비밀번호와 비밀번호확인이 일치하지 않습니다.</p>
								</td>
							</tr>
							<tr>
								<td><button type="submit">확인</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	$("#passwordUpdateForm").submit(function() {
		var submitResult=true;

		$(".error").css("display","none");
		
		//비밀번호 유효성 검사
		//8 ~ 16자 영문, 숫자 조합
		var pwReg=/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;;
		//비밀번호 공백 검사
		if($("#passwd").val()=="") {
			$("#passwdMsg").css("display","block");
			submitResult=false;
		//비밀번호 형식 검사
		} else if(!pwReg.test($("#passwd").val())) {
			$("#passwdMsg2").css("display","block");
			submitResult=false;
		} 
		
		//비밀번호 확인 유효성 검사
		//비밀번호 확인 공백 검사
		if($("#passwd2").val()=="") {
			$("#passwd2Msg").css("display","block");
			submitResult=false;
		//비밀번호 일치 검사
		} else if($("#passwd").val()!=$("#passwd2").val()) {
			$("#pwMatchMsg").css("display","block");
			submitResult=false;
		}
		
		return submitResult;
	});
	
	</script>