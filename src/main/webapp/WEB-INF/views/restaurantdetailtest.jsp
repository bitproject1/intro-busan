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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/resources/images/review/starrate.png');
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
    background-image: url('/resources/images/review/starrate.png');
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
	
		<form 	>
		
		</form>
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






	

<!-- ?????? ?????? ?????????????????? -->
<script>
//?????? ?????? ?????? ????????????????????? ??????

function Rating(){};
Rating.prototype.rate=0;

Rating.prototype.setRate = function(newrate){
    //?????? ?????? - ????????? ??? ?????? ?????? ??? ?????? ??????
    this.rate = newrate;
    console.log(typeof(newrate))
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
    /* 		???????????? */   

    $("#btnComment").click(function(){
    	alert("?????????")
    	/* if(${empty principal.user}){
    		alert("??????????????????");
    		location.href="/login";
    		return;
    	} */
    	alert(newrate)
    	
    	
    	data={
    		"userId" : ${user.id},
    		/* "rId": ${restaurant.id}, */ 
    		"content":$("#msg").val(),
    		"grade" : returnRating()
    	}
    	
    	function returnRating(){
    		 switch (String(newrate)){
    		    case "1" :
    		    	return "STAR1";
    		        break;
    		    case "2" :
    		    	return "STAR2";
    		        break;
    		    case "3" :
    		    	return "STAR3";
    		        break;
    		    case "4" :
    		    	return "STAR4";
    		        break;
    		    case "5" :
    		    	return "STAR5";
    		        break;
    		    default :
    		    	return " ";
    	}
    	
    	alert(returnRating());
    	
    	if($("#msg").val()==""){
    		alert("????????? ????????????");
    		return;
    	}
    		
    			
    		
    	}
    	$.ajax({
    		type:"POST",
    		url:"insert",
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
}

let rating = new Rating();//?????? ???????????? ??????

document.addEventListener('DOMContentLoaded', function(){
    //???????????? ????????? ?????????
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        console.dir(elem);
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            
        }
    })
});




	/*  document.querySelector('#save').addEventListener('click', function(e){
    //?????? ?????? ???????????? ????????? ??????
    if(rating.rate == 0){
        rating.showMessage('rate');
        return false;
    }
});   */
 
 Rating.prototype.showMessage = function(type){//??????????????? ??????
    switch(type){
        case 'rate':
            //??????????????? ??????
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //????????? ?????? ??? ?????? ????????? ??????
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //??????????????? ??????
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //????????? ?????? ??? ?????? ????????? ??????
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
} 
</script>

<script type="text/javascript">

</script>
</body>

</html>