<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- handlebars 라이브러리 : JSON 형식으로 표현된 JavaScrit 객체를 전달받아 HTML 태그로 변환하는
기능을 제공하는 자바스크립트 템플릿 라이브러리 --%>
<%-- => https://cdnjs.com 사이트에서 handlebars 라이브러리를 검색하여 JSP 문서에 포함 --%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>--%>s


<div class="container">
	<div style="text-align: right;">
		<c:if test="${loginUserinfo.memberStatus==9}">
				<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/faq/write"/>';">작성</button>
		</c:if>
	</div>
	<div class="notice-list-print">
		<div class="notice-list-title">
			<h3 class="panel-title"><strong>FAQ</strong></h3>
		</div>
		
		<%--게시글 목록 출력 --%>
		<div class="panel panel-default">
		    <div class="panel-body" id="faqListDiv">
		    	<table class="table table-hover">
				<thead>			
				<tr>
					<th align="center" width="2px">번호</th>
					<th align="center" width="15px">카테고리</th>
					<th align="center" width="200px">제목</th>
					<th align="center" width="20px">작성일</th>
					<th align="center" width="15px">작성자</th>
				</tr>
 			</thead>
 			<tbody>
				<tr>
					<td align="center">{{noticeServiceNo}}</td>
					<td align="center">{{noticeServiceCategoryName}}</td>
					<td align="center" id="title"><a href="<c:url value='/faq/view/'/>{{noticeServiceNo}}">{{noticeServiceTitle}}</a></td>
					<td align="center">{{noticeServiceDate}}</td>
					<td align="center">{{memberName}}</td>
				<tr>	
			</tbody>	
		    </table>
		    </div>
		</div>
		<%-- 페이지 번호 출력 --%>
		<div class="panel panel-default">
		    <div class="panel-body"id="pageNumDiv"></div>
		</div>
	</div>
</div>		
		
		
<%-- handlebars 템플릿 코드 작성 >> HTML --%>
<%-- => {{#each}} 표현식을 사용하여 Array 객체에 대한 반복 처리 --%>
<%-- => {{propertyName}} 표현식을 사용하여 Object 객체의 속성값 표현 --%>
<script id="template" type="text/x-handlebars-template">
	<div class="panel-body" style="display: block;">
        <table class="table table-hover">
			<thead>			
				<tr>
					<th align="center" width="2px" style=" text-align: -webkit-center;">번호</th>
					<th align="center" width="15px" style=" text-align: -webkit-center;">카테고리</th>
					<th align="center" width="200px" style=" text-align: -webkit-center;">제목</th>
					<th align="center" width="20px" style=" text-align: -webkit-center;">작성일</th>
					<th align="center" width="15px" style=" text-align: -webkit-center;">작성자</th>
				</tr>
 			</thead>
		{{#each .}}
			<tbody>
				<tr>
					<td align="center">{{noticeServiceNo}}</td>
					<td align="center">{{noticeServiceCategoryName}}</td>
					<td align="center" id="title"><a href="<c:url value='/faq/view/'/>{{noticeServiceNo}}">{{noticeServiceTitle}}</a></td>
					<td align="center">{{noticeServiceDate}}</td>
					<td align="center">{{memberName}}</td>
				<tr>	
			</tbody>		
		{{/each}}	
		</table>
	</script>
	
	<script type="text/javascript">
	var page=1;//현재 요청 페이지 번호를 저장한 전역변수
	
	boardDisplay(page);
	
	//게시글 목록을 검색하여 JSON 텍스트로 응답하는 웹프로그램을 AJAX로 요청
	function boardDisplay(pageNum) {
		page=pageNum;
		$.ajax({
			type: "get",
			url: "list?pageNum="+pageNum,
			dateType: "json",
			success: function(json) {
				if(json.faqList.length==0){
					$("#faqListDiv").html("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				
				//응답된 게시글 목록을 HTML로 변환하도록 Handlesbars 자바스크립트 라이브러리 이용
				var source=$("#template").html();//템플릿 코드를 반환받아 저장
				//템플릿 코드를 전달받아 템플릿 객체로 생성하여 저장
				var template=Handlebars.compile(source);
				//템플릿 객체에 JavaScript 객체 ( 게시글 목록)를 전달하여 HTML 태그로 변환
				$("#faqListDiv").html(template(json.faqList));
				
				//페이지 번호를 출력하는 함수 호출
				pagerDisplay(json.pager);
				
			},
			error: function (xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	}
	
	//페이지 번호를 출력하는 함수
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
	
	//[글쓰기]를 클릭한 경우 호출되는 이벤트 처리 함수 등록
	$("#writeBtn").click(function() {
		//변경 게시글 입력 영역 초기화
		$(".update").val("");
		$("#updateDiv").hide();
	});
	
	
	
	//게시글 [삭제]버튼을 클릭한 경우 호출되는 이벤트 처리 함수
	function remove(num) {
		if(confirm("게시글을 삭제 하시겠습니까?")) {
			$.ajax({
				type: "delete",
				url: "remove/"+num,
				dateType: "text",
				success: function(text) {
					if(text=="success") {
						boardDisplay(1);
					}
				}, 
				error: function(xhr) {
					alert("에러코드 = "+xhr.status);
				}
			});
		}
	}
	</script>