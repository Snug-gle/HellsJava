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
                           로그인
                        </h3>
                        </div>
                        <div class="panel-body">
                            <form id="loginForm" action="<c:url value="/"/>" method="post" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="memberId" class="form-control" id="memberId" placeholder="아이디를 입력해주세요">
                                        <p id="idMsg" class="error">아이디를 입력해 주세요.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" name="memberPw" class="form-control" id="memberPw" placeholder="비밀번호를 입력하세요">
                                        <p id="passwdMsg" class="error">비밀번호를 입력해 주세요.</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                    	<p>${message}</p>
                                        <button type="submit" class="btn btn-primary btn-block" >로그인</button>
                                        <hr>
                                        <a href="<c:url value="/user/login/id_search"/>" class="btn btn-default btn-block">아이디/비밀번호 찾기</a>
                                        <a href="<c:url value="/user/join_form"/>" class="btn btn-default btn-block">회원가입</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<script type="text/javascript">
	
	$("#loginForm").submit(function() {
		var submitResult=true;
		
		$(".error").css("display","none");
		$("#memberId").val($("#memberId").val().replace(/\s/g, ""));
		$("#memberPw").val($("#memberId").val().replace(/\s/g, ""));
		
		//아이디 공백 검사
		if($("#memberId").val()=="") {
			$("#idMsg").css("display","block");
			submitResult=false;
		}
		
		//비밀번호 공백 검사
		if($("#memberPw").val()=="") {
			$("#passwdMsg").css("display","block");
			submitResult=false;
		//비밀번호 형식 검사
		}
		
		return submitResult;
	});
	
	
	</script>
    </section>