<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- tiles 관련 태그를 제공하는 태그 라이브러리 포함 --%>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>Hell's Java</title>
<!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value="/img/favicon.ico"/>" type="image/x-icon">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="<c:url value="/plugins/bootstrap/css/bootstrap.min.css"/>">
    <!-- Fonts  -->
    <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/simple-line-icons.css"/>">
    <!-- Fonts from Font Awsome -->
    <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
    <!-- Switchery -->
    <link rel="stylesheet" href="<c:url value="/plugins/switchery/switchery.min.css"/>">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <!-- Feature detection -->
    <script src="<c:url value="/js/vendor/modernizr-2.6.2.min.js"/>"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/vendor/html5shiv.js"></script>
    <script src="assets/js/vendor/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="header">
		<%-- insertAttribute 태그 : Tiles Configuration File의 put-attribute 엘리먼트로 설정한 
		JSP 문서의 실행결과를 삽입하는 태그 --%>
		<%-- name 속성 : put-attribute 엘리먼트의 식별자를 속성값으로 설정 --%>
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>