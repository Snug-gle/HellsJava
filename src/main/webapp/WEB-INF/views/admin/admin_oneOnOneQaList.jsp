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
				<h4>1:1문의 목록</h4>
				<div class="admin-list-body-list">
					<table class="admin-list-body-list-table" id="restAdminQAListDiv">
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
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col"></th>
							<th scope="col">아이디</th>
							<th scope="col">날짜</th>
							<th scope="col">답변상태</th>
						</tr>
						

					</table>
				</div>
			</div>	
		</div>
	</div>
	<%-- 페이지 번호를 출력하는 영역 --%>
	<div id="pageNumDiv"></div>
</div>

	<script id="admin_qa_template" type="text/x-handlebars-template">
	{{#each .}}
						<tr class="admin-list-body-listTitle">
							<td>번호</td>
							<td>카테고리</td>
							<td>제목</td>
							<td></td>
							<td>아이디</td>
							<td>날짜</td>
							<td>답변</td>
						</tr>
						
						<tr class="admin-list-body-listBody">
							<td colspan="7">
								<h4>소개</h4>
								Java는 뛰어난 객체 지향 특성과 플랫폼 독립성을 가진 프로그래밍 언어로 인터넷 기반의 프로그램과 응용 프로그램 개발에 널리 사용되고 있다. 본 교과의 목적은 Java 언어의 기능과 특성을 이해하고 기초적 Java 프로그래밍 기술을 익히는 것이다. 차후 Java 언어를 이용한 고급 프로그래밍 기술을 학습하려면 반드시 수강하여야 한다. 선수과목은 객체지향 프로그래밍으로 객체지향 개념과 객체지향 언어의 기본 지식을 갖추고 있어야 한다. 교재를 중심으로 Java 언어의 기초적 프로그래밍 기술을 이해하고 나아가 최신 기술들인 GUI, 입출력, 멀티스레딩, 예외처리, 데이터베이스 연동 및 네트워크 프로그래밍 등의 내용을 학습하도록 한다. 예제로 주어지는 소스 코드를 분석하며 실습 위주의 강의를 통해 학생 스스로 원리를 이해하고 문제를 풀고 응용할 수 있는 능력과 기회를 제공하도록 한다.
								<hr>
								<ul>
									<li class="alblb">
										<button class="admin-list-body-listBody-btn1" type="button">답변</button>
									</li>
								</ul>
								<form action="">
									<ul class="admin-list-body-listBody-review alblb">
										<li> <textarea class="admin-list-review" rows="" cols=""></textarea> </li>
										<li class="alblb">
											<button type="submit">작성</button> 
											<button type="reset">초기화</button>
											<button class="admin-list-body-listBody-btn2" type="button">취소</button>
										</li>
									</ul>
								</form>
								<form action="">
									<ul class="">
										<li>
											<h4>답변</h4>
											<p class="texttest">Java는 뛰어난 객체 지향 특성과 플랫폼 독립성을 가진 프로그래밍 언어로 인터넷 기반의 프로그램과 응용 프로그램 개발에 널리 사용되고 있다. 본 교과의 목적은 Java 언어의 기능과 특성을 이해하고 기초적 Java 프로그래밍 기술을 익히는 것이다. 차후 Java 언어를 이용한 고급 프로그래밍 기술을 학습하려면 반드시 수강하여야 한다. 선수과목은 객체지향 프로그래밍으로 객체지향 개념과 객체지향 언어의 기본 지식을 갖추고 있어야 한다. 교재를 중심으로 Java 언어의 기초적 프로그래밍 기술을 이해하고 나아가 최신 기술들인 GUI, 입출력, 멀티스레딩, 예외처리, 데이터베이스 연동 및 네트워크 프로그래밍 등의 내용을 학습하도록 한다. 예제로 주어지는 소스 코드를 분석하며 실습 위주의 강의를 통해 학생 스스로 원리를 이해하고 문제를 풀고 응용할 수 있는 능력과 기회를 제공하도록 한다.</p>
										</li>
										<li class="alblb">
											<button class="admin-list-body-listBody-btn3" type="button">수정</button>
											<button class="admin-list-body-listBody-btn4" type="submit">입력</button>
											<button class="admin-list-body-listBody-btn5" type="button">취소</button>
										</li>
									</ul>
								</form>
							</td>
						</tr>
		{{/each}}	


						
	</script>

	<script type="text/javascript">
		$(function(){
			$(".admin-list-body-listBody").hide();
			$(".admin-list-body-listBody-review").hide();
			$(".admin-list-body-listBody-btn4").hide();
			$(".admin-list-body-listBody-btn5").hide();
		});
		
		$(".admin-list-body-listTitle").click(function() {
			$(".admin-list-body-listBody").toggle();
		});
		
		$(".admin-list-body-listBody-btn1").click(function() {
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
			
		});
		
		var page=1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
		boardDisplay(page);

		/* 게시글 목록을 검색하여 JSON 텍스트로 응답하는 웹프로그램을 AJAX로 요청하여 처리하는 함수 */
		function boardDisplay(pageNum) {
				page=pageNum;
				$.ajax({
					type: "get",
					url: "questionList?pageNum="+pageNum,
					dataType: "json",
					success: function(json) {		
						if(json.restAdminQAListDiv.length==0){
							$("#restAdminQAListDiv").html("<tr class='admin-list-body-listBody'><td colspan='7'>검색된 1:1 문의가 존재하지 않습니다.</td></tr>");
							return;
						}
						
						//응답된 게시글 목록을 HTML로 변환하도록 Handlebars 자바스크립트 라이브러리 이용
						var source=$("#admin_qa_template").html();//템플릿 코드를 반환받아 저장
						
						//템플릿 코드를 전달받아 템플릿 객체로 생성하여 저장
						var template=Handlebars.compile(source);
						
						//템플릿 객체에 JavaScript 객체(게시글 목록)를 전달하여 HTML 태그로 변환하여 출력
						$("#restAdminQAListDiv").html(template(json.restAdminQAListDiv));
						
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
	</script>
</body>
</html>