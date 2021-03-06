<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}

.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}

</style>


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
							<div class="card-content-span">????????? ?????? : 
							<c:choose>
								<c:when test="${not empty age }">
									${age }0????????? ??????
								</c:when>
								<c:otherwise>
									?????? ????????? ?????? ???????????? ??????
								</c:otherwise>
							</c:choose>
							</div>
							</br>
							<div class="card-content-span">?????? ?????? : 
							<c:choose>
								<c:when test="${not empty gender }">
									<c:choose>
										<c:when test="${gender eq 'M' }">
											???????????? ??????
										</c:when>
										<c:otherwise>
											???????????? ??????
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									?????? ????????? ?????? ???????????? ??????
								</c:otherwise>
							</c:choose>
							</div>
							</br>
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
										<button type="button" id="btnLove" style="background-color:transparent; border:0px transparent solid;">
											<c:choose>
												<c:when test="${checkLove eq 1 }">
													<span style="font-size: large; color:red;">???</span>
												</c:when>
												<c:otherwise>
													<span style="font-size: large;">???</span>
												</c:otherwise>
											</c:choose>
										</button>
										<span style="font-size: medium;">${loveCount }</span>
									</c:when>
									<c:otherwise>
										<button type="button" id="btnNotLoggedIn"  style="background-color:transparent; border:0px transparent solid;">
											<span style="font-size: large;">???</span>
										</button>
										<span style="font-size: medium;">${loveCount }</span>
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




	<!-- ??????????????? -->
	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<p>A bunch of text</p>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-close waves-effect waves-green btn-flat">??????</a>
		</div>

		
		
		<div class="review_rating">
            <div class="warning_msg">????????? ????????? ?????????.</div>
            <div class="rating">
                <!-- ?????? ????????? ???????????? ?????? ?????? ??? ????????? ?????? ?????? ??????????????? checked ?????? -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1???">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2???">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3???" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4???">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5???">
                <label for="rating5"></label>
            </div>
        </div>
		<div align="right">
			<textarea rows="3" cols="50" id="msg"></textarea>
			<input type="button" value="????????????" class="btn btn-secondary  btn-sm" id="btnComment">
		</div>
		<hr />
		<div id="replyResult"></div>
	</div>

	<!-- ??????????????? ???-->

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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script>
	
		$("#btnLove").on('click', function() {
			$.ajax({
				type : "GET",
				url : "/user/checkLove/${restaurant.rid}",
				success : function(resp) {
					if (resp == "success") {
						alert("????????? ????????? ?????????????????????.");
						location.href = '/restaurant/detail/${restaurant.rid}';
					} else if (resp == "cancleLove") {
						alert("???????????? ?????????????????????.");
						location.href = '/restaurant/detail/${restaurant.rid}';
					}
				}// success
			}) //ajax
		}); //btnLove
		
		
		$("#btnNotLoggedIn").on('click', function() {
			alert('???????????? ???????????? ???????????? ?????? ??????????????????.');
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
				'??????' : null,
				'????????????' : null,
				'???????????????' : null,
				'???????????????' : null,
				'??????????????????' : null,
				'?????????' : null,
				'????????????' : null,
				'?????????' : null,
				'??????' : null
			}
		});

		var elems = document.querySelectorAll('.collapsible');
		var instances = M.Collapsible.init(elems, {});
	</script>



	<!-- ????????? ??????(?????????) ?????? ?????????????????? -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.modal');
			var instances = M.Modal.init(elems);
		});
	</script>

	<script>
	/* ?????? ???????????? */
	var init = function(){
		$.ajax({
			type:"get",
			url:"/review/commentList",
			data:{"rId": ${restaurant.rId}
		}
		})
		.done(function(resp){
			// Changes XML to JSON
			alert(resp)
			resp=JSON.parse(resp)
			var str = "";
			$.each(resp,function(key,val){

				str +=
				`<table>
					<tr>
						<th>?????? ?????????</th>
						<th>??????</th>
						<th>????????????</th>
						
					</tr>

					<tr>
				`
										
					
				str += "<td>"+val.rId+"</td>"+" "
				str += "<td>"+val.content+"</td>" + " "
				str += "<td>"+val.regdate+"</td>" + " "
				str += "<td><a href='javascript:fdel("+val.id+")'>??????</a></td><br/> "
				str += "</table>"
			})
			console.log(str)
			$("#replyResult").html(str);
		})
		
		
		.fail(function(resp){
			alert("??????");
		})
	}		

/* 		???????????? */   

    $("#btnComment").click(function(){
    	alert("?????????")
    	/* if(${empty principal.user}){
    		alert("??????????????????");
    		location.href="/login";
    		return;
    	} */
    	
    	if($("#msg").val()==""){
    		alert("????????? ????????????");
    		return;
    	}
    	data={
    		
    		"content":$("#msg").val(),
    		"userId":${user.id},
    		"rId":${restaurant.rId},
    		"grade":$(.)
    		
    	}
    	$.ajax({
    		type:"POST",
    		url:"/review/insert/",
    		data : JSON.stringify(data),
    		contentType:"application/json;charset=utf-8"
    		
    	})

    	.done(function(){
    		alert("?????? ?????? ??????");
 	})
    	
    	.fail(function(){
    		alert("?????? ?????? ??????")
    	})
    })

//?????? ??????
function fdel(id){
//alert(cnum)
alert(id)
alert(resp)

$.ajax({
	type:"delete",
	url:"/review/delete/"+id
})	

.done(function(resp){
	alert(resp +"??? ??? ?????? ??????")
	init();
})

	
.fail(function(resp){
alert("?????? ?????? ??????")

})
}
init();

	
	</script>

<!-- ?????? ?????? ?????????????????? -->



</body>

</html>