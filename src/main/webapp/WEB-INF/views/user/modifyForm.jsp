<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


		<div class="container">
			<!-- Breadcrumbs -->
			<nav>
				<div class="nav-wrapper cyan">
					<div class="col s12">
						<a href="/" class="breadcrumb">홈</a> <a href="/member/modify"
							class="breadcrumb">회원정보수정</a>
					</div>
				</div>
			</nav>
			<!-- end of Breadcrumbs -->


			<!-- Forms -->
			<div class="row">
				<h4 class="center-align">회원정보수정</h4>
				<hr style="margin-bottom: 50px;">

				<form class="col s12 l6 offset-l3" action="/user/modifyProcess"
					method="post">
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">assignment_ind</i> <input
								type="text" id="username" class="validate" data-length="13"
								name="username" value="${user.username }" readonly> <label
								for="username">아이디</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">lock</i> <input type="password"
								id="password" class="validate" data-length="20" name="password">
							<label for="password">비밀번호</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">mail</i> <input type="email"
								id="email" class="validate" name="email" value="${user.email }">
							<label for="email">이메일</label> <span class="helper-text"
								data-error="이메일 형식이 올바르지 않습니다." data-success="OK!">이메일
								주소를 입력하세요.</span>
						</div>
					</div>

					<div class="row center-align">
						<button type="submit" class="btn-large waves-effect waves-light">
							회원정보 수정하기 <i class="material-icons right">send</i>
						</button>
					</div>

					<div class="row">
						<blockquote>수정할 회원정보 입력 후 수정하기 버튼을 누르세요.</blockquote>
					</div>
				</form>
			</div>
			<!-- end of Forms -->

		</div>
		<!-- end of Container -->


		<!-- Footer -->
		<%--include footer.jsp --%>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- end of Footer -->

	</div>
	<!-- end of App -->



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script>
		const sideNav = document.querySelector('.sidenav');
		M.Sidenav.init(sideNav, {});

		var textNeedCount = document.querySelectorAll('#member_id, #password');
		M.CharacterCounter.init(textNeedCount);
	</script>
</body>

</html>