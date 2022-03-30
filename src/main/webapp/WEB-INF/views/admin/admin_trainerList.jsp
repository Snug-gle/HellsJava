<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>염병할 고갱님들</title>
</head>
<body>
<div class="trainerList">
	<div class="admin-title">
		<h2>관리자 페이지</h2>
	</div>
	<div class="trainerList-content">
		<div class="trainerList-side admin-Panel admin-listPanel">
			<div class="admin-side-bar">
				<ul>
					<li onclick="location.href='<c:url value="/admin/userList"/>';">회원목록</li>
					<li onclick="location.href='<c:url value="/admin/trainerList"/>';">트레이너 목록
						<ul>
							<li class="admin-side-bar-tlist1">트레이너 목록</li>
							<li class="admin-side-bar-tlist2">트레이너 신청 목록</li>
						</ul>
					</li>
					<li onclick="location.href='<c:url value="/admin/questionList"/>';">1:1문의 목록</li>
				</ul>
			
				
			</div>
		</div>
		<div class="trainerList-body admin-Panel">
			<div class="admin-side-bar">
				<h4 class="admin-side-bar-title1">트레이너 목록</h4>
				<h4 class="admin-side-bar-title2">트레이너 신청 목록</h4>
				<div class="admin-list-body-list">
					<table class="admin-list-body-list-table">
						<colgroup>
							<col style="width:140px">
							<col style="width:150px">
							<col style="width:100px">
							<col style="width:140px">
							<col style="width:200px">
							<col style="width:100px">
							<col style="width:110px">
						</colgroup>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">연락처</th>
							<th scope="col"></th>
							<th scope="col"><span class="admin-list-body-list-table-m">입금 상태</span></th>
							<th scope="col">상세</th>
						</tr>
					
						<tr>
							<td>번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>연락처</td>
							<td></td>
							<td></td>
							<td>
								<button class="admin-list-body-list-t-btn1" type="button" data-toggle="modal" data-target="#trainer_view">상세보기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>	
		</div>
	</div>
	
	<div class="modal fade" id="trainer_view" role="dialog" >
		<div class="modal-dialog" id="modal-dialog">
			<form action="">
				<div class="modal-content">
					<div class="modal-header">
						<h1>오늘의 짐</h1>
						<br>
						<h2>트레이너 상세</h2>
					</div>
					<div class="modal-body">
			
						<div class="ad-t-v-header-info">
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
							<br>
						</div>
						<div class="ad-t-v-header-award-title">
							<h3>수상경력 및 이력</h3>
							<hr>
						</div>
						<div class="ad-t-v-header-award-content">
							<div class="ad-t-v-header-award-body">
								<table>
									<tr>
										<td> <img alt="" src="<spring:url value="/img/avatar2.png"/>"></td>
										<td>수상이력 불러오니라</td>
									</tr>	
								</table>
							</div>
							<hr>
						</div>
						<div class="ad-t-v-header-award-footer">
							<div class="ad-t-v-header-award-footer-text">다음 결제일 : ??</div>
							<div class="ad-t-v-header-award-footer-text">결제 금액 : 15000원</div>
							
							<div class="ad-t-v-header-award-footer-change">
								<select>
									<option value="1" selected>트레이너</option>
									<option value="2">회원</option>
									<option value="3">탈퇴</option>
								</select>
							</div>
						</div>
						
					</div>
					
					<div class="modal-footer">
						<div>
							<button type="submit">확인</button>
							<button type="button" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</form>
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
</body>
</html>