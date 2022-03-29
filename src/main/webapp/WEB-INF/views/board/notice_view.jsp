<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<br>
<h3>공지사항</h3>
	  
 <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
 	<tr>
 		<td width=100 align=center height="22">gdgdg${notice.noticeServiceNo}</td>
 		<td width=100 align=center height="22">${notice.noticeServiceTitle}</td>
 		<td width=100 align=center height="22">${notice.noticeServiceDate}</td>
 		<td width=100 align=center height="22">${notice.noticeServiceWriter}</td>
 		<td width=100 align=center height="22">${notice.noticeServiceHits}</td>
	</tr>
	<tr>
		<td width=500 style="padding-left:10px;">
			${notice.service.content}
		</td>			
	</tr>
 </table>
  <br>
  <table>
	  <tr>
		<td align=center>
		<input type="button" value="목록" onClick="location.href='<c:url value="/notice/list"/>';"> 
		<c:if test="${loginUserinfo.status==9 }">
		<input type="button" value="수정" onClick="location.href='<c:url value="/notice/modify"/>?noticeServiceNo=${notice.noticeServiceNo }';">
		<input type="button" value="삭제" onClick="noticeRemove('${notice.noticeServiceNo }');">
		</c:if>
			</td>
		  </tr>
	  </table>

<script language="JavaScript">
function noticeRemove(num) {
	if (confirm("정말로 삭제 하시겠습니까?") ) {
		location.href='<c:url value="/notice/remove"/>?num='+num;
	}
}                                                                                                              
</script>
</body>
</html>