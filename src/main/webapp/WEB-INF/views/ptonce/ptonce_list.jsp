<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<h1 align="center">1회 PT 신청 내역 목록(회원)</h1>


<c:choose>
	<c:when test="${empty(ptOnceList) }">
		<div align="center">
			<h3>검색된 정보가 없습니다.</h3>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="ptOnce" items="${ptOnceList}">
			<!-- 리스트 타이틀 -->
			<div class="panel-body">


				<div class="panel-group accordion" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title">
								<div>번호</div>
								<div>날짜</div>
								<div>트레이너</div>
								<div>글상태</div>
								<div>
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne" class="collapsed" aria-expanded="false">
										상세보기</a>
								</div>
								<div class="collapsed">
									<a>리뷰쓰기</a>
								</div>
							</div>
						</div>
						<!-- 상세내용 -->
						<div id="collapseOne" class="panel-collapse collapse"
							aria-expanded="false" style="height: 0px;">
							<div class="panel-body">Sed ut perspiciatis unde omnis iste
								natus error sit voluptatem accusantium doloremque laudantium,
								totam rem aperiam, eaque ipsa quae ab illo inventore veritatis
								et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim
								ipsam voluptatem quia voluptas sit aspernatur aut odit aut
								fugit, sed quia consequuntur magni dolores eos qui ratione
								voluptatem sequi nesciunt.</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>




<!--  <div class="panel-body">

	<div class="panel-group accordion" id="accordion">
		<div class="panel panel-default">

			<div class="panel-heading">

				<h4 class="panel-title">


					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" class="collapsed" aria-expanded="false">
						Collapsible Group Item #1 </a>

				</h4>

			</div>

			<div id="collapseOne" class="panel-collapse collapse"
				aria-expanded="false" style="height: 0px;">
				<div class="panel-body">Sed ut perspiciatis unde omnis iste
					natus error sit voluptatem accusantium doloremque laudantium, totam
					rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
					architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam
					voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
					quia consequuntur magni dolores eos qui ratione voluptatem sequi
					nesciunt.</div>
			</div>
		</div>
	</div>

</div> -->


</html>







