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
									<a href="<c:url value="/admin/trainerList"/>" title="Buttons">트레이너목록</a>
								</li>
								<li class="admin-side-bar-tlist2"><a href="" title="Sliders &amp; Progress">트레이너 신청 목록</a></li>
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
										<th></th>
										<th style="width: 100px;"><span class="admin-list-body-list-table-m">입금 상태</span></th>
										<th style="width: 110px;">상세보기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>번호</td>
										<td>아이디</td>
										<td>이름</td>
										<td>연락처</td>
										<td></td>
										<td></td>
										<td>
											<button class="admin-list-body-list-t-btn1 btn btn-primary" type="button"
												data-toggle="modal" data-target="#trainer_view">상세보기</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
						<form id="searchForm" method="get">
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
<div class="modal fade" id="trainer_view" role="dialog" >
	<div class="modal-dialog" id="modal-dialog" style="text-align: left;">
		<div class="modal-content">
			<div class="modal-header">
				<div class="logo-location">
					<a href="<c:url value="/"/>" class="modal-header-logo"><i class="icon-layers"></i>오늘의 짐</a>
				</div>
			</div>
			<div class="modal-body">
				<div id="login-wrapper">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">트레이너 상세</h3>
						</div>
						<div class="panel-body">
							<form action="">
								<hr>
									<h3><strong>트레이너 정보</strong></h3>
								<hr>
								<div class="row">
									<div class="trainerDetailView">
										<img alt="" src="<spring:url value="/img/avatar2.png"/>">
									</div>
									<div class="ad-t-v-header-info trainerDetailView">
										<table>
											<tr>
												<td>이름</td>
												<td>김남영</td>
											</tr>
											<tr>
												<td>연락처</td>
												<td>01011112222</td>
											</tr>
											<tr>
												<td>소속 센터 주소</td>
												<td>불러오니라</td>
											</tr>
										</table>
									</div>
								</div>
								<hr>
									<h3><strong>수상경력 및 이력</strong></h3>
								<hr>
								<div class="ad-t-v-header-award-body">
									<div class="row">
										<div class="trainerDetailView">
											<img class="trainer-detail-profile" alt="" src="<spring:url value="/img/avatar2.png"/>">
										</div>
										<div class="ad-t-v-header-info trainerDetailView">
											<p>수상이력</p>
										</div>
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
										<select class="btn btn-primary dropdown-toggle">
											<option value="1" selected>트레이너</option>
											<option value="2">회원</option>
											<option value="3">탈퇴</option>
										</select>
									</div>
								</div>
								</form>
							</div>
							<div class="modal-footer">
								<div>
									<button type="submit" class="btn btn-primary btn-block">확인</button>
									<button type="button" data-dismiss="modal" class="btn btn-default btn-block">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
</div>



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

	</script>
