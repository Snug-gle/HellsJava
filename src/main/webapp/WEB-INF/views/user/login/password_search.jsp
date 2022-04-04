<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="container animated fadeInUp">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div id="login-wrapper">
                    <header>
                        <div class="brand">
                            <a href="<c:url value="/"/>" class="logo"><i class="icon-layers"></i><span>오늘의 짐</span></a>
                        </div>
                    </header>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">     
                           비밀번호 찾기
                        </h3>
                        </div>
                        <div class="panel-body">
                            <form action="<c:url value='/user/login/password_search'/>" method="post" class="form-horizontal" role="form" id="passwordSearchForm">
                           		<div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="memberId" class="form-control" id="memberId" placeholder="아이디를 입력해주세요">
                                        <div style="text-align: center;">
                                        	<p id="idMsg" class="error">아이디를 입력해 주세요.</p>
                                        	<p id="idRegMsg" class="error">아이디를 다시 확인해 주세요</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="memberName" class="form-control" id="memberName" placeholder="이름을 입력해주세요">
                                   		<p id="nameMsg" class="error" style="text-align: center;">이름을 입력해 주세요.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="formDiv">
	                                    <select id="member_phone1" name="member_phone1" class="btn btn-primary dropdown-toggle">											
											<option value="010" selected="selected">&nbsp;010&nbsp;</option>
											<option value="011">&nbsp;011&nbsp;</option>
											<option value="016">&nbsp;016&nbsp;</option>
											<option value="017">&nbsp;017&nbsp;</option>
											<option value="018">&nbsp;018&nbsp;</option>
											<option value="019">&nbsp;019&nbsp;</option>
										</select>
                                        <input type="text" name="member_phone2" class="phone-form-control" id="member_phone2" maxlength="4">
                                        <input type="text" name="member_phone3" class="phone-form-control" id="member_phone3" maxlength="4">
                                    	<p id="phoneMsg" class="error">연락처를 입력해 주세요.</p>
                                    	<p id="phoneRegMsg" class="error" style="text-align: center;">번호는 각 3~4자리를 입력해야합니다.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-block">비밀번호 찾기/수정</button>
                                        <hr>
                                        <a href="<c:url value="/user/join_form"/>" class="btn btn-default btn-block">회원가입</a>
                                    </div>
                                    <p style="color: red; text-align: center;">${message }</p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
<!-- 유효성검사 -->
<script type="text/javascript">
$("#passwordSearchForm").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");
	
	$("#memberId").val($("#memberId").val().replace(/\s/g, ""));
	$("#memberName").val($("#memberName").val().replace(/\s/g, ""));
	$("#member_phone2").val($("#member_phone2").val().replace(/\s/g, ""));
	$("#member_phone3").val($("#member_phone3").val().replace(/\s/g, ""));
	
	//아이디 유효성 검사
	//정규식 영문자로 시작하는 영문자 또는 숫자 6~20자 
	var idReg=/^[a-z]+[a-z0-9]{5,19}$/g;
	if($("#memberId").val()=="") {
		$("#idMsg").css("display","block");
		submitResult=false;
	} else if(!idReg.test($("#memberId").val())) {
		$("#idRegMsg").css("display","block");
		submitResult=false;
	}
	
	//이름 공백 검사
	if($("#memberName").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
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
	
</script>