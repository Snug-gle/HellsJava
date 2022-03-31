<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<header class="navbar-wrapper">
        <div id="undefined-sticky-wrapper" class="sticky-wrapper" style="height: 82px;"><div class="navbar navbar-default navbar-static-top home-navbar" role="navigation" style="">
            <div class="container">
                <div class="navbar-header">
                    <!--logo start-->
                    <div class="brand">
                        <a href="<c:url value="/"/>" class="logo"><i class="icon-layers"></i>오늘의 짐</a>
                    </div>
                    <!--logo end-->
                </div>
                <div class="navbar-collapse collapse">
                	<c:choose>
                		<c:when test="${empty(loginUserinfo) }">
		                    <ul class="nav navbar-nav pull-right" id="main-menu">
		                        <li class=""><a href="<c:url value="/user/login/login_form"/>"><i class="icon-login"></i>&nbsp;로그인</a></li>
		                        <li class=""><a href="<c:url value="/user/join_form"/>"><i class="icon-user"></i>&nbsp;회원가입</a></li>
		                    </ul>
						</c:when>
						
						
						<c:otherwise>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown profile hidden-xs open">
									<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
										<span class="meta">
										<span class="text">${loginUserinfo.memberName }&nbsp;회원님</span>
										<span class="caret"></span>
										</span>
	                   				</a>
									<ul class="dropdown-menu animated fadeInRight" role="menu">
										<li>
										</li>
									    <li>
									    	<c:if test="${loginUserinfo.memberStatus == 9}">
									        	<a href=""><span class="icon"><i class="fa fa-user"></i></span>관리자페이지</a>
									    	</c:if>
									    </li>
									    <li>
									    	<c:if test="${loginUserinfo.memberStatus == 1 or loginUserinfo.memberStatus == 9}">
									        	<a href="<c:url value="/mypage"/>"><span class="icon"><i class="fa fa-user"></i></span>마이페이지</a>
									   		</c:if>
									    </li>
									    <li>
									    	<c:if test="${loginUserinfo.memberStatus == 3}"><!-- 트레이너 마이페이지 -->
									        	<a href="<c:url value="/user/trainer/trainer_mypage"/>"><span class="icon"><i class="fa fa-user"></i></span>마이페이지</a>
									   		</c:if>
									    </li>
									    <li>
									      <a href="<c:url value="/user/trainer/trainer_mypage"/>" data-toggle="modal" data-target="#cache_charge" data-backdrop="static"><span class="icon"><i class="icon-wallet"></i></span><span>2000</span>캐쉬</a>
									    </li>
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
									    <li class="divider"></li>
									    <li>
									        <a href="<c:url value="/logout"/>">
									            <span class="icon"><i class="fa fa-sign-out"></i>
									            </span>로그아웃</a>
									    </li>
									</ul>
								</li>
							</ul>
						</c:otherwise>
						
						
						
						
						
                		
                	</c:choose>
                </div>
            </div>
        </div></div>
    </header>
    
    <script type="text/javascript">

    </script> 