<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
	<div>
		<div>
			<div>
				<a href="<c:url value="/"/>"><h1>오늘의 짐</h1></a>
			</div>
			<div>
				<div>
					<form action="<c:url value="/user/login/id_print"/>" method="post" id="idSearchForm">
						<table>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" placeholder="이름을 입력해주세요" name="memberName">
								</td>
							</tr>
							<tr>
								<td>연락처</td>
								<td>
									<select id="member_phone1" name="member_phone1">											
										<option value="010" selected="selected">&nbsp;010&nbsp;</option>
										<option value="011">&nbsp;011&nbsp;</option>
										<option value="016">&nbsp;016&nbsp;</option>
										<option value="017">&nbsp;017&nbsp;</option>
										<option value="018">&nbsp;018&nbsp;</option>
										<option value="019">&nbsp;019&nbsp;</option>
									</select>
									<input id="member_phone2" name="member_phone2" size="7" maxlength="4" type="text">
									<input id="member_phone3" name="member_phone3" size="7" maxlength="4" type="text">
								</td>
							</tr> 
							<tr>
								<td><button type="button" onclick="location.href='<c:url value="/user/login/password_search"/>';">비밀번호 찾기/수정</button></td>
								<td><button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button></td>
							</tr>
							<tr>
								<td><button type="submit">아이디 찾기</button></td>
							</tr>
						</table>
								<div>${message }</div>
					</form>
				</div>
			</div>
		</div>
	</div>
-->
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
                           아이디찾기
                        </h3>
                        </div>
                        <div class="panel-body">
                            <form action="<c:url value="/user/login/id_print"/>" method="post" class="form-horizontal" role="form" id="idSearchForm">
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
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-block">아이디찾기</button>
                                        <hr>
                                        <a href="<c:url value="/user/login/password_search"/>" class="btn btn-default btn-block">비밀번호 찾기/수정</a>
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
$("#idSearchForm").submit(function() {
	var submitResult=true;
	
	$(".error").css("display","none");
	
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