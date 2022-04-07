<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container animated fadeInUp">
    <div class="panel panel-default">
    	<div id="login-wrapper">
        	<div class="panel panel-primary">
      			<div class="panel-body">
					<h1>
						<strong>공지사항 작성</strong>
					</h1>
       				<hr>
       				<br>
			        <div class="noticeBody">
			            <form action="<c:url value = "/notice/write"/>" method="post" name="noticeForm" class="form-horizontal" role="form">
			                <input type="hidden" name="noticeServiceSortation" value="1"> 
			                <div class="form-group">
			                    <label class="col-sm-2 control-label">제목</label>
			                    <div class="col-sm-10">
			                        <input type="text" class="form-control" name="noticeServiceTitle" value="${notice.noticeServiceTitle}" placeholder="제목">
			                    </div>
			                </div>
			                <div class="form-group">
			                    <label class="col-sm-2 control-label">내용</label>
			                    <div class="col-sm-10">
			                        <textarea class="noticeFormContent" id="contentCss" name="noticeServiceContent" value="${notice.noticeServiceContent}" placeholder="내용" style="height: 300px;"></textarea>
			                    </div>
			                </div>
			
			                <div class="form-group btnGroup">
		                        <button type="submit" class="btn btn-primary">확인</button>
		                        <button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/notice/list';">목록</button>
			                </div>
			            </form>
    				</div>
    			</div>
    		</div>
    	</div>
	</div>
</div>
    <!--Page Level JS-->
    <script src="<c:url value ="/plugins/bootstrap-wysihtml5/js/wysihtml5-0.3.0.js"/>"></script>
    <script src="<c:url value ="/plugins/bootstrap-wysihtml5/js/bootstrap3-wysihtml5.js"/>"></script>
    <script src="<c:url value ="/plugins/ckeditor/ckeditor.js"/>"></script>
