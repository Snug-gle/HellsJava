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
								<li class=""><a
									href="<c:url value="/admin/trainerList/3"/>" title="Buttons">
										트레이너목록</a></li>
								<li><a href="<c:url value="/admin/trainerList/2"/>" title="Sliders &amp; Progress">트레이너 신청 목록</a></li>
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
				<h1>회원관리</h1>
			</div>
			<section id="main-content" class="animated fadeInUp">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-body">
							<table class="table table-hover" id="memberListTable">
								<thead>
									<tr>
										<th style="width: 60px;">번호</th>
										<th>아이디</th>
										<th style="width: 130px;">이름</th>
										<th style="width: 140px;">연락처</th>
										<th>이메일</th>
										<th style="width: 100px;">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:set var ="su" value="${number}"/>
									<c:forEach var="member" items="${memberList }" varStatus="status">
                                        <c:set var ="number2" value="${su-status.index}"/>
										<tr>
											<td >${number2}</td>
											<td>${member.memberId }</td>
											<td>${member.memberName }</td>
											<td>${member.memberPhone }</td>
											<td>${member.memberEmail }</td>
											<td><select class="btn btn-primary dropdown-toggle memberBtn" id="memberStatus"
												name="${member.memberNo }">
													<option class=""
														<c:if test="${member.memberStatus==0 }">selected="selected"</c:if>
														id="quit" value="0">탈퇴 회원</option>
													<option class=""
														<c:if test="${member.memberStatus==1 }">selected="selected"</c:if>
														id="normal" value="1">일반 회원</option>
													<option class=""
														<c:if test="${member.memberStatus==9 }">selected="selected"</c:if>
														id="manager" value="9">관리자</option>

											</select></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
					<br>
						<%-- 페이지 번호 출력 --%>
					<div class="panel panel-default">
						<div class="panel-body" id="pageNumDiv"></div>
					</div>
					<br>
					
						
							<div class="main-search-area">
								<select id="nameIdSearch" name="nameIdSearch" class="btn btn-primary dropdown-toggle searchBtnBox">
									<option value="member_name" selected="selected">&nbsp;이름&nbsp;</option>
									<option value="member_id">&nbsp;아이디&nbsp;</option>
								</select>
								<input class="main-search" type="text" name="searchValue" id="searchValue" value="${searchValue }">
								<button type="button" id="searchBtn" class="btn btn-primary searchBtnBox">검색</button>
							</div>
						
				</div>
			</section>
		</section>
		</section>
	</div>
</div>

<script type="text/javascript">

	
	$("#memberStatus").change(function () {
		
		// 회원 상태 값
		var memberStatus = $(this).val(); 
		
		// 회원 번호 값
		var memberNo = $(this).attr("name");
		
		location.href="${pageContext.request.contextPath}/admin/userStatusModify?memberNo="+memberNo+"&memberStatus="+memberStatus;
	});
	
	$("#searchBtn").click(function() {
		
		// 검색 카테고리
		var searchKeyword = $("#nameIdSearch").val();
		
		// 검색 값
		var searchValue = $("#searchValue").val();
		
		location.href="${pageContext.request.contextPath}/admin/userSearch?searchKeyword="+searchKeyword+"&searchValue="+searchValue;

	});
	
	$("#searchValue").keypress(function() {
		if(event.keyCode==13) {
        	
        	// 검색 카테고리
    		var searchKeyword = $("#nameIdSearch").val();
    		
    		// 검색 값
    		var searchValue = $("#searchValue").val();
    		location.href="${pageContext.request.contextPath}/admin/userSearch?searchKeyword="+searchKeyword+"&searchValue="+searchValue;

        }
	})	
	
	//-----------------Paging----------------------------------
	var page = 1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
	var html = ""; //페이지 번호 출력하기 위한 전역 변수
	
	//페이징 처리 
	//[처음], [이전] 이동 설정
	if (${pager.startPage} > ${pager.blockSize}) {
				
		html += "<a href='<c:url value="/admin/userSearch"/>?pageNum=1&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"'>[처음]</a>";
		html += "<a href='<c:url value="/admin/userSearch"/>?pageNum=${pager.prevPage}&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"'>[<]</a>";
	} else {
		html += "[처음][<]";
	}
	//페이지 번호 설정
	for (var i = ${pager.startPage}; i <= ${pager.endPage}; i++) {
		if (${pager.pageNum} != i) {
			html += "<a href='<c:url value="/admin/userSearch"/>?pageNum="+i+"&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"'> [" + i + "] </a>";
		} else {
			html += "[" + i + "]";
		}
	}
	//[다음],[마지막] 이동 설정
	if (${pager.endPage} != ${pager.totalPage}) {
		html += "<a href='<c:url value="/admin/userSearch"/>?pageNum=${pager.nextPage}&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"'>[>]</a>";
		html += "<a href='<c:url value="/admin/userSearch"/>?pageNum=${pager.totalPage}&searchKeyword="+$("#nameIdSearch").val()+"&searchValue="+$("#searchValue").val()+"'>[마지막]</a>";
	} else {
		html += "[>][마지막]";
	}
	//페이징 처리 결과 출력
	$("#pageNumDiv").html(html);

	
</script>