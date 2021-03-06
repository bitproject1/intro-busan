<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div class="container">
			<!-- Image Slider -->
			<div class="slider">
				<ul class="slides">
					<li><img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F992E48365D08D7BA36">
						<div class="caption right-align">
							<h2>감천문화마을</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">한국의
								마추픽추 감천문화마을</h5>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								<a href="/hotspot/detail?id=365">맛집 정보 보러가기</a>
							</h5>
						</div></li>
					<li><img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99606C385D08D9830B">
						<div class="caption left-align">
							<h2>광안리</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">광안리의
								밤은 당신의 낮보다 아름답다</h5>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								<a href="/hotspot/detail?id=377">맛집 정보 보러가기</a>
							</h5>
						</div></li>
					<li><img
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99E63F3D5D08D80C1B">
						<div class="caption right-align">
							<h2>용두산공원</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">부산여행의
								이유 용두산공원</h5>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								<a href="/hotspot/detail?id=368">맛집 정보 보러가기</a>
							</h5>
						</div></li>
				</ul>
			</div>
			<!-- end of Image Slider -->

			<!-- AutoComplete -->
			<div id="search" class="cyan white-text center">
				<div class="row">
					<div class="col s12">
						<h5>검색</h5>
						<div class="input-field">
							<i id="" class="material-icons prefix">location_on</i> <input
								type="text" class="white grey-text autocomplete"
								id="autocomplete-input" placeholder="드라스덴, 파리, 프라하, ...">
						</div>
					</div>
				</div>
			</div>
			<!-- end of AutoComplete -->
		</div>

		<!-- end of Container -->


		<!-- Container -->
		<div class="container">

			<%--<a href="/board/write?pageNum=${ pageMaker.cri.pageNum }" class="waves-effect waves-light btn right">
						<i class="material-icons left">create</i>새글쓰기
				</a> --%>
			<div class="row">
				<c:choose>
					<c:when test="${ not empty manager }">
						<a href="/hotspot/add?pageNum=${ pageMaker.cri.pageNum }"
							class="waves-effect waves-light btn right"> <i
							class="material-icons left">create</i>+ 관광지
						</a>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</div>

			<!-- Basic Card -->
			<div class="row">

				<c:choose>
					<c:when test="${ pageMaker.total gt 0 }">
						<c:forEach var="hotspot" items="${ hotspotList }">
							<!-- 카드 1건 시작 -->
							<div class="col s12 m4">
								<div class="card small" >
									<div class="card-image" style="overflow: visible; height: 200px; width: auto;">
									<c:set var = "hotspotImg" value = "${hotspot.img}"/>
									<c:if test = "${fn:contains(hotspotImg,'https://')}">
										<img src="${hotspot.img}" alt="카드 이미지"
											onclick="location.href='/hotspot/detail?id=${hotspot.id}&pageNum=${ pageMaker.cri.pageNum }'"
											style="height: 100%; width: 100%; cursor:pointer;">
									</c:if>
									<c:if test = "${not fn:contains(hotspotImg,'https://')}">
										<img src="/resources/uploadimages/${hotspot.img}" alt="카드 이미지" 
										onclick="location.href='/hotspot/detail?id=${hotspot.id}&pageNum=${ pageMaker.cri.pageNum }'" 
										style="height: 100%; width: 100%; cursor:pointer;">
									</c:if>	
											
											
											<span class="card-title" style="padding:0px;">${hotspot.name}</span>
										<a class="btn-floating halfway-fab waves-effect waves-light red">
											<i data-target="modal1" class="material-icons modal-trigger">add</i>
										</a>
									</div>
									<div class="card-content"
										onclick="location.href='/hotspot/detail?id=${hotspot.id}&pageNum=${ pageMaker.cri.pageNum }'"
										style="cursor: pointer; display:block; height: 150px;">
										<p>${hotspot.title}</p>
									</div>
								</div>
							</div>



							<!-- end of Basic Card -->


							<!-- 모달테스트 -->
							<!-- Modal Structure -->
							<div id="modal1" class="modal">
								<div class="modal-content">
									<h4>${hotspot.title}</h4>
									<h4>${hotspot.subTitle}</h4>
									<p>${hotspot.content}</p>
								</div>
								<div class="modal-footer">
									<a href="#!"
										class="modal-close waves-effect waves-green btn-flat">닫기</a>
								</div>
							</div>

							<!-- 모달테스트 끝-->
							<!-- 카드 1건 끝 -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="row">
							<span colspan="5">현재 게시판에 작성된 글이 없습니다.</span>
							<!-- colspan 열병합 속성 rowspan 행병합 -->

					</c:otherwise>
				</c:choose>
			</div>
			<!-- end of Basic Card -->
		</div>



		<br />
		<!-- pagination -->
		<ul class="pagination" align="center">
					<li class="${pageMaker.prev ? 'waves-effect' : 'disabled'}">
				 	<a id="prev"><i class="material-icons">chevron_left</i></a></li>
						<!-- 페이지버튼 반복문 -->
						<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}" step="1">
						<li class=" ${pageMaker.cri.pageNum == i ? 'active' : 'waves-effect'}">
						<a href="/hotspot/list?pageNum=${i}">${i}</a></li>
						</c:forEach>
						<!-- 페이지버튼 반복문 끝 -->
					<li class="${pageMaker.next ? 'waves-effect' : 'disabled'}">
					<a id="next"><i class="material-icons">chevron_right</i></a></li>
		</ul>
		<!-- end of pagination -->

		<!-- Footer -->
		<%-- include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of Container -->

	</div>
	<!-- end of App -->






	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});

		const slider = document.querySelector('.slider');
		M.Slider.init(slider, {
			indicators : false,
			height : 485,
			duration : 500,
			interval : 6000
		});

		const ac = document.querySelector('.autocomplete');
		M.Autocomplete.init(ac, {
			data : {
				'파리' : null,
				'베네치아' : null,
				'암스테르담' : null,
				'부다페스트' : null,
				'프랑크푸르트' : null,
				'비엔나' : null,
				'드라스덴' : null,
				'프라하' : null,
				'로마' : null
			}
		});

		var elems = document.querySelectorAll('.collapsible');
		var instances = M.Collapsible.init(elems, {});
	</script>



	<!-- 이미지 모달(팝업창) 관련 자바스크립트 -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.modal');
			var instances = M.Modal.init(elems);
		});
	</script>
	<script>
		var prev = document.querySelector('a#prev');

		prev.addEventListener('click', function(event) {
			event.preventDefault();

			var isPrev = $
			{
				pageMaker.prev
			}
			; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
			if (!isPrev) {
				return;
			}
			location.href = '/hotspot/list?pageNum=${pageDTO.startPage - 1}';
		});
		// 다음 a태그 클릭 이벤트
		var next = document.querySelector('a#next');

		next.addEventListener('click', function(event) {
			event.preventDefault();
			var isNext = $
			{
				pageMaker.next
			}
			; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
			if (!isNext) {
				return;
			}
			location.href = '/hotspot/list?pageNum=${pageDTO.endPage + 1}';
		});
	var prev = document.querySelector('a#prev');

	prev.addEventListener('click', function(event) {
		event.preventDefault();
		
		var isPrev = ${pageMaker.prev}; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
		if (!isPrev) {
			return;
		}
		location.href = '/hotspot/list?pageNum=${pageMaker.startPage - 1}';
	});
	// 다음 a태그 클릭 이벤트
	var next = document.querySelector('a#next');

	next.addEventListener('click', function(event) {
		event.preventDefault();
		var isNext = ${pageMaker.next}; // jsp 파일이니까 el 표현식 사용 가능! ${ pageMaker.prev } true, false 값
		if (!isNext) {
			return;
		}
		location.href = '/hotspot/list?pageNum=${pageMaker.endPage + 1}';
	});
	</script>
</body>

</html>
