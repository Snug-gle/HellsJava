<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="pd-insert-centent" >
	<div class="pd-insert-header">
		<div class="pd-insert-header-title">
			<h2>트레이너 포스팅 작성</h2>
			<hr>
		</div>
		<div class="pd-insert-header-info">
			<table>
				<tr>
					<td>이름</td>
					<td>김남영</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>01011112222</td>
				</tr>
				<tr>
					<td>소속 센터 주소</td>
					<td>불러오니라</td>
				</tr>
			</table>
			<br>
		</div>
		<div class="pd-insert-header-award-title">
			<h3>수상경력 및 이력</h3>
			<hr>
		</div>
		<div class="pd-insert-header-award-content">
			<div class="pd-insert-header-award-body">
				<table>
					<tr>
						<td> <img alt="" src="<spring:url value="/img/avatar2.png"/>"></td>
						<td>수상이력 불러오니라</td>
					</tr>	
				</table>
			</div>
			<hr>
		</div>
	</div>
	<div class="pd-insert-body">
		<form action="">
		<div class="pd-insert-body-myprofile">
			<div class="pd-insert-body-myprofile-top">
				<h3>자기 소개</h3>
				<textarea rows="" cols=""></textarea>
			</div>
			<div class="pd-insert-body-myprofile-body">
				<h5>뭐야 이거 어케 해요 ㅠㅠ</h5>
				<button type="button">첨부</button>
			</div>
		</div>
		<div class="pd-insert-body-profile">
			<br>
			<hr>
			<h3>프로그램 소개</h3>
			<textarea rows="" cols=""></textarea>
		</div>
		<div class="pd-insert-body-pt-schedule">
			<br>
			<div class="pd-insert-body-pt-schedule-top">
				<h3>PT 스케줄</h3>
				<hr>
			</div>
			<div class="pd-insert-body-pt-schedule-body">
				<table>
					<c:forEach var="j" begin="1" end="3">
						<tr>
							<td><input type="checkbox" class="cb${j}"></td>
							<c:if test="${j eq 1}">
								<td>평일</td>
							</c:if>
							<c:if test="${j eq 2}">
								<td>토요일</td>
							</c:if>
							<c:if test="${j eq 3}">
								<td>휴무일</td>
							</c:if>
							<td>
								<select>
									<option value="6" selected>6</option>
									<c:forEach var="i" begin="7" end="23">
									   <option value="<c:out value="${i}"/>"><c:out value="${i}" /></option>
									</c:forEach>
								</select>
							</td>
							<td>
								<select>
									<option value="00" selected>00</option>
									<option value="30">30</option>
								</select>
							</td>
							<td>~</td>
							<td>
								<select>
									<option value="6" selected>6</option>
									<c:forEach var="i" begin="7" end="23">
									   <option value="<c:out value="${i}"/>"><c:out value="${i}" /></option>
									</c:forEach>
								</select>
							</td>
							<td>
								<select>
									<option value="00" selected>00</option>
									<option value="30">30</option>
								</select>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><input type="checkbox" class="cb4"></td>
						<td>휴무일</td>
						<td><input type="text"></td>	
					</tr>		
				</table>
			</div>
		</div>

		<div class="pd-insert-body-pt-price">
			<br>
			<div class="pd-insert-body-pt-price-top">
				<h3>PT 이용가격</h3>
				<button>+</button>
				<hr>
			</div>
			<div class="pd-insert-body-pt-price-body">\
				<table>
					<tr>
						<td><input type="text" placeholder="PT 회차수"></td>
						<td><input type="text" placeholder="회당 가격"></td>
						<td><p>총 가격=</p></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	</div>
	<div class="pd-insert-footer">
		<button type="submit">확인</button>
		<button type="reset">다시쓰기</button>
	</div>
</div>

</body>
</html>