<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



</head>

<body>
	<!-- App -->
	<div id="app">

		<%-- include header.jsp --%>
		<jsp:include page="/WEB-INF/views/include/header.jsp" />


	</div>

	<!-- end of Container -->
	<div class="container">
		<div class="row">
			<div class="col s12 l8 offset-l2">
				<div class="card">
					<div class="card-title">${restaurant.name}</div>
					<div class="card-content">
						<div class="card-content">
							<div class="card-content-span">${restaurant.address}</div>
							</br>
							<div class="card-content-span">${restaurant.phoneNum}</div>
							</br>
							<div class="card-content-span">${restaurant.url}</div>
							</br>
							<div class="card-content-span">${restaurant.time}</div>
							</br>
							<div class="card-content-span">${restaurant.mainMenu}</div>
							</br>
							<div class="card-content-span">
								<img src="${restaurant.img}" width="200" height="200">
							</div>
							</br>
							<div class="card-content-span">${restaurant.content}</div>
							</br>
							<div class="card-content-span">
								<c:choose>
									<c:when test="${not empty user }">
										<button type="button" id="btnLove">
											<c:choose>
												<c:when test="${checkLove eq 1 }">
													♥
												</c:when>
												<c:otherwise>
													♡
												</c:otherwise>
											</c:choose>
										</button>
										<div>${loveCount }</div>
									</c:when>
									<c:otherwise>
										<button type="button" id="btnNotLoggedIn">♡</button>
										<div>${loveCount }</div>
									</c:otherwise>
								</c:choose>
							</div>
							</br>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>




	<!-- 모달테스트 -->
	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<p>A bunch of text</p>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-close waves-effect waves-green btn-flat">닫기</a>
		</div>
	</div>

	<!-- 모달테스트 끝-->

	<br />
	<!-- pagination -->
	<ul class="pagination" align="center">
		<li class="disabled"><a href="#!"> <i class="material-icons">chevron_left</i>
		</a></li>
		<li class="active"><a href="#!">1</a></li>
		<li class="waves-effect"><a href="#!">2</a></li>
		<li class="waves-effect"><a href="#!">3</a></li>
		<li class="waves-effect"><a href="#!">4</a></li>
		<li class="waves-effect"><a href="#!">5</a></li>
		<li class="waves-effect"><a href="#!"> <i
				class="material-icons">chevron_right</i>
		</a></li>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script>
	
		$("#btnLove").on('click', function() {
			$.ajax({
				type : "GET",
				url : "/user/checkLove/${restaurant.rid}",
				success : function(resp) {
					if (resp == "success") {
						alert("좋아요 목록에 추가되었습니다.");
						location.href = '/restaurant/detail/${restaurant.rid}';
					} else if (resp == "cancleLove") {
						alert("좋아요를 취소하셨습니다.");
						location.href = '/restaurant/detail/${restaurant.rid}';
					}
				}// success
			}) //ajax
		}); //btnLove
		
		
		$("#btnNotLoggedIn").on('click', function() {
			alert('좋아요를 누르려면 로그인을 먼저 진행해주세요.');
		});
	</script>


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



</body>

</html>