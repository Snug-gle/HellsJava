<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<div class="userList">
	<div class="admin-title">
		<h2>관리자 페이지</h2>
	</div>
	<div class="userList-content">
		<div class="userList-side admin-Panel admin-listPanel">
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
		<div class="userList-body admin-Panel">
			<div class="admin-side-bar">
				<h4>회원 관리</h4>
				<div class="admin-list-body-list">
					<table class="admin-list-body-list-table">
						<colgroup>
							<col style="width:140px">
							<col style="width:150px">
							<col style="width:100px">
							<col style="width:140px">
							<col style="width:200px">
							<col style="width:100px">
						</colgroup>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">연락처</th>
							<th scope="col">이메일</th>
							<th scope="col">상태</th>
						</tr>
						<c:forEach var="member" items="${memberList }">
							<tr>
								<td>${member.memberNo }</td>
								<td>${member.memberId }</td>
								<td>${member.memberName }</td>
								<td>${member.memberPhone }</td>
								<td>${member.memberEmail }</td>
								<td>
									<select class="status" id="memberStatus" name="${member.memberNo }">
											<option class="" <c:if test="${member.memberStatus==0 }">selected="selected"</c:if> id="quit" value="0">탈퇴 회원</option>
											<option class="" <c:if test="${member.memberStatus==1 }">selected="selected"</c:if>  id="normal" value="1" >일반 회원</option>
											<option class="" <c:if test="${member.memberStatus==9 }">selected="selected"</c:if> id="manager" value="9" >관리자 회원</option>
										
									</select>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>	
		</div>
	</div>
	
	<form id="searchForm" method="get">
		<select id = "nameIdSearch" name = "nameIdSearch">
			<option value = "member_name" selected="selected">&nbsp;이름&nbsp;</option>
			<option value = "member_id" >&nbsp;아이디&nbsp;</option>			
		</select>
		<input type="text" name="searchValue" id="searchValue">
		<button type="button" id="searchBtn">검색</button>
	</form>
</div>

<script type="text/javascript">

	
	$(".status").change(function () {
		
		// 회원 상태 값
		var memberStatus = $(this).val(); 
		
		// 회원 번호 값
		var memberNo = $(this).attr("name");
		
		location.href="${pageContext.request.contextPath}/admin/userStatusModify?memberNo="+memberNo+"&memberStatus="+memberStatus;
	});
	
	$("#searchBtn").click(function() {
		
		// 검색 카테고리
		var searchKeyword = $("#nameIdSearch").val();
		
		alert(searchKeyword);
		
		// 검색 값
		var searchValue = $("#searchValue").val();
		alert(searchValue);
		
		location.href="${pageContext.request.contextPath}/admin/userSearch?searchKeyword="+searchKeyword+"&searchValue="+searchValue;

	})
	
</script>