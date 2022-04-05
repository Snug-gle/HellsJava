<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">내 정보 수정</h3>
        </div>
        <div class="panel-body">
            <form method="post" action="<c:url value="/member/modify"/>" name="noticeForm" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-3">
                        <input type="text" readonly="readonly" class="form-control" name="memberId" value="${loginUserinfo.memberId}"/>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/user/login/password_search"/>';">비밀번호수정</button>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-3">
                        <input type="text" readonly="readonly" class="form-control"  name="memberName" value="${loginUserinfo.memberName}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">연락처</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="memberPhone" value="${loginUserinfo.memberPhone}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-3">
                    	<c:set var = "email" value="${fn:split(loginUserinfo.memberEmail,'@')}"/>
                        <input type="text" class="form-control" name="email1" value="${email[0]}" placeholder="이메일을 입력해주세요."/>
                        <p>@</p>
                        <div>
                		<select id="selbox" name="email2" class="form-control" >
                		
                			<option selected="selected" value="1">==선택==</option>
                			<option <c:if test="${email[1] eq 'google.com'}">selected="selected"</c:if> value="google.com">google.com</option>
                			<option <c:if test="${email[1] eq 'naver.com'}">selected="selected"</c:if> value="naver.com">naver.com</option>
                			<option <c:if test="${email[1] eq 'daum.net'}">selected="selected"</c:if> value="daum.net">daum.net</option>
                			<option value="direct">==직접입력==</option>
                		</select>
                		<input type="text" id="selboxDirect" name="selboxDirect" class="form-control"/>
                		
                		</div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">수정</button>
                        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/mypage';">목록</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
    <script type="text/javascript">
    $(function(){
		$("#selboxDirect").hide();
		
		$("#selbox").change(function(){
			//직접입력을 누를 때 나타남

			if($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
			}  else {
	
				$("#selboxDirect").hide();
			}
		}) 
	});
    </script>
    <!--Page Level JS-->
    <script src="<c:url value ="/plugins/bootstrap-wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
    <script src="<c:url value ="/plugins/bootstrap-wysihtml5/js/bootstrap3-wysihtml5.js"/>"></script>
    <script src="<c:url value ="/plugins/ckeditor/ckeditor.js"/>"></script>
