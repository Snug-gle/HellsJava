<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- 제목, 트레이너 이름(리드온니), 별점 , 내용 , 확인, 목록 -->
<html>
<head>
<!--  Bootstrap 4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Start Rating -->
<link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
</head>
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">리뷰 작성 및 수정</h3>
		</div>
		<div class="panel-body">
			<form id="registerForm" method="post" name="reviewForm" action="<c:url value='/'/>"
				class="form-horizontal" role="form">
				
				<div class="form-group">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"
							name="" value="${accountNumber}"
							placeholder="제목을 입력해주세요" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">트레이너</label>
					<div class="col-sm-3">
						<input type="text" class="form-control"
							name="" value="${accountNumber}"
							readonly="readonly" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">별점</label>
					<div class="col-sm-3">
							<select id="selbox" name="" class="form-control">
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
							name="" 
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
<!--  Bootstrap 4 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
<!-- // Star Rating -->
<script src="js/star-rating.js" type="text/javascript">

</html>