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
 		<td width=100 align=center height="22">${notice.service.no }</td>
 		<td width=100 align=center height="22">${notice.service.title }</td>
 		<td width=100 align=center height="22">${notice.service.date }</td>
 		<td width=100 align=center height="22">${notice.service.writer }</td>
 		<td width=100 align=center height="22">${notice.service.hits }</td>
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
		<input type="button" value="수정" onClick="location.href='<c:url value="/notice/modify"/>?notice.service.no=${notice.service.no }';">
		<input type="button" value="삭제" onClick="noticeRemove('${notice.service.no }');">
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