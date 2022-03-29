<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="posting-detail-content">
		<div class="posting-detail-content-header">
			<div class="posting-detail-content-header-top">
				<div class="posting-barContainer top">
					<div>트레이너</div>
					<div>후기</div>
				</div>
			</div>
			<div class="posting-detail-content-header-low">
				<div class="posting-barContainer low">
					<a href="#posting-detail-frofile">소개</a>
					<a href="#posting-detail-award">자격사항</a>
					<a href="#posting-detail-schedule">스케줄</a>
					<a href="#pposting-detail-program">프로그램</a>
					<a href="#posting-detail-price">이용가격</a>
					<a href="#posting-detail-shop">위치</a>
				</div>
			</div>
		</div>
		<div class="posting-detail-content-body">
			<!-- 선생 소개 -->
			<div class="posting-detail-frofile-top posting-detail-content-panel pdm">
				<div class="panel-list">
					<div class="panel-body profile-wrapper">
				        <div class="col-md-3">
				            <div class="profile-pic text-center">
				                <img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle"> 
				            </div>
				        </div>
				        <div class="col-md-9">
				            <div class="profile-info">
				                <h1>Aaron Adams</h1>
				                <span class="text-muted">UI Designer</span>
				                <p>
				                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
				                </p>
				                <div class="connect">
				                    <button type="button" data-toggle="modal" data-target="#test222" > 1회 PT 신청</button>
				                    <button type="button" > 문의</button>
				                </div>
				                
				            </div>
				        </div>
				    </div>
				</div>
			</div>
			<!-- 선생님 소개 -->
			<div class="posting-detail-frofile-content pdm" id="posting-detail-frofile">
				<div class="frofile-content-title">
					<h4>선생님 소개</h4>
				</div>
				<div class="frofile-content-body posting-detail-content-panel">
					<div class="frofile-content-body-imglist">
						<img alt="" src="">
					</div>
					<div class="frofile-content-body-text">
						<p>테스트다아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</p>
					</div>
				</div>
			</div>
			<!-- 자격 사항 -->
			<div class="posting-detail-award pdm" id="posting-detail-award">
				<div class="frofile-award-title">
					<h4>자격 사항</h4>
				</div>
				<div class="frofile-award-content posting-detail-content-panel">
					<div class="frofile-award-content-body">
						<div class="frofile-award-content-body-img">
							<img alt="" src=""> 
						</div>
						<div class="frofile-award-content-body-title">
							<h5>기타 등등 자격사항</h4>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<!-- PT 스케쥴 -->
			<div class="posting-detail-schedule pdm" id="posting-detail-schedule">
				<div class="frofile-schedule-title">
					<h4>PT 스케줄</h4>
				</div>
				<div class="frofile-schedule-content posting-detail-content-panel">
					<div class="frofile-schedule-content-body">
						<table>
							<tr>
								<td>평일</td>
								<td>시간</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 프로그램 -->
			<div class="posting-detail-program pdm" id="posting-detail-program">
				<div class="frofile-program-title">
					<h4>프로그램</h4>
				</div>
				<div class="frofile-programcontent posting-detail-content-panel">
					<div class="frofile-program-content-body">
						<p>이것도 테스트다아아아아ㅏㅏ아아아아아</p>
					</div>
				</div>
			</div>
			<!-- PT 이용가격 -->
			<div class="posting-detail-price pdm" id="posting-detail-price">
				<div class="posting-price-title">
					<h4>PT 이용 가격</h4>
				</div>
				<div class="posting-price-content posting-detail-content-panel">
					<div class="posting-price-content-body">
						<div class="fposting-price-content-body-num">
							<p>회차다!!!!!</p> 
						</div>
						<div class="posting-price-content-body-text">
							<div class="posting-price-content-body-top">
								<p><span>회당</span>얼마임ㅇ<span>원</span></p>
							</div>
							<div class="posting-price-content-body-low">
								<p>총 그래서 얼마임ㅇ<span>원</span></p>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
			
			<!-- 위치 -->
			<div class="posting-detail-shop pdm" id="posting-detail-shop">
				<div class="posting-shop-title">
					<h4>위치</h4>
				</div>
				<div class="posting-shop-content posting-detail-content-panel">
					<div class="posting-shop-content-body">
						모르겠다 이건 아직
					</div>
				</div>
			</div>
			
			
		</div>
		<div class="posting-detail-content-footer">
			
			<div class="search-review-list-body">
				<div class="search-review-list">
					<div class="review-panel-list">
						<div class="search-review-panel panel-unit">
							<div class="search-review-panel-top">
								<h4>제목</h4>
								<div class="search-review-panel-score">
									<i class="fa fa-heart"></i>
									<label>566</label>
								</div>
								<hr>
							</div>
							<div class="search-review-panel-profile">
								<img alt="" src="">
								<table>
									<tr>
										<td>이름</td>
										<td>날짜</td>
										<td>
											<i class="fa fa-star"></i>
											<i class="fa fa-star-half-o"></i>
											<i class="fa fa-star-o"></i>
										</td>
									</tr>
									<tr>
										<td>1회 체험</td>
									</tr>
								</table>
								<br>
							</div>
							<div class="search-review-panel-text">
								<p>아수라 발발타 아아아아아아아아앙내가 미쳐간다으림나디ㅏ펌닝ㄹㅈ디맨ㅇ래맨ㅇ러ㅐ</p>
							</div>
							<div class="search-review-panel-re">
								<div class="search-review-panel-re-text"></div>
								<div class="search-review-panel-re-btn">
									<button type="button">댓글달기</button>
								</div>
							</div>
							
						</div>
					</div>
				
				</div>
			</div>
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	<div class="modal fade" id="test222" role="dialog" >
		<div class="modal-dialog" id="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1>오늘의 짐</h1>
				</div>
				<div>
					<h2>회원정보</h2>
				</div>
				<div class="modal-body">
		
					<div>
						<form action="" method="post" style="text-align: -webkit-center;">
							<table>
								<tr>
									<td>성별</td>
									<td> 
									 <input type="radio"> <label>남자</label>
									 <input type="radio"> <label>여자</label>
									</td>
								</tr>
								<tr>
									<td>연령대</td>
									<td>
										<select>											
											<option value="10">&nbsp;10&nbsp;</option>
											<option value="20" selected="selected">&nbsp;20&nbsp;</option>
											<option value="30">&nbsp;30&nbsp;</option>
											<option value="40">&nbsp;40&nbsp;</option>
											<option value="50">&nbsp;50&nbsp;</option>
											<option value="60">&nbsp;60&nbsp;</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>운동 목적</td>
									<td>
										<select>											
											<option value="10">몰라요</option>
											<option value="20" selected="selected">다이어트</option>
											<option value="30">뭐</option>
											<option value="40">눈이</option>
											<option value="50">멍하다</option>
											<option value="60">멍</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>운동 경험 여부</td>
									<td>
										<select>											
											<option value="10">예</option>
											<option value="20" selected="selected">아니요</option>
									</td>
								</tr>
							
								<tr>
									<td>특이사항</td>
								</tr>
							</table>
								<textarea rows="" cols=""></textarea>
							<table>
								<tr>
									<td>결제정보</td>
								</tr>
								<tr>
									<td>결제금액</td>
									<td>10000</td>
								</tr>
								<tr>
									<td>결제 비밀번호</td>
									<td><input type="text"></td>
								</tr>
								
								
							</table>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<div>
						<button type="submit">결제</button>
						<button type="button" class="close" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
	</script>
	
	
	
	
	
	
</body>
</html>