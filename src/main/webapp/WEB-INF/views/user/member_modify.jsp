<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="container animated fadeInUp">
	<div class="panel panel-default">
		<div id="login-wrapper">
			<div class="panel panel-primary">
				<div class="panel-body">
					<h1>
						<strong>내 정보 수정</strong>
					</h1>
					<hr>
					<br>
					<div class="memberModifyBody">
						<form id="modifyForm" method="post" action="<c:url value="/member/modify"/>" name="noticeForm" class="form-horizontal" role="form">
							<hr>
							<div class="form-group">
								<label for="idLabel" class="col-sm-1 control-label">아이디</label>
								<div class="col-sm-4">
								<input id="idLabel" type="text" readonly="readonly" class="form-control modifyFromIdInput " name="memberId" value="${loginUserinfo.memberId}" />
								</div>
								<div class="col-sm-2">
								<button id="idLabel" type="button" class="btn btn-primary" onclick="location.href='<c:url value="/user/login/password_search"/>';">비밀번호수정</button>
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="nameLabel" class="col-sm-1 control-label">이름</label>
								<div class="col-sm-4">	
									<input id="nameLabel" type="text" readonly="readonly" class="form-control" name="memberName" value="${loginUserinfo.memberName}" />
								</div>
							</div>
							<hr>
							<div class="form-group">
								<label class="col-sm-1 control-label" for="phoneLabel">연락처</label>
								<div class="col-sm-7">
									<c:set var ="phone" value="${fn:substring(loginUserinfo.memberPhone,0,3)}"/>
									<select id="member_phone1" name="member_phone1"
										class="btn btn-primary dropdown-toggle">
										<option value="010" <c:if test="${fn:substring(loginUserinfo.memberPhone,0,3) eq '010'}"> selected="selected"</c:if>>&nbsp;010&nbsp;</option>
										<option value="011" <c:if test="${fn:substring(loginUserinfo.memberPhone,0,3) eq '011'}"> selected="selected"</c:if>>&nbsp;011&nbsp;</option>
										<option value="016" <c:if test="${fn:substring(loginUserinfo.memberPhone,0,3) eq '016'}"> selected="selected"</c:if>>&nbsp;016&nbsp;</option>
										<option value="017" <c:if test="${fn:substring(loginUserinfo.memberPhone,0,3) eq '017'}"> selected="selected"</c:if>>&nbsp;017&nbsp;</option>
										<option value="018" <c:if test="${fn:substring(loginUserinfo.memberPhone,0,3) eq '018'}"> selected="selected"</c:if>>&nbsp;018&nbsp;</option>
										<option value="019" <c:if test="${fn:substring(loginUserinfo.memberPhone,0,3) eq '019'}"> selected="selected"</c:if>>&nbsp;019&nbsp;</option>
									</select> <input type="text" name="member_phone2"
										class="phone-form-control" id="member_phone2" maxlength="4" value="${fn:substring(loginUserinfo.memberPhone,4,8)}">
									<input type="text" name="member_phone3" class="phone-form-control"
										id="member_phone3" maxlength="4" value="${fn:substring(loginUserinfo.memberPhone,9,13)}">
								</div>
								<p id="phoneMsg" class="error">연락처를 입력해 주세요.</p>
								<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해
									주세요.</div>
							</div>
							<hr>
							<div class="form-group">
								<label for="emailLabel"class="col-sm-1 control-label">이메일</label>
								<div class="col-sm-10">
									<c:set var="email" value="${fn:split(loginUserinfo.memberEmail,'@')}" />
									<input id="emailLabel" type="text" class="email-form-control col-sm-4" name="email1" value="${email[0]}" placeholder="이메일을 입력해주세요.">
										&nbsp;@&nbsp;
									<select id="emailLabel" name="email2" class="email-form-control selbox" style="width: 160px;">
										<option selected="selected" value="1">==선택==</option>
										<option <c:if test="${email[1] eq 'google.com'}">selected="selected"</c:if> value="google.com">google.com</option>
										<option <c:if test="${email[1] eq 'naver.com'}">selected="selected"</c:if> value="naver.com">naver.com</option>
										<option <c:if test="${email[1] eq 'daum.net'}">selected="selected"</c:if> value="daum.net">daum.net</option>
										<option value="direct">==직접입력==</option>
									</select> 
									<input type="text" id="emailLabel" name="selboxDirect" class="selboxDirect form-control" />
								</div>
							</div>
							<hr>
							<br>
							<div class="form-group" style="text-align: center;">
								<button type="submit" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/mypage';">목록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

$("#modifyForm").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");
	$("#member_phone2").val($("#member_phone2").val().replace(/\s/g, ""));
	$("#member_phone3").val($("#member_phone3").val().replace(/\s/g, ""));
	
	//연락처 공백 검사
	var phone2Reg=/\d{3,4}/;
	var phone3Reg=/\d{4}/;
	if($("#member_phone2").val()=="" || $("#member_phone3").val()=="") {
		$("#phoneMsg").css("display","block");
		submitResult=false;
	} else if(!phone2Reg.test($("#member_phone2").val()) || !phone3Reg.test($("#member_phone3").val())) {
		$("#phoneRegMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#member_phone2").val()=="") {
		$("phoneMsg").css("display","block");
		submitResult=false;
	}
	if($("#member_phone3").val()=="") {
		$("#phoneMsg").css("display","block");
		submitResult=false;
	}
	
	return submitResult;
});
	
	//이메일 직접 입력 요청 처리 함수
	$(function() {
		$(".selboxDirect").hide();

		$(".selbox").change(function() {
			//직접입력을 누를 때 나타남

			if ($(".selbox").val() == "direct") {
				$(".selboxDirect").show();
			} else {

				$(".selboxDirect").hide();
			}
		})
	});
</script>
<!--Page Level JS-->
<script
	src="<c:url value ="/plugins/bootstrap-wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
<script
	src="<c:url value ="/plugins/bootstrap-wysihtml5/js/bootstrap3-wysihtml5.js"/>"></script>
<script src="<c:url value ="/plugins/ckeditor/ckeditor.js"/>"></script>
