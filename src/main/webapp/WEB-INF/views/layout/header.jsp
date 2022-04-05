<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<style type="text/css">
.navbar-wrapper .navbar-default {
    width: 100%;
    border: 0;
    background: #fff;
    display: inline-block;
    position: fixed;
    padding: 15px 0;
    z-index: 1000;
    border-width: 0 0 1px;
}
</style>
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
								<li class="dropdown profile hidden-xs">
									<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										<span class="meta">
										<span class="text" style="font-size: 15px;">${loginUserinfo.memberName }&nbsp;회원님</span>
										<span class="caret"></span>
										</span>
	                   				</a>
									<ul class="dropdown-menu animated fadeInRight" role="menu">
										<li>
										</li>
									    <li>
									    	<c:if test="${loginUserinfo.memberStatus == 9}">
									        	<a href="<c:url value="/admin/userList"/>"><span class="icon"><i class="fa fa-user"></i></span>관리자페이지</a>
									    	</c:if>
									    </li>
									    <li>
									    	<c:if test="${loginUserinfo.memberStatus == 1 or loginUserinfo.memberStatus == 2 or loginUserinfo.memberStatus == 9 }">
									        	<a href="<c:url value="/mypage"/>"><span class="icon"><i class="fa fa-user"></i></span>마이페이지</a>
									   		</c:if>
									    </li>
									    <li>
									    	<c:if test="${loginUserinfo.memberStatus == 3}"><!-- 트레이너 전용 마이페이지 -->
									        	<a href="<c:url value="/user/trainer/trainer_mypage"/>"><span class="icon"><i class="fa fa-user"></i></span>마이페이지</a>
									   		</c:if>
									    </li>
									    <li>
									      <a href="#cache_charge" data-toggle="modal" data-target="#cache_charge" data-backdrop="static"><span class="icon"><i class="icon-wallet"></i></span><span>${loginUserinfo.memberCash }</span>캐쉬</a>
									    </li>
											
									    <li class="divider"></li>
									    <li>
									        <a href="<c:url value="/logout"/>">
									            <span class="icon"><i class="fa fa-sign-out"></i>
									            </span>로그아웃</a>
									    </li>
									</ul>
									
									<!-- 결제 모달창 start -->
									<div class="modal fade" id="cache_charge" role="dialog">
						   					 <div class="modal-dialog" id="modal-dialog">
												<div class="modal-content">
						
													<div class="modal-header">
								                        <div class="logo-location">
															<a href="<c:url value="/"/>" class="modal-header-logo"><i class="icon-layers"></i>오늘의 짐</a>
								                        </div>
													</div>
													<div class="modal-body">
													<div id="login-wrapper">
                    
									                <div class="panel panel-primary">
									                    <div class="panel-heading">
									                          <h3 class="panel-title">     
									                           캐시 충전
									                        </h3>  
									                    </div>
									                    <div class="panel-body">
									                        <form role="form" action="" method="post">
									                            <div class="form-group">
									                                <label for="bankName">은행명</label>
									                                <span class="text">은행명출력</span>
									                            </div>
									                            <div class="form-group">
									                                <label for="accountNumber">계좌번호</label>
									                                <span class="text">계좌번호출력</span>
									                                
									                            </div>
									                             <div class="form-group">
									                                <label for="exampleInputPassword1">충전 금액</label>
									                                <input type="text" class="form-control" id="" name="" placeholder="충전금액을 입력해 주세요">
									                            </div>
									                              <div class="form-group">
									                                <label for="exampleInputPassword1">결제 비밀번호</label>
									                                <input type="password" class="form-control" id="accountPw" name="accountPw" placeholder="결제 비밀번호를 입력해 주세요">
									                            </div>
									                        </form>
									
															</div>
									                	</div>
									                </div>
													</div>
													<div class="modal-footer">
														<div>
															<button type="submit" class="btn btn-primary btn-block">충전</button>
                           									<button type="button" class="btn btn-default btn-block" data-dismiss="modal">닫기</button>
														</div>
														
													</div>
												</div>
											</div>
										</div>	
										<!-- 결제 모달창 end -->		
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