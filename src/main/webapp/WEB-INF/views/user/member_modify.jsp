<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title" style="font-size: 30px; padding-left: 40px;"><strong>내 정보 수정</strong></h3>
		</div>
		<div class="panel-body">
			<form id="modifyForm" method="post" action="<c:url value="/member/modify"/>"
				name="noticeForm" class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-3">
						<input type="text" readonly="readonly" class="form-control"
							name="memberId" value="${loginUserinfo.memberId}" />
					</div>
					<button type="button" class="btn btn-primary"
						onclick="location.href='<c:url value="/user/login/password_search"/>';">비밀번호수정</button>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">이름</label>
					<div class="col-sm-3">
						<input type="text" readonly="readonly" class="form-control"
							name="memberName" value="${loginUserinfo.memberName}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="phoneLabel">연락처</label>
					<div >
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
						<input type="text" name="member_phone3" class="phone-form-control"
							id="member_phone3" maxlength="4">
						<div style="padding-left: 200px; ">
						<p id="phoneMsg" class="error">연락처를 입력해 주세요.</p>
						<div id="phoneRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해
							주세요.</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-3">
						<c:set var="email"
							value="${fn:split(loginUserinfo.memberEmail,'@')}" />
						<input type="text" class="email-form-control" name="email1"
							value="${email[0]}" placeholder="이메일을 입력해주세요." />
						<p>@</p>
						<div>
							<select id="selbox" name="email2" class="email-form-control">

								<option selected="selected" value="1">==선택==</option>
								<option
									<c:if test="${email[1] eq 'google.com'}">selected="selected"</c:if>
									value="google.com">google.com</option>
								<option
									<c:if test="${email[1] eq 'naver.com'}">selected="selected"</c:if>
									value="naver.com">naver.com</option>
								<option
									<c:if test="${email[1] eq 'daum.net'}">selected="selected"</c:if>
									value="daum.net">daum.net</option>
								<option value="direct">==직접입력==</option>
							</select> <input type="text" id="selboxDirect" name="selboxDirect"
								class="form-control" />

						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/mypage';">목록</button>
					</div>
				</div>
			</form>

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
</script>
<!--Page Level JS-->
<script
	src="<c:url value ="/plugins/bootstrap-wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
<script
	src="<c:url value ="/plugins/bootstrap-wysihtml5/js/bootstrap3-wysihtml5.js"/>"></script>
<script src="<c:url value ="/plugins/ckeditor/ckeditor.js"/>"></script>
