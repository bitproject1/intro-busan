<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<<<<<<< HEAD
<<<<<<< HEAD
=======
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css"
    />
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-2.1.1.min.js"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>

    <style>
      html, body {
      	height: 100%;
      }

      html {
      	display: table;
      	margin: auto;
      }

      body {
      	display: table-cell;
      	vertical-align: middle;
      	background: #4ECDC4;
      }

      #login-page {
      	width: 500px;
      }

      .card {
      	position: absolute;
      	left: 50%;
      	top: 50%;
      	-moz-transform: translate(-50%, -50%) -webkit-transform: translate(-50%, -50%)
      		-ms-transform: translate(-50%, -50%) -o-transform: translate(-50%, -50%)
      		transform: translate(-50%, -50%);
      }
    </style>
  </head>
  <body ng-app="mainModule" ng-controller="mainController">
    <div id="login-page" class="row">
      <div class="col s12 z-depth-6 card-panel">
        <form class="login-form" action="/user/join" method="post">
          <div class="row"></div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">mail_outline</i>
              <input
                class="validate"
                id="username"
                name="username"
                type="text"
              />
              <label for="username" data-error="wrong" data-success="available"
                >ID</label
              >
              <br />
              <br />
              <span class="helper-text" id="idDupMessage"
                >*???????????? ?????? ?????? ???????????????.</span
              >
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">lock_outline</i>
              <input
                class="validate"
                id="password"
                name="password"
                type="password"
              />
              <label for="password">Password</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">email</i>
              <input class="validate" id="email" name="email" type="text" />
              <label for="email" data-error="wrong" data-success="right"
                >E-mail</label
              >
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i id="fsdkjslf" class="material-icons prefix"
                >confirmation_number</i
              >
              <br />
              <select id="age" name="age">
                <option disabled selected>Select Your Age</option>
                <option value="1">10s</option>
                <option value="2">20s</option>
                <option value="3">30s</option>
                <option value="4">40s</option>
                <option value="5">50s</option>
                <option value="6">60s</option>
                <option value="7">70s</option>
                <option value="8">80s</option>
                <option value="9">90s</option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">person_pin_circle</i> <br />
              <br />
              <label for="gender-radio" data-error="wrong" data-success="right"
                >Gender</label
              >
              <input name="gender" type="radio" id="r1" value="M" />
              <label for="r1">Male</label>

              <input name="gender" type="radio" id="r2" value="F" />
              <label for="r2">Female</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <button
                type="submit"
                class="btn waves-effect waves-light col s12"
              >
                Sign Up
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <script>
      var app = angular.module('mainModule', []);

      app.controller('mainController', function ($scope, $http) {
        //o scope liga o js e o template
        $scope.nome = 'Valor Inicial';
        //$http.get().success();
        $scope.reset = function () {
          $scope.nome = '';
        };
      });
=======
>>>>>>> 5b5d0cea5b062ee947d290728f4ec910671664e7

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>


<style>
html, body {
	height: 100%;
}

html {
	display: table;
	margin: auto;
}

body {
	display: table-cell;
	vertical-align: middle;
	background: #4ECDC4;
}

#login-page {
	width: 500px;
}

.card {
	position: absolute;
	left: 50%;
	top: 50%;
	-moz-transform: translate(-50%, -50%) -webkit-transform: translate(-50%, -50%)
		-ms-transform: translate(-50%, -50%) -o-transform: translate(-50%, -50%)
		transform: translate(-50%, -50%);
}
</style>
</head>
<body ng-app="mainModule" ng-controller="mainController">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="/user/join" method="post">
				<div class="row"></div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">mail_outline</i>
						<input class="validate" id="username" name="username" type="text">
						<label for="username" data-error="wrong" data-success="available">ID</label>
						 <br/>
						  <br/>
                         <span class="helper-text" id="idDupMessage">*???????????? ?????? ?????? ???????????????.</span>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">lock_outline</i>
						<input class="validate" id="password" name="password" type="password">
						<label for="password">Password</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">email</i>
						<input class="validate" id="email" name="email" type="text">
						<label for="email" data-error="wrong" data-success="right">E-mail</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">

						<i id="selectAge" class="material-icons prefix">confirmation_number</i> <br />
						<select id="age" name="age">
							<option disabled selected>Select Your Age</option>
							<option value="1">10s</option>
							<option value="2">20s</option>
							<option value="3">30s</option>
							<option value="4">40s</option>
							<option value="5">50s</option>
							<option value="6">60s</option>
							<option value="7">70s</option>
							<option value="8">80s</option>
							<option value="9">90s</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">person_pin_circle</i> <br /> <br /> <label for="gender-radio" data-error="wrong" data-success="right">Gender</label>
						<input name="gender" type="radio" id="r1" value="M">
						<label for="r1">Male</label>

						<input name="gender" type="radio" id="r2" value="F">
						<label for="r2">Female</label>

					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<button type="submit" class="btn waves-effect waves-light col s12">Sign Up</button>
					</div>
				</div>
			</form>
		</div>
	</div>



	<script>
		var app = angular.module('mainModule', []);

		app.controller('mainController', function($scope, $http) { //o scope liga o js e o template
			$scope.nome = 'Valor Inicial';
			//$http.get().success();
			$scope.reset = function() {
				$scope.nome = '';
			}
		});
	</script>


	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('select');
			var instances = M.FormSelect.init(elems, options);
		});
	</script>


	<script>
		$(document).ready(function() {
			$('select').material_select();
		});
	</script>
	
	
	<!-- ???????????? ID ????????????,ID???????????? ?????? ?????????????????? -->
	 <script>

		
		$('#username').on('keyup', function () {
			var inputId = $(this).val();
			console.log(inputId);
			if (inputId == '') {
				$('span#idDupMessage').html('*???????????? ?????? ?????? ???????????????.').css('color', 'grey');
				return;
			}
			
			$.ajax({
				url: '/user/joinIdDupChkJson',
				data: { username: inputId },
				method: 'POST',
				success: function (data) {
					console.log(typeof data);
					console.log(data);
					showIdDupMessage(data.isIdDup);
				}
			});
		});
		
		function showIdDupMessage(isIdDup) {
			if (isIdDup == true) {
				$('span#idDupMessage').html('????????? ????????? ?????????.').css('color', 'red');
			} else {
				$('span#idDupMessage').html('??????????????? ????????? ?????????.').css('color', 'green');
			}
		}
		
<<<<<<< HEAD
=======
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css"
    />
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-2.1.1.min.js"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>

    <style>
      html, body {
      	height: 100%;
      }

      html {
      	display: table;
      	margin: auto;
      }

      body {
      	display: table-cell;
      	vertical-align: middle;
      	background: #4ECDC4;
      }

      #login-page {
      	width: 500px;
      }

      .card {
      	position: absolute;
      	left: 50%;
      	top: 50%;
      	-moz-transform: translate(-50%, -50%) -webkit-transform: translate(-50%, -50%)
      		-ms-transform: translate(-50%, -50%) -o-transform: translate(-50%, -50%)
      		transform: translate(-50%, -50%);
      }
    </style>
  </head>
  <body ng-app="mainModule" ng-controller="mainController">
    <div id="login-page" class="row">
      <div class="col s12 z-depth-6 card-panel">
        <form class="login-form" action="/user/join" method="post">
          <div class="row"></div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">mail_outline</i>
              <input
                class="validate"
                id="username"
                name="username"
                type="text"
              />
              <label for="username" data-error="wrong" data-success="available"
                >ID</label
              >
              <br />
              <br />
              <span class="helper-text" id="idDupMessage"
                >*???????????? ?????? ?????? ???????????????.</span
              >
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">lock_outline</i>
              <input
                class="validate"
                id="password"
                name="password"
                type="password"
              />
              <label for="password">Password</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">email</i>
              <input class="validate" id="email" name="email" type="text" />
              <label for="email" data-error="wrong" data-success="right"
                >E-mail</label
              >
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i id="fsdkjslf" class="material-icons prefix"
                >confirmation_number</i
              >
              <br />
              <select id="age" name="age">
                <option disabled selected>Select Your Age</option>
                <option value="1">10s</option>
                <option value="2">20s</option>
                <option value="3">30s</option>
                <option value="4">40s</option>
                <option value="5">50s</option>
                <option value="6">60s</option>
                <option value="7">70s</option>
                <option value="8">80s</option>
                <option value="9">90s</option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <i class="material-icons prefix">person_pin_circle</i> <br />
              <br />
              <label for="gender-radio" data-error="wrong" data-success="right"
                >Gender</label
              >
              <input name="gender" type="radio" id="r1" value="M" />
              <label for="r1">Male</label>

              <input name="gender" type="radio" id="r2" value="F" />
              <label for="r2">Female</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <button
                type="submit"
                class="btn waves-effect waves-light col s12"
              >
                Sign Up
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <script>
      var app = angular.module('mainModule', []);

      app.controller('mainController', function ($scope, $http) {
        //o scope liga o js e o template
        $scope.nome = 'Valor Inicial';
        //$http.get().success();
        $scope.reset = function () {
          $scope.nome = '';
        };
      });
>>>>>>> fb4216c3ad61913a7c4cee499b9cfd3d7c406733
=======
>>>>>>> f9418f3e64651c9a53953039a3f889f238f99788
>>>>>>> 5b5d0cea5b062ee947d290728f4ec910671664e7
    </script>

    <script>
      document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('select');
        var instances = M.FormSelect.init(elems, options);
      });
    </script>

    <script>
      $(document).ready(function () {
        $('select').material_select();
      });
    </script>

    <!-- ???????????? ID ????????????,ID???????????? ?????? ?????????????????? -->
    <script>
      $('#username').on('keyup', function () {
        var inputId = $(this).val();
        console.log(inputId);
        if (inputId == '') {
          $('span#idDupMessage')
            .html('*???????????? ?????? ?????? ???????????????.')
            .css('color', 'grey');
          return;
        }

        $.ajax({
          url: '/user/joinIdDupChkJson',
          data: { username: inputId },
          method: 'POST',
          success: function (data) {
            console.log(typeof data);
            console.log(data);
            showIdDupMessage(data.isIdDup);
          },
        });
      });

      function showIdDupMessage(isIdDup) {
        if (isIdDup == true) {
          $('span#idDupMessage')
            .html('????????? ????????? ?????????.')
            .css('color', 'red');
        } else {
          $('span#idDupMessage')
            .html('??????????????? ????????? ?????????.')
            .css('color', 'green');
        }
      }
    </script>
  </body>
</html>
