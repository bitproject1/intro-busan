<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


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
					<li><img src="/resources/images/amsterdam.jpg">
						<div class="caption center-align">
							<h2>풍차의 나라</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Officiis accusantium libero, natus quibusdam nesciunt exercitationem commodi quo dolore asperiores tenetur. Perspiciatis cupiditate molestias eligendi placeat ab asperiores ex quae enim!</h5>
						</div></li>
					<li><img src="/resources/images/dresden.jpg">
						<div class="caption left-align">
							<h2>다시가고 싶은 도시</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Officiis accusantium libero, natus quibusdam nesciunt exercitationem commodi quo dolore asperiores tenetur. Perspiciatis cupiditate molestias eligendi placeat ab asperiores ex quae enim!</h5>
						</div></li>
					<li><img src="/resources/images/venezia.jpg">
						<div class="caption right-align">
							<h2>세계적인 수상도시</h2>
							<h5 class="light grey-text text-lighten-3 hide-on-small-only">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Officiis accusantium libero, natus quibusdam nesciunt exercitationem commodi quo dolore asperiores tenetur. Perspiciatis cupiditate molestias eligendi placeat ab asperiores ex quae enim!</h5>
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
							<i id="" class="material-icons prefix">location_on</i>
							<input type="text" class="white grey-text autocomplete" id="autocomplete-input" placeholder="드라스덴, 파리, 프라하, ...">
						</div>
					</div>
				</div>
			</div>
			<!-- end of AutoComplete -->
		</div>

		<!-- end of Container -->
		<div class="container">
			
			<div class="col s12 l8 offset-l2">
                    <div class="card">
                        <div class="card-content">
                            <div class="row">
                            	<div class ="col s12 m6">
                            		<img src="/resources/images/amsterdam.jpg"/>
                            	</div>
                            	
                            	<div class="col s12 l4">
                            		조회수: ${ boardVO.readcount }
                            	</div>
                            	<div class="col s12 l4">
                            		글쓴이: ${ boardVO.mbrid }
                            	</div>
                            	<div class="col s12 l4">
                            		작성일자: <fmt:formatDate value="${ boardVO.regDate }" pattern="yyyy-MM-dd a hh:mm:ss" />
                            	</div>
                            </div>
                            <pre>${ boardVO.content }</pre>
                        </div>
                      
                    </div>
                </div>
            </div>
		
		
		</div>
		
		<!-- Container -->
		<div class="container">
			
		
			
			<!-- Basic Card -->
			
			<div class="row">
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="#"><img src="/resources/images/amsterdam.jpg"></a>
							<span class="card-title">Card Title</span>
							<a class="btn-floating halfway-fab waves-effect waves-light red">
								<i data-target="modal1" class="material-icons modal-trigger">add</i>
							</a>
						</div>
						<div class="card-content">
							<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
						</div>
					</div>
				</div>
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="#"><img src="/resources/images/amsterdam.jpg"></a>
							<span class="card-title">Card Title</span>
							<a class="btn-floating halfway-fab waves-effect waves-light red">
								<i data-target="modal1" class="material-icons modal-trigger">add</i>
							</a>
						</div>
						<div class="card-content">
							<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
						</div>
					</div>
				</div>
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="#"><img src="/resources/images/amsterdam.jpg"></a>
							<span class="card-title">Card Title</span>
							<a class="btn-floating halfway-fab waves-effect waves-light red">
								<i data-target="modal1" class="material-icons modal-trigger">add</i>
							</a>
						</div>
						<div class="card-content">
							<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
						</div>
					</div>
				</div>
				<div class="col s12 m3">
					<div class="card">
						<div class="card-image">
							<a href="#"><img src="/resources/images/amsterdam.jpg"></a>
							<span class="card-title">Card Title</span>
							<a class="btn-floating halfway-fab waves-effect waves-light red">
								<i data-target="modal1" class="material-icons modal-trigger">add</i>
							</a>
						</div>
						<div class="card-content">
							<p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
						</div>
					</div>
				</div>

			</div>

			<%--<a href="/board/write?pageNum=${ pageMaker.cri.pageNum }" class="waves-effect waves-light btn right">
						<i class="material-icons left">create</i>새글쓰기
				</a> --%>
			<a href="restaurantadd" class="waves-effect waves-light btn right">
				<i class="material-icons left">create</i>새글쓰기
			</a>
		</div>
		<!-- end of Basic Card -->


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
			<li class="disabled"><a href="#!">
					<i class="material-icons">chevron_left</i>
				</a></li>
			<li class="active"><a href="#!">1</a></li>
			<li class="waves-effect"><a href="#!">2</a></li>
			<li class="waves-effect"><a href="#!">3</a></li>
			<li class="waves-effect"><a href="#!">4</a></li>
			<li class="waves-effect"><a href="#!">5</a></li>
			<li class="waves-effect"><a href="#!">
					<i class="material-icons">chevron_right</i>
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