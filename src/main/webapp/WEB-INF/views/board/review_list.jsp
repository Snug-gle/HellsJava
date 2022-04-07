<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="reviewcontent">
		
		<c:forEach var="reviewList" items="${reviewrList }" >
			<form class="reviemUpdateForm${reviewList.ptServiceNo}">
				<input type="hidden" id="ptServiceNo${reviewList.ptServiceNo}" name="ptServiceNo" value="${reviewList.ptServiceNo}">
				<input type="hidden" id="ptServiceStatus${reviewList.ptServiceNo}" name="ptServiceStatus" value="1">
			</form>
			<div class="reviewbody">
				<div class="reviewbody-top">
					<div><h3 class="tr-name${reviewList.ptServiceNo}">${reviewList.memberName }</h3></div>
					<div><h3>${reviewList.ptServiceTitle }</h3></div>
					<div>확인용 번호<h3>${reviewList.memberNo}</h3></div>
					<div>확인용 번호2<h3>${reviewList.trainerNo}</h3></div>
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
				<c:if test="${reviewList.ptServiceReply != null}">
					<div class="reviewbody-body-re">
						<p><span>${reviewList.memberName }</span> : ${reviewList.ptServiceReply}</p>
					</div>
				</c:if>
				<div class="reviewbody-bottom">
					<c:if test="${reviewList.ptServiceReply == null}">
						<button class="reviewMobtn">수정</button>
						<button class="reviewDebtn" >삭제</button>
					</c:if>
					<c:if test="${reviewList.ptServiceReply != null}">
						<p>댓글이 달린 리뷰는 수정 및 삭제를 할 수 없습니다</p>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>

	
<script type="text/javascript">

	//삭제
	$(".reviewDebtn").click(function() {
		var id = $(this).parent().parent().prev().children().val(); // #ptServiceNo
		$(".reviemUpdateForm"+id).attr("action","<c:url value='/review/list/reviewUpdate'/>");
		$("#ptServiceStatus"+id).val('0');
		$(".reviemUpdateForm"+id).submit();
	})
	
	//수정
	$(".reviewMobtn").click(function() {
		var id = $(this).parent().parent().prev().children().val();
		var name = $(".tr-name"+id).text();//트레이너 이름
		$(".reviemUpdateForm"+id).attr("action","<c:url value='/review/write'/>");
		$(".reviemUpdateForm"+id).submit();
	})
			
</script>
	