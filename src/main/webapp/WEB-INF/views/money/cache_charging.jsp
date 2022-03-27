<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div>
			<div>
				<h1 onclick="location.href='<c:url value="/"/>';">오늘의 짐</h1>
			</div>
			<div>
				<div>
					<h2>충전</h2>
				</div>
				<div>
					<table>
						<tr>
							<td>은행</td>
						</tr>
						<tr>
							<td>계좌번호</td>
						</tr>
						<tr>
							<td>충전 금액</td>
							<td>
								<input type="text" placeholder="충전금액을 입력해주세요">
							</td>
						</tr>
						<tr>
							<td>결제 비밀번호</td>
							<td>
								<input type="text" placeholder="결제 비밀번호를 입력해주세요">
							</td>
						</tr>
						
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>