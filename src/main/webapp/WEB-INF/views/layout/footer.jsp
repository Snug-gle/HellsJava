<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer class="navbar-wrapper">
	 <div id="undefined-sticky-wrapper " class="bottomContent">
        <div class="container">
				<div>
					<div>
						<ul class="nav navbar-nav pull-right" id="main-menu">
							<li class=""><a href="<c:url value="/notice/list"/>">공지사항</a></li>
							<li class=""><a href="<c:url value="/faq/list"/>">FAQ</a></li>
							<li class=""><a href="<c:url value="/oOo/list"/>">1:1문의</a></li>
						</ul>
					</div>
					<br>
					<br>
					<div>
						<!-- <span>CS CENTER :</span> -->
					</div>
					<br>
					<br>
					<div style="font-size: x-large; text-align: right;">
						<span><i class=" icon-call-end"></i><strong>&nbsp;010-0000-0000</strong></span>
					</div>
					<div class="footer-content" style="font-size: small;">
						<span>평일 10 : 00 - 19 : 00</span>
						<br>
						<span>토,일,공휴일 휴무</span>
						<br>
						<br>
						<span>(주)헬'스자바</span>
						<br>
						<span>대표 : 김김김</span>
						<br>
						<span>사업자등록번호: [000-00-00000]<a href="">&nbsp;[사업자정보확인]</a></span>
						<br>
						<span>주소 : 서울특별시 강남구 테헤란로 124 4층</span>
						<br>
						<br>
						<br>
						<span><strong><a href="">Hell's JAVA</a></strong> FINAL PROJECT 오늘의 짐</span>
					</div>
						<br>
				</div>
			<!--Global JS-->
				<script src="<c:url value="/js/vendor/jquery-1.11.1.min.js"/>"></script>
				<script src="<c:url value="/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
			  	<script src="<c:url value="/plugins/navgoco/jquery.navgoco.min.js"/>"></script>
			  	<script src="<c:url value="/plugins/switchery/switchery.min.js"/>"></script>
			  	<script src="<c:url value="/plugins/pace/pace.min.js"/>"></script>
			  	<script src="<c:url value="/plugins/fullscreen/jquery.fullscreen-min.js"/>"></script>
			  	<script src="<c:url value="/js/src/app.js"/>"></script>
		</div>
	</div>
</footer>