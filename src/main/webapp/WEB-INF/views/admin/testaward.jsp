<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<c:forEach var="awardList" items="${List}" varStatus="status">
	<div class="trainerDetailView">
		<img class="trainer-detail-profile" alt="" src="<spring:url value="/awardImages/${awardList.awardImage}"/>">
	</div>
	<div class="ad-t-v-header-info trainerDetailView">
		<p>${awardList.awardContent}</p>
	</div> 
</c:forEach>