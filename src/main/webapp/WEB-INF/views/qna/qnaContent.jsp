<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                        <a href="/" class="breadcrumb">홈</a>
                        <a href="/board/list?pageNum=${ pageNum }" class="breadcrumb">게시판 글목록</a>
                        <a href="/board/content?num=${ boardVO.num }&pageNum=${ pageNum }" class="breadcrumb">게시판 글내용</a>
                    </div>
                </div>
            </nav>
            <!-- end of Breadcrumbs -->


            
            <div class="row">
                <h4 class="center-align">게시판 글내용</h4>
                <hr style="margin-bottom: 50px;">
            </div>

            <div class="row">
                <div class="col s12 l8 offset-l2">
                    <div class="card">
                        <div class="card-image">
                        	<c:forEach var="attach" items="${ attachList }">
                        		<c:if test="${ attach.filetype eq 'I' }">
                       				<a href="/resources/upload/${ attach.uploadpath }/${ attach.uuid }_${attach.filename}">
                       					<img src="/resources/upload/${ attach.uploadpath }/s_${ attach.uuid }_${attach.filename}">
                       				</a>
                        		</c:if>
                        	</c:forEach>
                        </div>
                        <div class="card-content">
                            <span class="card-title">${ boardVO.title }</span>
                            <div class="row">
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
                        <div class="card-action">
                        	<c:forEach var="attach" items="${ attachList }">
                        		<c:if test="${ attach.filetype ne 'I' }">
                       				<a href="/resources/upload/${ attach.uploadpath }/${ attach.uuid }_${attach.filename}">
                       					${attach.filename}
                       				</a>
                        		</c:if>
                        	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="row center-align">
                <div class="col s12 l8 offset-l2">
                    <div class="col s6 m3">
                        <a class="btn-large waves-effect waves-light">
                            <i class="material-icons left">edit</i>
                            글수정
                        </a>
                    </div>
                    <div class="col s6 m3">
                        <a class="btn-large waves-effect waves-light">
                            <i class="material-icons left">delete</i>
                            글삭제
                        </a>
                    </div>
                    <div class="col s6 m3">
                        <a class="btn-large waves-effect waves-light">
                            <i class="material-icons left">reply</i>
                            답글쓰기
                        </a>
                    </div>
                    <div class="col s6 m3">
                        <a class="btn-large waves-effect waves-light" href="/board/list?pageNum=${ pageNum }">
                            <i class="material-icons left">list</i>
                            글목록
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s12 l8 offset-l2">
                    <blockquote>
                        [글수정] 버튼을 눌러서 현재 글을 수정할 수 있어요.<br>
                        [글삭제] 버튼을 눌러서 현재 글을 삭제할 수 있어요.<br>
                        [답글쓰기] 버튼을 눌러서 현재 글에 대한 답글을 등록할 수 있어요.<br>
                        글목록으로 가시려면 [글목록] 버튼을 누르세요.
                    </blockquote>
                </div>
            </div>


        </div>
        <!-- end of Container -->

        
        <!-- Footer -->
        <%-- include footer.jsp --%>
 		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
        <!-- end of Footer -->

    </div>
    <!-- end of App -->
    


    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        const sideNav = document.querySelector('.sidenav');
        M.Sidenav.init(sideNav, {});
    </script>
</body>

</html>