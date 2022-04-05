<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<div class="container">

	<div class="notice-list-print">
		<div class="notice-list-title">
			<h3 class="panel-title">
				<strong>1회 PT 신청 내역 목록(회원)</strong>
			</h3>
		</div>


		<%--게시글 목록 출력 --%>
		<div class="panel-group accordion" id="accordion">

			<div class="panel panel-default">

				<div class="panel-heading">

					<div class="panel-title">

						<div class="panel-body" id="restNoticeListDiv"></div>
					</div>
				</div>
			</div>

			<%-- 페이지 번호 출력 --%>
			<div class="panel panel-default">
				<div class="panel-body" id="pageNumDiv"></div>
			</div>

		</div>
	</div>
	<%-- handlebars 템플릿 코드 작성 >> HTML --%>
	<%-- => {{#each}} 표현식을 사용하여 Array 객체에 대한 반복 처리 --%>
	<%-- => {{propertyName}} 표현식을 사용하여 Object 객체의 속성값 표현 --%>
	<script id="template" type="text/x-handlebars-template">
	<div class="panel-body" style="display: block;">
		
		{{#each .}}
			
				


								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false"> {{ptOnceNo }}</a>
								<a data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									{{ptOnceApplicationDate }}</a> <a data-toggle="collapse"
									data-parent="#accordion" href="#" class="collapsed"
									aria-expanded="false"> {{trainerNo }}</a> <a
									data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false">
									{{ptOnce.ptOnceStatus }}</a> <a data-toggle="collapse"
									data-parent="#accordion" href="{{ptOnceNo }}"
									class="collapsed" aria-expanded="false"> 상세보기</a> <a
									data-toggle="collapse" data-parent="#accordion" href="#"
									class="collapsed" aria-expanded="false"> 리뷰쓰기</a>

							</div>
							<div id="{{ptOnceNo }}" class="panel-collapse collapse"
								aria-expanded="false" style="height: 0px;">

								<!-- 성별, 연령, 운동경험, 운동목적 , 특이사항  -->
								<div class="panel-body">성별 : {{ptOnceGender}</div>
								<div class="panel-body">연령 : {{ptOnceAge}}</div>
								<div class="panel-body">운동경험 : {{ptOnceExperience}}
								</div>
								<div class="panel-body">
									운동목적 :{{ptOncePurpose}}<br>
								</div>
								<div class="panel-body">
									특이사항
									:{{ptOnceSignificant }}
								</div>
								<div class="panel-body">
									(확인용) 회원번호
									:{{ptOnceNo }}
								</div>

							</div>

						
			
		{{/each}}	
		</div>
	</script>

	<script type="text/javascript">
		var page = 1; //현재 요청 페이지 번호를 저장하기 위한 전역 변수
		boardDisplay(page);

		/* 게시글 목록을 검색하여 JSON 텍스트로 응답하는 웹프로그램을 AJAX로 요청하여 처리하는 함수 */
		function boardDisplay(pageNum) {
			page = pageNum;
			$.ajax({
				type : "get",
				url : "list2?pageNum=" + pageNum,
				dataType : "json",
				success : function(json) {
					if (json.ptOnceList.length == 0) {
						$("#restNoticeListDiv").html("검색된 게시글이 존재하지 않습니다.");
						return;
					}

					//응답된 게시글 목록을 HTML로 변환하도록 Handlebars 자바스크립트 라이브러리 이용
					var source = $("#template").html();//템플릿 코드를 반환받아 저장

					//템플릿 코드를 전달받아 템플릿 객체로 생성하여 저장
					var template = Handlebars.compile(source);

					//템플릿 객체에 JavaScript 객체(게시글 목록)를 전달하여 HTML 태그로 변환하여 출력
					$("#restNoticeListDiv").html(template(json.ptOnceList));

					//페이지 번호를 출력하는 함수 호출
					pagerDisplay(json.pager);

				},
				error : function(xhr) {
					alert("에러코드 = " + xhr.status);
				}
			});
		}

		/* 페이지 번호를 출력하는 함수 */
		function pagerDisplay(pager) {
			var html = "";

			if (pager.startPage > pager.blockSize) {
				html += "<a href='javascript:boardDisplay(1);'>[처음]</a>";
				html += "<a href='javascript:boardDisplay(" + pager.prevPage
						+ ");'>[이전]</a>";
			} else {
				html += "[처음][이전]";
			}

			for (i = pager.startPage; i <= pager.endPage; i++) {
				if (pager.pageNum != i) {
					html += "<a href='javascript:boardDisplay(" + i + ");'>["
							+ i + "]</a>";
				} else {
					html += "[" + i + "]";
				}
			}

			if (pager.endPage != pager.totalPage) {
				html += "<a href='javascript:boardDisplay(" + pager.nextPage
						+ ");'>[다음]</a>";
				html += "<a href='javascript:boardDisplay(" + pager.totalPage
						+ ");'>[마지막]</a>";
			} else {
				html += "[다음][마지막]";
			}

			$("#pageNumDiv").html(html);
		}
	</script>