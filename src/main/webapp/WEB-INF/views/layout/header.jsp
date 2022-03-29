<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<div class="heard-banner">
	<div class="main-title">
		<a class="title_01" href="<c:url value="/"/>">오늘의 짐</a>
	</div>
	<div class="main-top-banner" >
		<c:choose>
		  	<c:when test="${empty(loginUserinfo) }">
		  		<div class="main-top-btn login" >
					<button type="button" onclick="location.href='<c:url value="/user/login/login_form"/>';">로그인</button>
				</div>
				<div class="main-top-btn join" >
					<button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${loginUserinfo.memberStatus == 9}">
					<div class="main-top-btn admin" >
						<button type="button" >관리자 페이지</button>
					</div>
				</c:if>
				<div class="main-top-btn logout" >
					<button type="button" onclick="location.href='<c:url value="/logout"/>';" >로그아웃</button>
				</div>
				<div class="main-top-btn mypage" >
					<c:if test="${loginUserinfo.memberStatus == 1 or loginUserinfo.memberStatus == 9}">
						<button type="button" >마이페이지</button>
					</c:if>
					<c:if test="${loginUserinfo.memberStatus == 3}">
						<button type="button" onclick="location.href='<c:url value="/user/trainer/trainer_mypage"/>';" >마이페이지</button><!-- 트레이너 -->
					</c:if>
				</div>
				
				<div class="main-top-btn cache" >
					<p>2000<span>캐쉬</span></p>
				</div>
				<div class="main-top-btn cache" >
					<button type="button" data-toggle="modal" data-target="#cache_charge" data-backdrop="static">충전</button>
				</div>
				
				<div class="modal fade" id="cache_charge" role="dialog" >
   					 <div class="modal-dialog" id="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<h1 onclick="location.href='<c:url value="/"/>';">오늘의 짐</h1>
							</div>
							<div class="modal-body">
								<div>
									<h2>충전</h2>
								</div>
								<div>
									<form action="" method="post">
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
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<div>
									<button type="submit">충전</button>
									<button type="button" class="close" data-dismiss="modal">닫기</button>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				
			</c:otherwise>
		</c:choose>
	</div>
</div>
<hr>
<script type="text/javascript">

</script>

