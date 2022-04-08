<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 제목, 트레이너 이름(리드온니), 별점 , 내용 , 확인, 목록 -->
<div class="container animated fadeInUp">
	<div class="panel panel-default">
		<div id="login-wrapper">
			<div class="panel panel-primary">
				<div class="panel-body">
					<h1>
						<strong>리뷰 작성 및 수정</strong>
					</h1>
       				<hr>
       				<br>
					<div class="noticeBody">
						<c:if test="${review.ptServiceNo != null }">
							<form id="registerForm" method="post" name="reviewForm" action="<c:url value='/review/modify'/>"
							class="form-horizontal" role="form">
						</c:if>
						<c:if test="${review.ptServiceNo == null }">
							<form id="registerForm" method="post" name="reviewForm" action="<c:url value='/review/write'/>"
							class="form-horizontal" role="form">
						</c:if>
							<c:if test="${review.ptServiceNo != null }">
								<input type="hidden" name="ptServiceNo" value="${review.ptServiceNo }">
							</c:if>
							<div class="form-group">
								<label class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="reviewTitle" name="ptServiceTitle" value="${review.ptServiceTitle }" placeholder="제목을 입력해주세요" />
									<p id="titleMsg" class="error">제목을 입력해 주세요.</p>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">트레이너</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="" value="${trainer.memberName}" readonly="readonly" />
								</div>
							</div>
							
							<!-- 한개단위 별
							<div class="form-group">
								<label class="col-sm-2 control-label">별점</label>
								<div class="col-sm-3">
									<i class="fa fa-star starhold"  onmouseover="starChange(this)" onmouseout="grayStarChange(this)" onclick="StarHold(this)"></i>
									<i class="fa fa-star-o starfree"  onmouseover="starChange(this)" onmouseout="grayStarChange(this)" onclick="StarHold(this)"></i>
									<i class="fa fa-star-o starfree"  onmouseover="starChange(this)" onmouseout="grayStarChange(this)" onclick="StarHold(this)"></i>
									<i class="fa fa-star-o starfree"  onmouseover="starChange(this)" onmouseout="grayStarChange(this)" onclick="StarHold(this)"></i>
									<i class="fa fa-star-o starfree"  onmouseover="starChange(this)" onmouseout="grayStarChange(this)" onclick="StarHold(this)"></i>
								</div>
							</div> -->
							
							<div class="form-group">
								<label class="col-sm-2 control-label">별점</label>
								<div class="col-sm-3">
									<span class="star">
										 ★★★★★
										 <span>★★★★★</span>
										 <c:if test="${empty(review) }">
										 	<input class="fuck" type="range" oninput="drawStar(this)" value="0.5" step="0.5" min="0.5" max="5" name="ptServiceStars">
										 </c:if>
										 <c:if test="${review.ptServiceStars != null }">
										 	<input id="pa" type="range" oninput="drawStar(this)" value="${review.ptServiceStars}" step="0.5" min="0.5" max="5" name="ptServiceStars">
										 </c:if>
										 
									</span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<textarea class="noticeFormContent" style="height: 300px;" id="reviewContent" name="ptServiceContent" placeholder="내용을 입력해주세요" >${review.ptServiceContent}</textarea>
									<p id="contentMsg" class="error">내용을 입력해 주세요.</p>
									
								</div>
							</div>
							<div class="form-group btnGroup">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" class="btn btn-defualt" onclick="window.history.back()">목록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	$(function() { //리뷰수정=> 페이지 로딩 즉시 star값에 맞게 별이 채워져야해서 만듬
		var val = ($("#pa").val() * 10 * 2);
		val += "%";
		$(".star span").css("width", val);
	});
	
	//별 반개 단위 조작
	function drawStar(ths) {
		var val = ($(ths).val() * 10 * 2);
			val += "%";
		$(".star span").css( "width", val );
	};
	
	
	$("#registerForm").submit( function() {
		var submitResult = true;
		
		$(".error").css("display", "none");
		$("#reviewTitle").val($("#reviewTitle").val().trim());
		$("#reviewContent").val($("#reviewContent").val().trim());
		
		
		if ($("#reviewTitle").val() == "") {
			$("#titleMsg").css("display", "block");
			submitResult = false;
		}
		
		if ($("#reviewContent").val() == "") {
			$("#contentMsg").css("display", "block");
			submitResult = false;
		}
		
		return submitResult;
	});
	
	//별 1개 단위
	/* function starChange(ths) {
		$(ths).attr('class','fa fa-star af');
		$(ths).prevAll(".fa.fa-star-o.starfree").attr('class','fa fa-star af');
	};
	
	function grayStarChange() {
		$(".fa.fa-star.af").attr('class','fa fa-star-o starfree');
	};
	
	function StarHold(ths) {
		$(ths).attr('onmouseout', '');
		$(ths).attr('class','fa fa-star starhold');
		
		$(ths).prevAll().attr('onmouseout', '');
		$(ths).prevAll().attr('onmouseover','');
		$(ths).prevAll().attr('class','fa fa-star starhold');

		$(ths).nextAll().attr('class','fa fa-star-o starfree');
		$(ths).nextAll().attr('onmouseover','starChange(this)');
		$(ths).nextAll().attr('onmouseout','grayStarChange()');
	}; */

</script>