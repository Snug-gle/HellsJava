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
				<button onclick="location.href='#faq-remove'" data-toggle="modal" data-target="#faq-remove" data-backdrop="static" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/faq/remove"/>/${faq.noticeServiceNo }';">삭제</button>
			</c:if>
		</div>
		
	</div>
</div>








<div class="modal fade" id="faq-remove" role="dialog">
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
						<form role="form" action="" method="post">
							<div id="updateDiv">
								<input type="hidden" name="noticeServiceNo" id="updateNum">
								<table>
									<tr>
										<td>제목</td>
										<td><input type="text" name="noticeServiceTitle" id="updateTitle" class="insert"></td>
									</tr>
									<tr>
										<td>카테고리</td>
										<td><select name="noticeServiceCategory" id="updateCategory" class="update" class="btn btn-primary dropdown-toggle">
												<option value="1" selected="selected">입금/결제</option>
												<option value="2">트레이너 관련 문의</option>
												<option value="3">기타문의</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea name="noticeServiceContent"
												id="updateContent" class="update"></textarea></td>
									</tr>
								</table>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div>
					<button type="button" id="updateBtn" class="btn btn-primary btn-block">변경</button>
					<button type="button" id="cancelUpdateBtn" class="btn btn-default btn-block" data-dismiss="modal">취소</button>
				</div>

			</div>
		</div>
	</div>
</div>





<script language="JavaScript">
	function noticeRemove(num) {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			location.href = '<c:url value="/faq/remove/"/>${faq.noticeServiceNo}';
		}
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
	