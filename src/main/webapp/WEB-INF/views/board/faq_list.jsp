<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%-- handlebars 라이브러리 : JSON 형식으로 표현된 JavaScrit 객체를 전달받아 HTML 태그로 변환하는
기능을 제공하는 자바스크립트 템플릿 라이브러리 --%>
<%-- => https://cdnjs.com 사이트에서 handlebars 라이브러리를 검색하여 JSP 문서에 포함 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<style type="text/css">
#btnDiv {
	margin: 10px;
}

#insertDiv, #updateDiv {
	width: 240px;
	height: 80px;
	border: 2px solid black;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -40px;
	margin-left: -120px;
	padding: 5px;
	z-index: 100;
	display: none;
}
</style>
	<h1>FAQ</h1>
		<hr>
		<div id="btnDiv">
			<c:if test="${loginUserinfo.memberStatus==9}">
			<button type="button" id="writeBtn" onclick="location.href='<c:url value="/faq/write"/>';">글쓰기</button>
			</c:if> 
		</div>
		
	<%-- 게시글 목록을 출력하는 영역 --%>
	<div id="faqListDiv"></div>
	
	<%-- 페이지 번호를 출력하는 영역 --%>
	<div id="pageNumDiv"></div>
	
	<%-- 변경 게시글을 입력하는 영역 --%>
	<div id="updateDiv">
		<input type="hidden" name="noticeServiceNo" id="updateNum">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeServiceTitle" id="updateTitle" class="insert"></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><select name="noticeServiceCategory" id="updateCategory" class="update">
						<option value="1" selected="selected"> 입금/결제</option>
						<option value="2">트레이너 관련 문의</option>
						<option value="3">기타문의</option>
					</select>
				</td>
				</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="noticeServiceContent" id="updateContent" class="update"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" id="updateBtn">변경</button>
					<button type="button" id="cancelUpdateBtn">취소</button>
				</td>
			</tr>
		</table>	
	</div>
	
	
	
	<%-- handlebars 템플릿 코드 작성 >> HTML --%>
	<%-- => {{#each}} 표현식을 사용하여 Array 객체에 대한 반복 처리 --%>
	<%-- => {{propertyName}} 표현식을 사용하여 Object 객체의 속성값 표현 --%>	
	
	<script id="template" type="text/x-handlebars-template">
		<table border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="50">번호</th>
				<th width="100" >카테고리</th>
				<th width="100">제목</th>
				<th width="300">내용</th>
				<th width="200">작성일</th>
				<th width="50">작성자</th>
				<th width="50">조회수</th>
				<th width="50">변경</th>
				<th width="50">삭제</th>
			</tr>

		{{#each .}}
			<tr>
				<td align="center">{{noticeServiceNo}}</td>
				<td align="center">{{noticeServiceCategory}}</td>
				<td align="center">{{noticeServiceTitle}}</td>
				<td align="center">{{noticeServiceContent}}</td>
				<td align="center">{{noticeServiceDate}}</td>
				<td align="center">{{memberName}}</td>
				<td align="center">{{noticeServiceHits}}</td>
				<td align="center"><button type="button" onclick="modify({{noticeServiceNo}});">변경</button></td>
				<td align="center"><button type="button" onclick="remove({{noticeServiceNo}});">삭제</button></td>
				
			<tr>			
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
	
	//게시글의 [수정]을 클릭한 경우 호출되는 이벤트 처리 함수
	function modify(num) {
		//alert("num = "+num);
		
		//변경 게시글 입력 영역 출력
		$("#updateDiv").show();
		
		$.ajax({
			type: "get",
			url: "view/"+num,
			dataType: "json",
			success: function(json) {
				$("#updateNum").val(json.noticeServiceNo);
				$("#updateCategory").val(json.noticeServiceCategory);
				$("#updateTitle").val(json.noticeServiceTitle);
				$("#updateContent").val(json.noticeServiceContent);
			}, 
			error: function(xhr) {
				alert("에러코드 = "+xhr.status);
			}
		});
	}
                           	
	//[수정]을 클릭한 경우 호출되는 이벤트 처리 함수 등록
	$("#updateBtn").click(function() {
		var noticeServiceNo=$("#updateNum").val();
		var noticeServiceTitle=$("#updateTitle").val();
		var noticeServiceContent=$("#updateContent").val();
		var noticeServiceCategory=$("#updateCategory").val();
		
		if(noticeServiceTitle=="") {
			alert("제목을 입력해 주세요.");
			return;
		}
		
		if(noticeServiceContent=="") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			type: "put",
			url: "modify",
			contentType: "application/json",
			data: JSON.stringify({"noticeServiceNo":noticeServiceNo,"noticeServiceTitle":noticeServiceTitle,"noticeServiceCategory":noticeServiceCategory,"noticeServiceContent":noticeServiceContent}),
			dateType: "text",
			success: function(text) {
				if(text=="success") {
					$(".update").val("");
					$("#updateDiv").hide();
					
					//게시글 목록을 검색하여 출력하는 함수 호출
					boardDisplaly(page);
				}
			},
			error: function(xhr) {
				alert("에러코드 = "+xhr.status)
			}
		});
	});
	
	//[취소]를 클릭한 경우 호출되는 이벤트 처리 함수 등록 
	$("#cancelUpdateBtn").click(function() {
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
