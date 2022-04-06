<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">1:1 문의 작성</h3>
		</div>
		<div class="panel-body">
			<form id="registerForm" method="post" name="oOoForm" action="<c:url value='/oOo/write'/>"
				class="form-horizontal" role="form">
				
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"
							name="noticeServiceTitle" value="${noticeServiceTitle}"
							placeholder="제목을 입력해주세요" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">카테고리</label>
					<div class="col-sm-3">
							<select id="selbox" name="noticeServiceCategory" class="form-control">
							<option selected="selected" style="text-align: center;">====선택====</option>
							<option value="0">결제관련</option>
							<option value="1">트레이너 관련</option>
							<option value="2">기타문의</option>
						</select>

					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-4">
						<textarea class="form-control"
							name="noticeServiceContent" 
							placeholder="내용을 입력해주세요" ></textarea>
						
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">확인</button>
						<button type="button" class="btn btn-primary" onclick="window.history.back()">목록</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</div>


</html>