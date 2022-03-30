<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	<div>
		<div>
			<div>
				<a href="<c:url value="/"/>"><h1>오늘의 짐</h1></a>
			</div>
			<div>
				<div>
					<form action="<c:url value="/"/>" method="post">
						<table>
							<tr>
								<td>아이디</td>
								<td>
									<input name="memberId" type="text" placeholder="아이디를 입력해주세요" >
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input name="memberPw" type="password" placeholder="비밀번호를 입력해주세요" >
								</td>
							</tr>
							<tr>
								<td><button type="submit">로그인</button></td>
								<td><button type="button" onclick="location.href='<c:url value="/user/login/id_search"/>';">아이디/비밀번호 찾기</button></td>
							</tr>
							<tr>
								<td><button type="button" onclick="location.href='<c:url value="/user/join_form"/>';">회원가입</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
 -->

<section class="container animated fadeInUp">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div id="login-wrapper">
                    <header>
                        <div class="brand">
                            <a href="<c:url value="/"/>" class="logo"><i class="icon-layers"></i><span>오늘의 짐</span></a>
                        </div>
                    </header>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">     
                           로그인
                        </h3>
                        </div>
                        <div class="panel-body">
                            <form action="<c:url value="/"/>" method="post" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="text" name="memberId" class="form-control" id="memberId" placeholder="아이디를 입력해주세요">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <input type="password" name="memberPw" class="form-control" id="memberPw" placeholder="비밀번호를 입력하세요">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
                                        <hr>
                                        <a href="<c:url value="/user/login/id_search"/>" class="btn btn-default btn-block">아이디/비밀번호 찾기</a>
                                        <a href="<c:url value="/user/join_form"/>" class="btn btn-default btn-block">회원가입</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>