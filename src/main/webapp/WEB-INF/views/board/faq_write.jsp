<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container animated fadeInUp">
    <div class="panel panel-default">
    	<div id="login-wrapper">
        	<div class="panel panel-primary">
      			<div class="panel-body">
					<h1>
						<strong>FAQ 작성</strong>
					</h1>
       				<hr>
       				<br>
		        	<div class="noticeBody">
		            <form action="<c:url value = "/faq/write"/>" method="post" name="faqForm" class="form-horizontal" role="form">
		            	<input type="hidden" name="noticeServiceSortation" value="2">
		                <div class="form-group" >
		                    <label class="col-sm-2 control-label" id="subject">제목</label>
		                    <div class="col-sm-10">
		                        <input type="text" class="form-control" name="noticeServiceTitle" value="${noticeServiceTitle}" placeholder="제목">
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">카테고리</label>
		                       <div class="col-sm-10">
		                           <select class="form-control" id="noticeServiceCategory" name="noticeServiceCategory" >
		                               <option value="1" selected="selected">결제관련문의</option>
		                               <option value="2">트레이너관련문의</option>
		                               <option value="3">기타문의</option>
		                           </select>
		                       </div>
		                </div>
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">내용</label>
		                    <div class="col-sm-10">
		                    	<textarea class="noticeFormContent" style="height: 300px;" id="contentCss" name="noticeServiceContent" value=${notice.noticeServiceContent } placeholder="내용"></textarea>
		                    </div>
		                </div>
		
		                <div class="form-group btnGroup">
	                        <button type="submit" class="btn btn-primary">확인</button>
	                        <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/faq/board"/>';">목록</button>
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

