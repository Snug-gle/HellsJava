<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  


	<div class="main-banner-image">
		<div id="imgcontainer">
			<div class="itemsImg">
				<div class="imgItem activeMainImg"><img class="main-banner-image_01" src="<spring:url value="/img/vac-1.jpg"/>"></div>
				<div class="imgItem"><img class="main-banner-image_02" src="<spring:url value="/img/vac-2.jpg"/>"></div>
				<div class="imgItem"><img class="main-banner-image_03" src="<spring:url value="/img/vac-3.jpg"/>"></div>
				<div class="imgItem"><img class="main-banner-image_04" src="<spring:url value="/img/vac-4.jpg"/>"></div>
			</div>
			
		</div>
	</div>

	<div class="main-banner-image-contorller">
		<button type="button" class="fa fa-chevron-left main-contorller image-contorller-left prev"></button>
		<button type="button" class="fa fa-circle main-contorller image-contorller-circle step active-step" value="0" onclick="cicleclick(this)"></button>
		<button type="button" class="fa fa-circle main-contorller image-contorller-circle step" value="1" onclick="cicleclick(this)"></button>
		<button type="button" class="fa fa-circle main-contorller image-contorller-circle step" value="2" onclick="cicleclick(this)"></button>
		<button type="button" class="fa fa-circle main-contorller image-contorller-circle step" value="3" onclick="cicleclick(this)"></button>
		<button type="button" class="fa fa-chevron-right main-contorller image-contorller-right next"></button>
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
                     <h1 class="main-h1">이달의 트레이너</h1>
                     <div class="spacer"></div>
                     <br>
                 </header>
             </div>
		</div>		
		<c:forEach var="i" begin="1" step="1" end="3">
			<div class="panel panel-primary" id="trainer-content" style="float: left; <c:if test='${i == 2 }'>margin: 0px 5%;</c:if>" onclick="location='<c:url value="/content/posting_detail"/>'">${trinerInfo.memberNo }
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center;">     
						${trinerInfo.memberName }<%--트레이너 이름 --%>
					</h3>
				</div>
				<div class="panel-body" style="text-align: center;">
					<form class="form-horizontal" role="form">
						<div class="profile-pic text-center">
							<img src="<spring:url value="/img/${trinerInfo.trainerProfileImg }"/>" alt="" class="img-circle">
						</div>
						<!-- <span class="text-muted">소속센터명</span> -->
						<div class="form-group">
							<p>${postingInfo.memberName.postingSelfIntroduction }</p>
						</div>
					 </form>
				</div>
			</div>
		</c:forEach>
	</div>

</section>
<section id="pricing">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
                 <header>
                     <h1 class="main-h1">많이 도움된 리뷰</h1>
                     <div class="spacer"></div>
                     <br>
                 </header>
             </div>
		</div>
		<div class="panel panel-primary" id="trainer-review-content" style="float: left;">
			<div class="panel-heading">
				<h3 class="panel-title" style="text-align: center;">     
					${ptserviceInfo.memberName }
				</h3>
			</div>
			<div class="panel-body" style="text-align: center;">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<p>좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요좋아요</p>
					</div>
					<span class="review-trainer-name" onclick="location='<c:url value="/content/posting_detail"/>'">ㅇㅇㅇ 트레이너</span>
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
					<span class="review-trainer-name" onclick="location='<c:url value="/content/posting_detail"/>'">ㅇㅇㅇ 트레이너</span>
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
					<span class="review-trainer-name" onclick="location='<c:url value="/content/posting_detail"/>'">ㅇㅇㅇ 트레이너</span>
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

<script type="text/javascript">

	let curPos = 0; // 현재 보이는 요소의 인덱스 번호
	
	function prev(){
	    if(curPos > 0){
	        $("button").removeAttr("disabled") // 모든 버튼 사용할 수 있게!
	        // toggleClass : 클래스가 있으면 제거, 없으면 생성!
	        $($(".imgItem")[curPos]).toggleClass("activeMainImg")
	        $($(".step")[curPos]).toggleClass("active-step")
	        $(".imgItem").hide();
	        curPos -= 1 *1;
	        $($(".imgItem")[curPos]).toggleClass("activeMainImg")
	        $($(".step")[curPos]).toggleClass("active-step")
	        $(".activeMainImg").fadeIn(800); // 새로운 액티브 요소만 스르륵 나타난다
	    };
	    if(curPos == 0){
	        $(".prev")[0].setAttribute("disabled",'true')
	    };
	};
	function next(){
	    if(curPos < 3){
	        $("button").removeAttr("disabled")
	        $($(".imgItem")[curPos]).toggleClass("activeMainImg")
	        $($(".step")[curPos]).toggleClass("active-step")
	        $(".imgItem").hide();
	     	curPos += 1;
	        $($(".imgItem")[curPos]).toggleClass("activeMainImg")
	        $($(".step")[curPos]).toggleClass("active-step")
	        $(".activeMainImg").fadeIn(800); 
	    };
	    if(curPos == 3){
	        $(".next")[0].setAttribute("disabled",'true')
	    };
	};
	function init(){
	    $(".imgItem").hide()
	    $(".activeMainImg").show()
	    $(".prev").click(prev)
	    $(".next").click(next)
	    $(".step").click(cicleclick(this))
	};
	$(document).ready(function(){
	
	    init();
	});
	
	function cicleclick(ths){
		let curPos2 = 0;
		curPos2 = $(ths).val();
		$("button").removeAttr("disabled")
        $($(".imgItem")[curPos]).toggleClass("activeMainImg")
        $($(".step")[curPos]).toggleClass("active-step")
        $(".imgItem").hide();
		curPos = curPos2;
		curPos = curPos * 1;//스트링 변환을 막기위한 곱셈
        $($(".imgItem")[curPos2]).toggleClass("activeMainImg")
        $($(".step")[curPos2]).toggleClass("active-step")
        $(".activeMainImg").fadeIn(800); 
	}
</script>