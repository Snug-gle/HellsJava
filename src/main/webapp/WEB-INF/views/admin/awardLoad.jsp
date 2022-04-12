<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:forEach var="awardList" items="${List}" varStatus="status">
	<div class="trainerDetailView">
		<img class="trainer-detail-profile" style="display: inline-block; width: 60px; height: 60px; margin-left: 10px;" alt="" src="<spring:url value="/awardImages/${awardList.awardImage}"/>"> 
		<label class="award-label">${awardList.awardContent}</label>
	</div>
</c:forEach>