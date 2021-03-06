<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- Navbar -->
	<nav>
		<div class="nav-wrapper black">
		<div class="container">
			<a href="/" class="brand-logo">π­ TripAdvisor</a> 
			<a href="#" data-target="nav-mobile" class="sidenav-trigger"> 
			<i class="material-icons">menu</i>
			</a>
			<ul class="right hide-on-med-and-down">
				<c:choose>
					<c:when test="${ not empty user }">
						<li><a href="/qna/qnaBoard">QnA</a></li>
						<li><a href="/user/logout">λ‘κ·Έμμ</a></li>
						<li><a href="/user/mypage">λ§μ΄νμ΄μ§</a></li>
					</c:when>
					<c:when test="${ not empty manager }">
						<li><a href="/hotspot/list">κ΄κ΄μ§ λͺ©λ‘κ°κΈ°(μμ μμ )</a></li>
						<li><a href="/qna/qnaBoard">QnA</a></li>
						<li><a href="/user/logout">λ‘κ·Έμμ</a></li>
						<li><a href="/manager/management">κ³ κ°κ΄λ¦¬</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/hotspot/list">κ΄κ΄μ§ λͺ©λ‘κ°κΈ°(μμ μμ )</a></li> <!-- λμ€μ μ΄ -->
						<li><a href="/qna/qnaBoard">QnA</a></li>
						<li><a href="/user/join">νμκ°μ</a></li>
						<li><a href="/user/login">λ‘κ·ΈμΈ</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</div>
	</nav>
	<ul id="nav-mobile" class="sidenav">
		<li>
			<div class="user-view">
				<div class="background">
					<img src="/resources/images/rome.jpg">
				</div>
				<a href="#user"> <img src="/resources/images/venezia.jpg"
					class="circle">
				</a> <a href="#name"> <span class="white-text name">${ user.username }</span>
				</a> <a href="#email"> <span class="white-text email">${ user.email }</span>
				</a>
			</div>
		</li>
		<c:choose>
			<c:when test="${ not empty user }">
				<li><a href="/qna/qnaBoard">QnA</a></li>
				<li><a href="/user/logout">λ‘κ·Έμμ</a></li>
				<li><a href="/user/mypage">λ§μ΄νμ΄μ§</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/qna/qnaBoard">QnA</a></li>
				<li><a href="/user/join">νμκ°μ</a></li>
				<li><a href="/user/login">λ‘κ·ΈμΈ</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
	<!-- end of Navbar -->






