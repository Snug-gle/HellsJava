<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="reviewcontent">
		<c:forEach var="reviewList" items="${reviewrList }" >
			<div class="reviewbody">
				<div class="reviewbody-top">
					<div><h3>${reviewList.memberName }</h3></div>
					<div><h3>${reviewList.ptServiceTitle }</h3></div>
					<div>
						<strong>별점</strong>
						<span>${reviewList.ptServiceStars }</span>
						<span>${reviewList.ptServiceDate }</span>
					</div>
					<hr>
				</div>
				
				<div class="reviewbody-body">
					<p>${reviewList.ptServiceContent}</p>
				</div>
				
				<div class="reviewbody-bottom">
					<button class="reviewMobtn">수정</button>
					<button class="reviewMoOkbtn">확인</button>
					<button class="reviewDebtn">삭제</button>
				</div>
			</div>
		</c:forEach>
	</div>

	
<script type="text/javascript">

	$(function() {
		$(".reviewMoOkbtn").hide();
	});


	$(document).on("click",".reviewMobtn", function() { 
		$(this).parent().prev().children().contents().unwrap().wrap( '<textarea name="replyText" class="memberReviewList" rows="" cols=""></textarea>' );
		$(this).hide();
		$(this).next().show();
		$(this).next().next().hide();
	});
	
	$(document).on("click",".reviewMoOkbtn", function() { 
		$(this).parent().prev().children().contents().unwrap().wrap( '<p class="texttest"></p>' );
		$(this).hide();
		$(this).prev().show();
		$(this).next().show();
	});

</script>