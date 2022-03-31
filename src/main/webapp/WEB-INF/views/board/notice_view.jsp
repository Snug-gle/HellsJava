<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.notice-view-title {
	width: 100%;
	font-weight: 400;
    text-transform: uppercase;
    padding: 14px 10px;
    color: #fff;
    background-color: #556b8d;
    border-color: #556b8d;
}

.notice-list-title {
    font-weight: 400;
    text-transform: uppercase;
    padding: 14px 10px;
}

.notice-list-title {
    color: #fff;
    background-color: #556b8d;
    border-color: #556b8d;
}

.notice-list-title {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
}

</style>

<div class="container">
	<div class="notice-list-print">
		<div class="notice-list-title">
			<div style="float: left;">
				<span>${notice.noticeServiceTitle}</span>
			</div>
			<div style="text-align: right;">
				<span>조회수 ${notice.noticeServiceHits} 회</span>
			</div>
		</div>
		
		<%--게시글 내용 출력 --%>
		<div class="panel panel-default">
		    <div class="panel-body" id="restNoticeListDiv" style="height: 400px;">
		    	${notice.noticeServiceContent}
		    </div>
		</div>
		
		<div style="text-align: right;">
			<c:if test="${loginUserinfo.memberStatus==9}">
				<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/notice/modify"/>';">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/notice/remove"/>/${notice.noticeServiceNo }';">삭제</button>
			</c:if>
		</div>
		
	</div>
</div>

<script language="JavaScript">
	function noticeRemove(num) {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			location.href = '<c:url value="/notice/remove/"/>${notice.noticeServiceNo}';
		}
	}
</script>
	