<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<style type="text/css">
.main-search {
    border: 2px solid #e8ebed;
    border-radius: 2px;
    box-shadow: none;
    height: 37px;
    padding: 8px 12px 9px 12px;
}
.main-search {
    width: 30%;
    height: 42px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

#pricing {
    padding: 75px 0;
}
#pricing .spacer {
    height: 2px;
    width: 80px;
    margin: 20px auto;
    background: #556b8d;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}

#pricing #pricePlans {
    margin: 2em auto;
}

#trainer-content {
	width: 30%;
}

#trainer-review-content {
	width: 30%;
}

.review-trainer-name {
	color: #556b8d;
	font-weight: bold; 
}
</style>
<div class="main-banner-image">
	<img class="main-banner-image_01" src="<spring:url value="/img/vac-4.jpg"/>">
</div>

<div class="main-banner-image-contorller">
	<button type="button" class="fa fa-chevron-left main-contorller image-contorller-left"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-circle main-contorller image-contorller-circle"></button>
	<button type="button" class="fa fa-chevron-right main-contorller image-contorller-right"></button>
</div>
<form action="<spring:url value="/content/search"/>" method="post">
	<div class="main-search-area">
		<select name="searchKeyword" class="btn btn-primary dropdown-toggle">
			<option value="member_name" selected="selected">트레이너명</option>
			<option value="trainer_centername">센터명</option>
			<option value="trainer_address">센터 주소(동)</option>
		</select>
		<!-- <input class="main-search" class="form-control" placeholder="트레이너명/지역/헬스장 이름" name ="searchValue"> -->
		<input class="main-search" placeholder="트레이너명/지역/헬스장 이름" name ="searchValue">
		<button type="submit" class="fa fa-search main-contorller"></button>
	</div>
</form>
<section id="pricing">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
                 <header>
                     <h1>이달의 트레이너</h1>
                     <div class="spacer"></div>
                     <br>
                 </header>
             </div>
		</div>
		<div class="panel panel-primary" id="trainer-content" style="float: left;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					트레이너명
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;">
				<form class="form-horizontal" role="form">
					<div class="profile-pic text-center">
						<img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle">
					</div>
					<!-- <span class="text-muted">소속센터명</span> -->
					<div class="form-group">
						<p>트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명</p>
					</div>
				 </form>
			</div>
		</div>
		<div class="panel panel-primary" id="trainer-content" style="float: left; margin: 0px 5%;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					트레이너명
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;">
				<form class="form-horizontal" role="form">
					<div class="profile-pic text-center">
						<img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle">
					</div>
					<!-- <span class="text-muted">소속센터명</span> -->
					<div class="form-group">
						<p>트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명</p>
					</div>
				 </form>
			</div>
		</div>
		<div class="panel panel-primary" id="trainer-content" style="float: left;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					트레이너명
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;">
				<form class="form-horizontal" role="form">
					<div class="profile-pic text-center">
						<img src="<spring:url value="/img/avatar2.png"/>" alt="" class="img-circle">
					</div>
					<!-- <span class="text-muted">소속센터명</span> -->
					<div class="form-group">
						<p>트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명트레이너설명</p>
					</div>
				 </form>
			</div>
		</div>
	</div>
</section>
<section id="pricing">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
                 <header>
                     <h1>많이 도움된 리뷰</h1>
                     <div class="spacer"></div>
                     <br>
                 </header>
             </div>
		</div>
		<div class="panel panel-primary" id="trainer-review-content" style="float: left;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					ㅇㅇㅇ 회원님
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<p>좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요</p>
					</div>
					<span class="review-trainer-name">ㅇㅇㅇ 트레이너</span>
					<div class="main-review-panel-score">
						<i type="button" class="fa fa-heart"></i>
						<label>566</label>
						<i class="fa fa-star"></i>
						<i type="button" class="fa fa-star-half-o"></i>
						<i type="button" class="fa fa-star-o"></i>
					</div>
				 </form>
			</div>
		</div>
		<div class="panel panel-primary" id="trainer-review-content" style="float: left; margin: 0px 5%;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					ㅇㅇㅇ 회원님
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;" >
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<p>좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요</p>
					</div>
					<span class="review-trainer-name">ㅇㅇㅇ 트레이너</span>
					<div class="main-review-panel-score">
						<i type="button" class="fa fa-heart"></i>
						<label>566</label>
						<i class="fa fa-star"></i>
						<i type="button" class="fa fa-star-half-o"></i>
						<i type="button" class="fa fa-star-o"></i>
					</div>
				 </form>
			</div>
		</div>
		<div class="panel panel-primary" id="trainer-review-content" style="float: left;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					ㅇㅇㅇ 회원님
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<p>좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요</p>
					</div>
					<span class="review-trainer-name">ㅇㅇㅇ 트레이너</span>
					<div class="main-review-panel-score">
						<i type="button" class="fa fa-heart"></i>
						<label>566</label>
						<i class="fa fa-star"></i>
						<i type="button" class="fa fa-star-half-o"></i>
						<i type="button" class="fa fa-star-o"></i>
					</div>
				 </form>
			</div>
		</div>
	</div>
</section>