<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
    <!-- Navbar -->
    <nav>
        <div class="nav-wrapper cyan">
            <a href="/" class="brand-logo">Logo</a>
            <a href="#" data-target="nav-mobile" class="sidenav-trigger">
                <i class="material-icons">menu</i>
            </a>
            <ul class="right hide-on-med-and-down">
                
               <%--  <c:choose>
                	<c:when test="${ not empty memberVO }"> --%>
                		<li><a href="/user/logout">로그아웃</a></li>
                		<li><a href="/user/info">회원정보확인</a></li>
                		<li><a href="/user/modify">회원정보수정</a></li>
                		<li><a href="/user/remove">회원탈퇴</a></li>
                <%-- 	</c:when>
                	<c:otherwise> --%>
                		<li><a href="/user/join">회원가입</a></li>
                		<li><a href="/user/login">로그인</a></li>
              <%--   	</c:otherwise>
                </c:choose> --%>
                
                <li><a href="/board/list">게시판</a></li>
            </ul>
        </div>
    </nav>
    <ul id="nav-mobile" class="sidenav">
     <%--    <c:choose> --%>
        	<%-- <c:when test="${ not empty memberVO }"> --%>
		        <li>
		            <div class="user-view">
		                <div class="background">
		                    <img src="/resources/images/rome.jpg">
		                </div>
		                <a href="#user"><img src="/resources/images/venezia.jpg" class="circle"></a>
		                <a href="#name"><span class="white-text name">${ memberVO.name }</span></a>
		                <a href="#email"><span class="white-text email">${ memberVO.email }</span></a>
		            </div>
		        </li>
        		<li><a href="/member/logout">로그아웃</a></li>
        		<li><a href="/member/info">회원정보확인</a></li>
        		<li><a href="/member/modify">회원정보수정</a></li>
                <li><a href="/member/remove">회원탈퇴</a></li>
        <%-- 	</c:when>
        	<c:otherwise> --%>
        		<li><a href="/member/join">회원가입</a></li>
        		<li><a href="/member/login">로그인</a></li>
<%--         	</c:otherwise>
        </c:choose> --%>
        
        <li><a href="/board/list">게시판</a></li>
    </ul>
    <!-- end of Navbar -->
</div>





