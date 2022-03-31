<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="notice-list-print">
		<div class="notice-list-title">
			<div>
				<span>${faq.noticeServiceTitle}</span>
			</div>
		</div>
		
		<%--게시글 내용 출력 --%>
		<div class="panel panel-default">
		    <div class="panel-body" id="restNoticeListDiv" style="height: 400px;">
		    	${faq.noticeServiceContent}
		    </div>
		</div>
		
		<div style="text-align: right;">
			<c:if test="${loginUserinfo.memberStatus==9}">
				<!-- <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/faq/modify"/>';">수정</button> -->
				<button onclick="location.href='#faq-update'" data-toggle="modal" data-target="#faq-update" data-backdrop="static" class="btn btn-primary" id="updateBtn">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/faq/remove"/>/${faq.noticeServiceNo }';">삭제</button>
			</c:if>
		</div>
		<div style="text-align: center;">
			<button style="width: 200px;" type="button" class="btn btn-primary" value="목록" onClick="location.href='<c:url value="/faq/board"/>';">목록</button>
		</div>
		
	</div>
</div>

<div class="modal fade" id="faq-update" role="dialog">
	<div class="modal-dialog" id="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="logo-location"></div>
			</div>
			<div class="modal-body">
				<div id="login-wrapper">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">FAQ 수정</h3>
						</div>
						<div class="panel-body">
							<form role="form" action="#" method="get" id="faqUpdateForm">
								<div id="updateDiv">
									<input type="hidden" name="noticeServiceNo" id="updateNum" value="${faq.noticeServiceNo }">
									<div class="form-group">
                                		<label for="nameLabel">제목</label>
                                		<input type="text" class="form-control" id="updateTitle" name="noticeServiceTitle" class="form-control" value="${faq.noticeServiceTitle }">
									</div>
									<div class="form-group">
										<select name="noticeServiceCategory" id="updateCategory" class="btn btn-primary dropdown-toggle">
											<option value="1" selected="selected">입금/결제</option>
											<option value="2">트레이너 관련 문의</option>
											<option value="3">기타문의</option>
										</select>
									</div>
									<div class="form-group">
                                		<label for="nameLabel">내용</label>
                                		<input type="text" class="form-control" id="updateContent" name="noticeServiceContent" class="form-control" value="${faq.noticeServiceContent }" style="height: 150px;">
									</div>
									<div>
										<button type="submit" id="updateBtn" class="btn btn-primary btn-block">변경</button>
										<button type="button" id="cancelUpdateBtn" class="btn btn-default btn-block" data-dismiss="modal">취소</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div>
	</div>
</div>




<%--
<table>
<tr>
	<td>제목</td>
	<!-- <td><input type="text" name="noticeServiceTitle" id="updateTitle" class="insert" value="${noticeServiceTitle }"></td>-->
<td><input type="text" name="noticeServiceTitle" id="noticeServiceTitle" class="form-control" value="${noticeServiceTitle }"></td>
</tr>
<tr>
	<td>카테고리</td>
	<!-- <td><select name="noticeServiceCategory" id="updateCategory" class="update">-->
	<td><select name="noticeServiceCategory" id="noticeServiceCategory" class="btn btn-primary dropdown-toggle">
			<option value="1" selected="selected">입금/결제</option>
			<option value="2">트레이너 관련 문의</option>
			<option value="3">기타문의</option>
		</select>
	</td>
</tr>
<tr>
	<td>내용</td>
	<!-- <td><textarea name="noticeServiceContent" id="updateContent" class="update" value="${noticeServiceContent }"></textarea></td>-->
<td><textarea name="noticeServiceContent" id="noticeServiceContent" class="form-control" value="${noticeServiceContent }"></textarea></td>
	</tr>
</table>
 --%>
<%--
<script language="JavaScript">
	function noticeRemove(num) {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			location.href = '<c:url value="/faq/remove/"/>${faq.noticeServiceNo}';
		}
	}
	
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
					boardDisplay(page);
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
	
	
	
</script>
	--%>
<script language="JavaScript">
$(document).ready(function() {
	$("#updateBtn").click(function() {
		var noticeServiceNo=$("#updateNum").val();
		var noticeServiceTitle=$("#updateTitle").val();
		var noticeServiceContent=$("#updateContent").val();
		var noticeServiceCategory=$("#updateCategory").val();
		
		if(noticeServiceTitle=="") {
			alert("제목을 입력해 주세요.");
			noticeServiceTitle.focus();
			return false;
		}
		
		if(noticeServiceContent=="") {
			alert("내용을 입력해 주세요.");
			noticeServiceContent.focus();
			return;
		}
		
	});
});

</script>
