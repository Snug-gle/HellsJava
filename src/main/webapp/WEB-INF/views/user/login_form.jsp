<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div>
	<div>
		<div>
			<h1>오늘의 짐</h1>
		</div>
		<div>
			<div>
				<input type="text" placeholder="아이디를 입력해주세요">
				<input type="password" placeholder="비밀번호를 입력해주세요">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="submit">아이디/비밀번호 찾기</button>
				<button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button>
				
			</div>
		</div>
	</div>
</div>

