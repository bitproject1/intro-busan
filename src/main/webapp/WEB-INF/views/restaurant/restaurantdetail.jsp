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
							<div class="card-content-span">연령별 추천 : 
							<c:choose>
								<c:when test="${not empty age }">
									${age }0대에게 추천
								</c:when>
								<c:otherwise>
									아직 제공할 추천 데이터가 없음
								</c:otherwise>
							</c:choose>
							</div>
							</br>
							<div class="card-content-span">성별 추천 : 
							<c:choose>
								<c:when test="${not empty gender }">
									<c:choose>
										<c:when test="${gender eq 'M' }">
											남성에게 추천
										</c:when>
										<c:otherwise>
											여성에게 추천
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									아직 제공할 추천 데이터가 없음
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
													<span style="font-size: large; color:red;">♥</span>
												</c:when>
												<c:otherwise>
													<span style="font-size: large;">♡</span>
												</c:otherwise>
											</c:choose>
										</button>
										<span style="font-size: medium;">${loveCount }</span>
									</c:when>
									<c:otherwise>
										<button type="button" id="btnNotLoggedIn"  style="background-color:transparent; border:0px transparent solid;">
											<span style="font-size: large;">♡</span>
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

		
		
		<div class="review_rating">
            <div class="warning_msg">별점을 선택해 주세요.</div>
            <div class="rating">
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                <label for="rating1"></label>
                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                <label for="rating2"></label>
                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                <label for="rating3"></label>
                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                <label for="rating4"></label>
                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                <label for="rating5"></label>
            </div>
        </div>
		<div align="right">
			<textarea rows="3" cols="50" id="msg"></textarea>
			<input type="button" value="댓글쓰기" class="btn btn-secondary  btn-sm" id="btnComment">
		</div>
		<hr />
		<div id="replyResult"></div>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
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

	<script>
	/* 댓글 불러오기 */
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
						<th>유저 아이디</th>
						<th>내용</th>
						<th>생성일자</th>
						
					</tr>

					<tr>
				`
										
					
				str += "<td>"+val.rId+"</td>"+" "
				str += "<td>"+val.content+"</td>" + " "
				str += "<td>"+val.regdate+"</td>" + " "
				str += "<td><a href='javascript:fdel("+val.id+")'>삭제</a></td><br/> "
				str += "</table>"
			})
			console.log(str)
			$("#replyResult").html(str);
		})
		
		
		.fail(function(resp){
			alert("실패");
		})
	}		

/* 		댓글쓰기 */   

    $("#btnComment").click(function(){
    	alert("눌렀음")
    	/* if(${empty principal.user}){
    		alert("로그인하세요");
    		location.href="/login";
    		return;
    	} */
    	
    	if($("#msg").val()==""){
    		alert("댓글을 적으세요");
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
    		alert("댓글 추가 성공");
 	})
    	
    	.fail(function(){
    		alert("댓글 추가 실패")
    	})
    })

//댓글 삭제
function fdel(id){
//alert(cnum)
alert(id)
alert(resp)

$.ajax({
	type:"delete",
	url:"/review/delete/"+id
})	

.done(function(resp){
	alert(resp +"번 글 삭제 완료")
	init();
})

	
.fail(function(resp){
alert("댓글 삭제 실패")

})
}
init();

	
	</script>

<!-- 별점 관련 자바스크립트 -->
<script>
//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});


document.querySelector('#save').addEventListener('click', function(e){
    //별점 선택 안했으면 메시지 표시
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});

Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}

</script>


</body>

</html>