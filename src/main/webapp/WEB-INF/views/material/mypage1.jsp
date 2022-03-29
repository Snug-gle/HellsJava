<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<body>
	<section id="main-wrapper" class="theme-default">
	<!--sidebar left start-->
        <aside class="sidebar sidebar-left">
              <h5 class="sidebar-header" style="font-size: 40px;">My Page</h5>
              <br>
            <!-- 내정보 -->
            <div class="sidebar-profile">
                <div class="avatar">
                    <img class="img-circle profile-image" src="<c:url value="/img/profile.jpg"/>" alt="profile">
                    <i class="on border-dark animated bounceIn"></i>
                </div>
                <div class="profile-body dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><h4>Mike Adams <span class="caret"></span></h4></a>
                    <small class="title">Front-end Developer</small>
                    <%-- 토글 메뉴 --%>
                    <ul class="dropdown-menu animated fadeInRight" role="menu">
                        <li class="profile-progress">
                            <h5>
                                <span>80%</span>
                                <small>Profile complete</small>
                            </h5>
                            <div class="progress progress-xs">
                                <div class="progress-bar progress-bar-primary" style="width: 80%">
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-user"></i>
                                </span>My Account</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-envelope"></i>
                                </span>Messages</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-cog"></i>
                                </span>Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-sign-out"></i>
                                </span>Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
            <nav>
                <ul class="nav nav-pills nav-stacked">               
                    <li class="nav-dropdown  open active">
                        <a href="#" title="Forms">
                            <i class="fa  fa-fw fa-edit"></i> 내 정보 수정
                        </a>
                        <ul class="nav-sub">
                            <li class="active"><a href="forms-components.html" title="Components">내 정보 수정</a>
                            </li>
                            <li><a href="forms-validation.html" title="Validation">Validation</a>
                            </li>
                            <li><a href="forms-mask.html" title="Mask">Mask</a>
                            </li>
                            <li><a href="forms-wizard.html" title="Wizard">Wizard</a>
                            </li>
                            <li><a href="forms-multiple-file.html" title="Multiple File Upload">Multiple File Upload</a>
                            </li>
                            <li><a href="forms-wysiwyg.html" title="WYSIWYG Editor">WYSIWYG Editor</a>
                            </li>
                        </ul>
                    </li>                   
                    <li class="nav-dropdown">
                        <a href="#" title="Mail">
                            <i class="fa fa-fw fa-envelope-o"></i> Mail
                            <span class="label label-primary label-circle pull-right">8</span>
                        </a>
                        <ul class="nav-sub">
                            <li>
                                <a href="mail-inbox.html" title="Mail Inbox">
                                    Inbox
                                </a>
                            </li>
                            <li>
                                <a href="mail-compose.html" title="Mail Compose">
                                     Compose Mail
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-dropdown">
                        <a href="#" title="Maps">
                            <i class="fa  fa-fw fa-map-marker"></i> Maps
                        </a>
                        <ul class="nav-sub">
                            <li>
                                <a href="maps-google.html" title="Google Maps">
                                     Google Maps
                                </a>
                            </li>
                            <li>
                                <a href="maps-vector.html" title="Vector Maps">
                                     Vector Maps
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../Frontend/" title="Frontend">
                            <i class="fa  fa-fw fa-desktop"></i> Front-end Theme
                            <span class="pull-right badge badge-danger">new</span>
                        </a>
                    </li>
                </ul>
            </nav>
          
        </aside>
        <!--sidebar left end-->
	<section class="main-content-wrapper">
		<strong>마이페이지</strong>
		<section id="main-content" class="animated fadeInUp">
			<div>
				<h2><a href="<c:url value = "member/modify" />">회원정보수정</a></h2>
				<img alt="" src="">
			</div>
			<div>
				<h2>내 리뷰 관리</h2>
				<ul>
					<li></li>
				</ul>
			</div>
			<div>
				<h2>1:1 문의 내역</h2>
				<ul>
					<li></li>
				</ul>
			</div>
			<div>
				<h2>계좌 관리</h2>
				<ul>
					<li></li>
				</ul>
			</div>
			<div>
				<h2>1회 PT 신청 내역</h2>
				<ul>
					<li></li>
				</ul>
			</div>
			<div>
				<h2>PT 문의 내역</h2>
				<ul>
					<li></li>
				</ul>
			</div>
			<div>
				<h2>트레이너 신청 내역</h2>
				<ul>
					<li></li>
				</ul>
			</div>
		</section>
	</section>
	</section>

</body>
</html>
