<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">공지사항 수정</h3>
        </div>
        <div class="panel-body">
            <form method="post" name="noticeForm" class="form-horizontal" role="form">
               	
               	<input type="hidden" name="noticeServiceStatus" value="0">
               	<input type="hidden" name="noticeServiceCategory" value="${notice.noticeServiceCategory}">
                <div class="form-group">
                    <label class="col-sm-2 control-label">제목</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" value="${notice.noticeServiceTitle}" placeholder="제목">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">내용</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="content" placeholder="내용">${notice.noticeServiceContent}</textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">확인</button>
                        <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/notice/list';">목록</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>

</body>
</html>