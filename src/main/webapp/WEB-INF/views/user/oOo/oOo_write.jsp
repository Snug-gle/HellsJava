<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container animated fadeInUp">
	<div class="panel panel-default">
		<div id="login-wrapper">
        	<div class="panel panel-primary">
      			<div class="panel-body">
					<h1>
						<strong>1:1문의 작성</strong>
					</h1>
       				<hr>
       				<br>
					<div class="noticeBody">
						<form id="registerForm" method="post" name="oOoForm" action="<c:url value='/oOo/write'/>" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="noticeServiceTitle" value="${noticeServiceTitle}" placeholder="제목을 입력해주세요" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">카테고리</label>
								<div class="col-sm-10">
									<select id="selbox" name="noticeServiceCategory" class="form-control">
										<option selected="selected">====선택====</option>
										<option value="0">결제관련</option>
										<option value="1">트레이너 관련</option>
										<option value="2">기타문의</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<textarea class="noticeFormContent" name="noticeServiceContent" placeholder="내용을 입력해주세요" style="height: 300px;"></textarea>
								</div>
							</div>
							<div class="form-group btnGroup">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" class="btn btn-default" onclick="window.history.back()">목록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

