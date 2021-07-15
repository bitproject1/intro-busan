<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
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
					<li><img src="/resources/images/amsterdam.jpg" />
						<div class="caption center-align">
							<h2>풍차의 나라</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								Lorem ipsum, dolor sit amet consectetur adipisicing elit.
								Officiis accusantium libero, natus quibusdam nesciunt
								exercitationem commodi quo dolore asperiores tenetur.
								Perspiciatis cupiditate molestias eligendi placeat ab asperiores
								ex quae enim!</h5>
						</div></li>
					<li><img src="/resources/images/dresden.jpg" />
						<div class="caption left-align">
							<h2>다시가고 싶은 도시</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								Lorem ipsum, dolor sit amet consectetur adipisicing elit.
								Officiis accusantium libero, natus quibusdam nesciunt
								exercitationem commodi quo dolore asperiores tenetur.
								Perspiciatis cupiditate molestias eligendi placeat ab asperiores
								ex quae enim!</h5>
						</div></li>
					<li><img src="/resources/images/venezia.jpg" />
						<div class="caption right-align">
							<h2>세계적인 수상도시</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">
								Lorem ipsum, dolor sit amet consectetur adipisicing elit.
								Officiis accusantium libero, natus quibusdam nesciunt
								exercitationem commodi quo dolore asperiores tenetur.
								Perspiciatis cupiditate molestias eligendi placeat ab asperiores
								ex quae enim!</h5>
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
								id="autocomplete-input" placeholder="드라스덴, 파리, 프라하, ..." />
						</div>
					</div>
				</div>
			</div>
			<!-- end of AutoComplete -->
		</div>

		<!-- end of Container -->
		<div class="container">
			<div class="row">
				<div class="col s12 m2"></div>

				<div class="col s12 m8">
					<div class="card">
						<div class="card-title">${hotspot.name}</div>

						<div class="card-image">
							<a href="#"> <img src="/resources/images/amsterdam.jpg" />
							</a>
						</div>
						<div class="card-content">
							<div class="card-content-span">${hotspot.title}</div>
							</br>
							<div class="card-content-span">${hotspot.subTitle}</div>
							</br>
							<div class="card-content-span">${hotspot.address}</div>
							</br>
							<div class="card-content-span">${hotspot.phoneNum}</div>
							</br>
							<div class="card-content-span">${hotspot.traffic}</div>
							</br>
							<div class="card-content-span">${hotspot.day}</div>
							</br>
							<div class="card-content-span">${hotspot.holiday}</div>
							</br>
							<div class="card-content-span">${hotspot.time}</div>
							</br>
							<div class="card-content-span">${hotspot.fee}</div>
							</br>
							<div class="card-content-span">${hotspot.conv}</div>
							</br>
							<div class="card-content-span">${hotspot.content}</div>
							<div class="card-action">
								<a href="${hotspot.url}">웹사이트 접속</a>
							</div>
						</div>
					</div>
					<a href="/restaurantmodify"
						class="btn-large waves-effect waves-light btn right red"> <i
						class="material-icons left">delete</i> 글삭제
					</a> <a href="/restaurantmodify"
						class="btn-large waves-effect waves-light btn right yellow"> <i
						class="material-icons left">edit</i> 글수정
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Container -->
	<div class="container">
		<!-- Basic Card -->

		<div class="row">
			<c:choose>
				<c:when test="${ pageMaker.total gt 0 }">
					<c:forEach var="restaurant" items="${ Restaurants }">
						<!-- 레스토랑 카드 1건 시작 -->
						<div class="col s12 m2">
							<div class="card">
								<div class="card-image">
									<a href="/restaurant/detail/${restaurant.id}"> <img
										src="${restaurant.img}" />
									</a> <span class="card-title">${restaurant.name}</span> <a
										class="btn-floating halfway-fab waves-effect waves-light red">
										<i data-target="modal1" class="material-icons modal-trigger">add</i>
									</a>
								</div>
								<div class="card-content">
									<div class="card-content">${restaurant.district}</div>
									<div class="card-content">${restaurant.mainMenu}</div>
									<div class="card-content">좋아요 수</div>
									<div class="card-content">리뷰 수</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="row">
						<span colspan="5">현재 게시판에 작성된 글이 없습니다.</span>
					</div>
				</c:otherwise>
			</c:choose>

			<!-- Modal Modal component -->
			<div id="modal1" class="modal">
				<div class="modal-content">
					<h4>Modal Header</h4>
					<p>A bunch of text</p>
				</div>
				<div class="modal-footer">
					<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
				</div>
			</div>
			<!-- Modal component end-->

			<!-- 레스토랑 카드 1건 끝 -->


		</div>
	</div>
	<!-- end of Basic Card -->
	</div>
	<%--<a
          href="/board/write?pageNum=${ pageMaker.cri.pageNum }"
          class="waves-effect waves-light btn right"
        >
          <i class="material-icons left">create</i>새글쓰기
        </a>
        --%>
	</div>
	<!-- Container -->



	<br />
	<!-- pagination -->
	<ul class="pagination" align="center">
		<li class="${pageMaker.prev ? 'waves-effect' : 'disabled'}"><a
			id="prev"><i class="material-icons">chevron_left</i></a></li>
		<!-- 페이지버튼 반복문 -->
		<c:forEach var="i" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}" step="1">
			<li
				class=" ${pageMaker.cri.pageNum == i ? 'active' : 'waves-effect'}">
				<a href="/hotspot/list?pageNum=${i}">${i}</a>
			</li>
		</c:forEach>
		<!-- 페이지버튼 반복문 끝 -->
		<li class="${pageMaker.next ? 'waves-effect' : 'disabled'}"><a
			id="next"><i class="material-icons">chevron_right</i></a></li>

	</ul>
	<!-- end of pagination -->

	<!-- Footer -->
	<%-- include footer.jsp --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- end of Footer -->
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
			interval : 6000,
		});

		const ac = document.querySelector('.autocomplete');
		M.Autocomplete.init(ac, {
			data : {
				파리 : null,
				베네치아 : null,
				암스테르담 : null,
				부다페스트 : null,
				프랑크푸르트 : null,
				비엔나 : null,
				드라스덴 : null,
				프라하 : null,
				로마 : null,
			},
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
</body>
</html>
