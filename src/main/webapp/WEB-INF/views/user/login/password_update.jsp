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
                           비밀번호 변경
                        </h3>
                        </div>
                        <div class="panel-body">
                            <form action="<c:url value='/user/login/password_update'/>" method="post" class="form-horizontal" role="form" id="passwordUpdateForm">                                
                                <input type="hidden" name = "memberNo" value="${member.memberNo}">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" class="form-control" id="passwd" placeholder="새로 설정할 비밀번호를 입력해 주세요">
                                        <p id="passwdMsg" class="error">비밀번호를 입력해 주세요.</p>
										<p id="passwdMsg2" class="error">비밀번호는 8 ~ 16자 영문, 숫자 조합으로 입력해주세요</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" class="form-control" id="passwd2"placeholder="비밀번호를 다시 입력해 주세요">
                                        <p id="passwd2Msg" class="error">비밀번호 확인을 입력해 주세요.</p>
										<p id="pwMatchMsg" class="error">비밀번호와 비밀번호확인이 일치하지 않습니다.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-block">확인</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
	
	<script type="text/javascript">
	
	$("#passwordUpdateForm").submit(function() {
		var submitResult=true;

		$(".error").css("display","none");
		
		$("#passwd").val($("#passwd").val().replace(/\s/g, ""));
		$("#passwd2").val($("#passwd2").val().replace(/\s/g, ""));
		
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
		} 

		//비밀번호 일치 검사
		if($("#passwd").val()!=$("#passwd2").val()) {
			$("#pwMatchMsg").css("display","block");
			submitResult=false;
		}
		
		return submitResult;
	});
	
	</script>