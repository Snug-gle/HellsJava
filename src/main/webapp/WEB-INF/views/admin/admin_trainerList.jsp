<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<div class="container">
	<div class="userList">
		<section id="main-wrapper" class="theme-default">
		<!-- 사이드메뉴 -->
		<aside class="sidebar sidebar-left">
			<nav>
				<h1 class="sidebar-header">관리자 페이지</h1>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="<c:url value="/admin/userList"/>"
						title="userList"> <i class="icon-users"></i> 회원목록
					</a></li>
					<li class="nav-dropdown"><a href="#" title="trainerList"><span></span> 
						<i class="icon-users"></i>트레이너 목록</a>
							<ul class="nav-sub" data-index="0" style="display: none;">
								<li class="admin-side-bar-tlist1">
									<a href="<c:url value="/admin/trainerList/3"/>" title="Buttons">트레이너목록</a>
								</li>
								<li class="admin-side-bar-tlist2"><a href="<c:url value="/admin/trainerList/2"/>" title="Sliders &amp; Progress">트레이너 신청 목록</a></li>
							</ul>
					</li>
					<li class="nav-dropdown"><a
						href="<c:url value="/admin/questionList"/>" title="questionList"><span></span>
							<i class="fa  fa-fw fa-edit"></i> 1:1문의 목록 </a></li>
				</ul>
			</nav>
		</aside>
		<!-- 사이드메뉴 끝 -->
		
		
		<section class="main-content-wrapper">
			<div class="pageheader">
				<h1>트레이너 관리</h1>
			</div>
			<section id="main-content" class="animated fadeInUp">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="width: 60px;">번호</th>
										<th>아이디</th>
										<th style="width: 130px;">이름</th>
										<th style="width: 140px;">연락처</th>
										<th style="width: 100px;"><span class="admin-list-body-list-table-m">입금 상태</span></th>
										<th style="width: 110px;">상세보기</th>
									</tr>
								</thead>
								<tbody>
									<c:set var ="su" value="${number}"/>
									<c:forEach var="trainer" items="${trainerList }" varStatus="status">
                                        <c:set var ="number2" value="${su-status.index}"/>
										<tr>
											<td>${number2 }</td>
											<td>${trainer.memberId }</td>
											<td>${trainer.memberName}</td>
											<td>${trainer.memberPhone}</td>
											<td></td>
											<td>
												<button class="admin-list-body-list-t-btn1 btn btn-primary" type="button"
													data-toggle="modal" data-target="#trainer_view${status.index}" value="${trainer.trainerNo}">상세보기</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
					<%-- 페이지 번호 출력 --%>
					<div class="panel panel-default">
						<div class="panel-body" id="pageNumDiv"></div>
					</div>
					
						<form id="searchForm" method="post" action="">
							<div class="main-search-area">
								<select id="nameIdSearch" name="nameIdSearch" class="btn btn-primary dropdown-toggle searchBtnBox">
									<option value="member_name" selected="selected">&nbsp;이름&nbsp;</option>
									<option value="member_id">&nbsp;아이디&nbsp;</option>
								</select>
								<input class="main-search" name="searchValue" id="searchValue">
								<button type="button" id="searchBtn" class="btn btn-primary searchBtnBox">검색</button>
							</div>
						</form>
				</div>
			</section>
		</section>
		</section>
	</div>
</div>



<!-- 트레이너 상세보기 모달 -->
<c:forEach var="trainer" items="${trainerList }" varStatus="status">
	<div class="modal fade" id="trainer_view${status.index}" role="dialog" >
		<div class="modal-dialog" id="modal-dialog" style="text-align: left;">
			<div class="modal-content" style="margin-top: 10%;">
				<div class="modal-header">
					<div class="logo-location">
						<a href="<c:url value="/"/>" class="modal-header-logo"><i class="icon-layers"></i>오늘의 짐</a>
					</div>
				</div>
				<div class="modal-body">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">트레이너 상세</h3>
							</div>
							<div class="panel-body">
								
									<hr>
										<h3><strong>트레이너 정보</strong></h3>
									<hr>
									<div class="row">
										<div class="trainerDetailView">
											<img style="width: 97px; vertical-align: middle;" alt="" src="<spring:url value='/profileImages/${trainer.trainerProfileImg}'/>">
										</div>
										<div class="ad-t-v-header-info trainerDetailView">
										<input type="hidden" id="trainerMemberNo" name="trainerMemberNo" value="${trainer.memberNo}">
											<table>
												<tr>
													<td>이름</td>
													<td id="tr_name">${trainer.memberName}</td>
												</tr>
												<tr>
													<td>연락처</td>
													<td id="tr_phone">${trainer.memberPhone}</td>
												</tr>
												<tr>
													<td>소속 센터 주소</td>
													<td id="tr_address">${trainer.trainerAddress}</td>
												</tr>
											</table>
										</div>
									</div>
									<hr>
										<h3><strong>수상경력 및 이력</strong></h3>
									<hr>
									<div class="ad-t-v-header-award-body">
										<div class="row award">
											<%-- <div class="trainerDetailView">
												<img class="trainer-detail-profile" alt="" src="<spring:url value="/img/avatar2.png"/>">
											</div>
											<div class="ad-t-v-header-info trainerDetailView">
												<p>수상이력</p>
											</div> --%>

										</div>
									</div>
									<hr>
									<div class="ad-t-v-header-award-footer">
										<div class="ad-t-v-header-award-footer-text">
											<h3><strong>다음결제일</strong>??</h3></div>
										<div class="ad-t-v-header-award-footer-text">
											<h3><strong>결제금액</strong> : 15000 원</h3>
										</div>
		
										<div class="ad-t-v-header-award-footer-change">
											<select class="btn btn-primary dropdown-toggle" id="trainerStatusChange" name="trainerStatusChange">
												<option value="2" <c:if test="${trainer.memberStatus==2 }">selected="selected"</c:if>>트레이너 예정</option>
												<option value="3" <c:if test="${trainer.memberStatus==3 }">selected="selected"</c:if>>트레이너</option>
											</select>
										</div>
									</div> 
									
								</div>
								<div class="modal-footer">
									<div>
										<button type="button" data-dismiss="modal" class="btn btn-default btn-block">닫기</button>
									</div>
								</div>
							</div>
					</div>
				</div>
		</div>
	</div>
</c:forEach>


<script type="text/javascript">
		$(function(){
			$(".admin-side-bar-title1").show();
			$(".admin-side-bar-title2").hide();
			$(".admin-list-body-list-table-m").hide();
			$(".admin-list-body-list-t-btn1").show();
			$(".admin-list-body-list-t-btn2").hide();
		});
		
		$(".admin-side-bar-tlist1").click(function() {
			if($(".admin-side-bar-title1").css("display","none")){
				$(".admin-side-bar-title1").show();
				$(".admin-side-bar-title2").hide();
				$(".admin-list-body-list-table-m").hide();
				$(".ad-t-v-header-award-footer-status-text").remove();
				

			}
		});
		
		$(".admin-side-bar-tlist2").click(function() {
			if($(".admin-side-bar-title2").css("display","none")){
				$(".admin-side-bar-title1").hide();
				$(".admin-side-bar-title2").show();
				$(".admin-list-body-list-table-m").show();
				$(".ad-t-v-header-award-footer").append("<div class='ad-t-v-header-award-footer-status-text'>입금 확인</div>");
			}
		});
	$(".admin-list-body-list-t-btn1").click(function() {
		var trainerNo =$(this).val();
		$.ajax({
			type: "get",
			url: "modal/request?trainerNo="+trainerNo,
			dataType: "html",
			success: function(json) {		
				console.log(json);
				$(".row.award").html(json)

			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status);
			}
		});		
	});
	
	//--------------트레이너 상태 변경---------------
	
	
	$("#trainerStatusChange").change(function() {

		alert("ㅎㅇ!");
		var trainerMemberNo = $("#trainerMemberNo").val();
		
		var trainerStatus = $(this).val(); 

		location.href="${pageContext.request.contextPath}/admin/trainer/statusChange?trainerStatus="+trainerStatus+"&memberNo="+trainerMemberNo;
	});
	
	
	
	//--------------상태 (2,3 인지) name 값 가져오기-----
	
	var memberStatus = ${memberStatus};
	alert(memberStatus);
	
	//-----------------검색----------
	$("#searchBtn").click(function() {
		
		// 검색 카테고리
		var searchKeyword = $("#nameIdSearch").val();
		
		alert(searchKeyword);
		
		// 검색 값
		var searchValue = $("#searchValue").val();
		alert(searchValue);
		
		location.href="${pageContext.request.contextPath}/admin/trainerSearch?searchKeyword="+searchKeyword+"&searchValue="+searchValue+"&memberStatus="+${memberStatus};

	});
	
	//-----------------Paging----------------------------------
	var page = 1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
	var html = ""; //페이지 번호 출력하기 위한 전역 변수
	
	//페이징 처리 
	//[처음], [이전] 이동 설정
	if (${pager.startPage} > ${pager.blockSize}) {
				
		html += "<a href='<c:url value="/admin/trainerSearch"/>?pageNum=1&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"&memberStatus="+${memberStatus}+"'>[처음]</a>";
		html += "<a href='<c:url value="/admin/trainerSearch"/>?pageNum=${pager.prevPage}&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"&memberStatus="+${memberStatus}+"'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/admin/trainerSearch"/>?pageNum="+i+"&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"&memberStatus="+${memberStatus}+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/admin/trainerSearch"/>?pageNum=${pager.nextPage}&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"&memberStatus="+${memberStatus}+"'>[>]</a>";
		html += "<a href='<c:url value="/admin/trainerSearch"/>?pageNum=${pager.totalPage}&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"&memberStatus="+${memberStatus}+"'>[마지막]</a>";
	} else {
		html += "[>][마지막]";
	}
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html); 
		
		
	</script>
