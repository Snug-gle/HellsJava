<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
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
									href="<c:url value="/admin/trainerList"/>" title="Buttons">
										트레이너목록</a></li>
								<li><a href="" title="Sliders &amp; Progress">트레이너 신청 목록</a></li>
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
				<h1>1:1문의 목록</h1>
			</div>
				<section id="main-content" class="animated fadeInUp">
					<div class="row">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="admin-list-body-list" id="showData"></div>
							</div>
						</div>
						<!-- 페이징 처리 출력하는 부분-->
						<div id="pageNumDiv"></div>
						<form id="searchForm">
							<div class="main-search-area">
								<select id="searchKeyword" name="nameSearch"
									class="btn btn-primary dropdown-toggle searchBtnBox">
									<option value="notice_service_title" selected="selected">&nbsp;제목&nbsp;</option>
									<option value="notice_service_content">&nbsp;내용&nbsp;</option>
									<option value="member_id">&nbsp;아이디&nbsp;</option>
								</select> <input class="main-search" type="text" name="searchValue"
									id="searchValue">
								<button type="button" id="searchBtn"
									class="btn btn-primary searchBtnBox">검색</button>
							</div>
						</form>
					</div>
				</section>
		</section>
		</section>
	</div>
	
</div>

	<script type="text/javascript">
		 //제목 누르면 내용 펼치기
		$(document).on("click",".admin-list-body-listTitle", function() {
			/* $(".admin-list-body-listBody").toggle(); */
			$(this).next().toggle();
		});
		//답변 버튼 누르면 text창 펼치기
		$(document).on("click",".admin-list-body-listBody-btn1", function() { 
			 /* $(".admin-list-body-listBody-review").show();
				$(".admin-list-body-listBody-btn1").hide(); */
			$(this).hide();
			$(this).parent().parent().next().children().show();
		});
		
		$(document).on("click",".admin-list-body-listBody-btn2", function() { 
		/*	$(".admin-list-body-listBody-review").hide();
			$(".admin-list-body-listBody-btn1").show(); */
			$(this).parent().parent().hide();
			$(this).parent().parent().parent().prev().children().children().show();
		});
		
		$(document).on("click",".admin-list-body-listBody-btn3", function() { 
			/* $(".texttest").contents().unwrap().wrap( '<textarea class="admin-list-review rr" rows="" cols=""></textarea>' );
			$(".admin-list-body-listBody-btn3").hide();
			$(".admin-list-body-listBody-btn4").show();
			$(".admin-list-body-listBody-btn5").show(); */
			$(this).parent().prev().children().next().contents().unwrap().wrap( '<textarea name="replyText" class="admin-list-review rr" rows="" cols=""></textarea>' );
			$(this).hide();
			$(this).next().show();
			$(this).next().next().show();
		});
		
		$(document).on("click",".admin-list-body-listBody-btn5", function() { 
			/* $(".admin-list-review.rr").contents().unwrap().wrap( '<p class="texttest"></p>' );
			$(".admin-list-body-listBody-btn3").show();
			$(".admin-list-body-listBody-btn4").hide();
			$(".admin-list-body-listBody-btn5").hide(); */
			$(this).parent().prev().children().next().contents().unwrap().wrap( '<p class="texttest"></p>' );
			$(this).hide();
			$(this).prev().hide();
			$(this).prev().prev().show();
		});
		
		/* $(".admin-list-body-listBody-btn1").click(function() {
			$(".admin-list-body-listBody-review").show();
			$(".admin-list-body-listBody-btn1").hide();
		});
		
		$(".admin-list-body-listBody-btn2").click(function() {
			$(".admin-list-body-listBody-review").hide();
			$(".admin-list-body-listBody-btn1").show();
		});
		
		$(".admin-list-body-listBody-btn3").click(function() {
			$(".texttest").contents().unwrap().wrap( '<textarea class="admin-list-review rr" rows="" cols=""></textarea>' );
			$(".admin-list-body-listBody-btn3").hide();
			$(".admin-list-body-listBody-btn4").show();
			$(".admin-list-body-listBody-btn5").show();
			
		});
		
		$(".admin-list-body-listBody-btn5").click(function() {
			$(".admin-list-review.rr").contents().unwrap().wrap( '<p class="texttest"></p>' );
			$(".admin-list-body-listBody-btn3").show();
			$(".admin-list-body-listBody-btn4").hide();
			$(".admin-list-body-listBody-btn5").hide();
			
		}); */
		
		
		var idid=0;
		var page=1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
		boardDisplay(page, idid);

		idid=idid*1;
		alert(idid);
		/* 게시글 목록을 검색하여 JSON 텍스트로 응답하는 웹프로그램을 AJAX로 요청하여 처리하는 함수 */
		function boardDisplay(pageNum, idid) {
				page=pageNum;
				var url1 ="questionSearch?pageNum="+pageNum+"&searchKeyword="+$("#searchKeyword").val()+"&searchValue="+$("#searchValue").val();
				var url2 = "question_list?pageNum="+pageNum;
				$.ajax({
					type: "get",
					url: (idid == 1) ? url1 : url2 ,
					dataType: "json",
					success: function(json) {		
						if(idid == 1){
							idid=0;
						}
						var str1;
						if(json.restAdminQAList.length==0){
							str1 += "<table class='admin-list-body-list-table' >";
							str1 += "<colgroup>";
							str1 += "<col style='width:140px'>";
							str1 += "<col style='width:150px'>";
							str1 += "<col style='width:100px'>";
							str1 += "<col style='width:140px'>";
							str1 += "<col style='width:200px'>";
							str1 += "<col style='width:100px'>";
							str1 += "<col style='width:110px'>";
							str1 += "</colgroup>";
							str1 += "<tr>";
							str1 += "<td colspan='7'>검색된 1:1 문의가 존재하지 않습니다.</td>";
							str1 += "</tr>";   
							str1 += "</table>";
							$("#showData").html(str1);
							return;
						}
						
						
						var str = "<table class='admin-list-body-list-table' >";
							str += "<colgroup>";
							str += "<col style='width:140px'>";
							str += "<col style='width:150px'>";
							str += "<col style='width:200px'>";
							str += "<col style='width:140px'>";
							str += "<col style='width:200px'>";
							str += "<col style='width:200px'>";
							str += "<col style='width:110px'>";
							str += "</colgroup>";
							str += "<tr>";
							str += "<th scope='col'>번호</th>";
							str += "<th scope='col'>카테고리</th>";
							str += "<th scope='col'>제목</th>";
							str += "<th scope='col'></th>";
							str += "<th scope='col'>아이디</th>";
							str += "<th scope='col'>날짜</th>";
							str += "<th scope='col'>답변상태</th>";
							str += "</tr>";
						var list = json.restAdminQAList;
						$(list).each(function(ind, obj){
							str += "<tr class='admin-list-body-listTitle'  id='admin-list-body-listTitle"+ind+"'>";
							str += "<td>"+obj["noticeServiceNo"]+"</td>";
							if(obj["noticeServiceCategory"]==1){
								str += "<td>결제</td>";
							} else if(obj["noticeServiceCategory"]==2){
								str += "<td>트레이너</td>";
							} else {
								str += "<td>기타</td>";
							}
							str += "<td>"+obj["noticeServiceTitle"]+"</td>";
							str += "<td></td>";
							str += "<td>"+obj["memberId"]+"</td>";
							str += "<td>"+obj["noticeServiceDate"]+"</td>";
							if(obj["noticeServiceReply"]==null || obj["noticeServiceReply"] == ''){
								str += "<td>미답변</td>";
							} else {
								str += "<td>답변</td>";
							}
							str += "</tr>";
							str += "<tr class='admin-list-body-listBody'>";
							str += "<td colspan='7'>";
							str += "<h4>Q</h4>"+obj["noticeServiceContent"];
							str += "<hr>";
							if(obj["noticeServiceStatus"]!=3){
								str += "<ul>";
								str += "<li class='alblb'>";
								str += "<button class='admin-list-body-listBody-btn1 btn btn-primary' type='button' id='lb-btn1-"+ind+"'>답변</button>";
								str += "</li>";
								str += "</ul>";
							
								str += "<form action='${pageContext.request.contextPath}/question/reply/"+obj["noticeServiceNo"]+"' method='post'>";
								str += "<ul class='admin-list-body-listBody-review alblb'>";
								str += "<li> <textarea name='replyText' class='admin-list-review' rows='' cols=''></textarea> </li>";
								str += "<li class='alblb'>";
								str += "<button type='submit' class='btn btn-primary'>작성</button> ";
								str += "<button type='reset' class='btn btn-primary'>초기화</button> ";
								str += "<button class='admin-list-body-listBody-btn2 btn btn-primary' id='lb-btn2-"+ind+"' type='button'>취소</button>";
								str += "</li>";
								str += "</ul>";
								str += "</form>";
							} else {
								str += "<form action='${pageContext.request.contextPath}/question/reply/"+obj["noticeServiceNo"]+"'  method='post'>";
								str += "<ul class='admin-list-body-listBody-review-bf'>";
								str += "<li>";
								str += "<h4>A</h4>";
								str += "<p class='texttest'>"+obj["noticeServiceReply"]+"</p>";
								str += "</li>";
								str += "<li class='alblb'>";
								str += "<button class='admin-list-body-listBody-btn3 btn btn-primary' id='lb-btn3-"+ind+"' type='button'>수정</button> ";
								str += "<button class='admin-list-body-listBody-btn4 btn btn-primary' id='lb-btn4-"+ind+"' type='submit'>입력</button> ";
								str += "<button class='admin-list-body-listBody-btn5 btn btn-primary' id='lb-btn5-"+ind+"' type='button'>취소</button>";
								str += "</li>";
								str += "</ul>";
								str += "</form>";
							}
								str += "</td>";
								str += "</tr>";
						});
						str += "</table>";
						$("#showData").html(str);

						/* //응답된 게시글 목록을 HTML로 변환하도록 Handlebars 자바스크립트 라이브러리 이용
						var source=$("#admin_qa_template").html();//템플릿 코드를 반환받아 저장
						
						//템플릿 코드를 전달받아 템플릿 객체로 생성하여 저장
						var template=Handlebars.compile(source);
						
						//템플릿 객체에 JavaScript 객체(게시글 목록)를 전달하여 HTML 태그로 변환하여 출력
						$("#restAdminQAListDiv").html(template(json.restAdminQAList)); */
						
						//페이지 번호를 출력하는 함수 호출
						pagerDisplay(json.pager);
						
					},
					error: function(xhr) {
						alert("에러코드 = "+xhr.status);
					}
				});		
			} 

						
			/* 페이지 번호를 출력하는 함수 */
			function pagerDisplay(pager) {
				var html="";
				
				if(pager.startPage>pager.blockSize) {
					html+="<a href='javascript:boardDisplay(1);'>[처음]</a>";
					html+="<a href='javascript:boardDisplay("+pager.prevPage+");'>[이전]</a>";
				} else {
					html+="[처음][이전]";
				}
				
				for(i=pager.startPage;i<=pager.endPage;i++) {
					if(pager.pageNum!=i) {
						html+="<a href='javascript:boardDisplay("+i+");'>["+i+"]</a>";
					} else {
						html+="["+i+"]";
					}
				}
				
				if(pager.endPage!=pager.totalPage) {
					html+="<a href='javascript:boardDisplay("+pager.nextPage+");'>[다음]</a>";
					html+="<a href='javascript:boardDisplay("+pager.totalPage+");'>[마지막]</a>";
				} else {
					html+="[다음][마지막]";
				}
				
				$("#pageNumDiv").html(html);
			}
			
			//------------------------------------------
			$("#searchBtn").click(function() {
				
				idid = 1;
				
				/* var searchKeyword = $("#searchKeyword").val();
				
				var searchValue = $("#searchValue").val();
				
				location.href="${pageContext.request.contextPath}/admin/questionSearch?searchKeyword="+searchKeyword+"&searchValue="+searchValue; */

				boardDisplay(page,idid);
			})			
	</script>