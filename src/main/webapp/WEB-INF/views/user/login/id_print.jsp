<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                           아이디 찾기 결과
                        </h3>
                        </div>
                        <div class="panel-body">
                        <br>
                        <p style="font-size: 30px; text-align: center;"> 아이디는 ${id}입니다.</p>
                        <br>
                                    <div class="col-md-12">
                                        <hr>
                                        <a href="<c:url value="/user/login/login_form"/>" class="btn btn-primary btn-block">로그인하기</a>
                                        <a href="<c:url value="/"/>" class="btn btn-default btn-block">메인으로</a>
                                    </div>
                                </div>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
                        			