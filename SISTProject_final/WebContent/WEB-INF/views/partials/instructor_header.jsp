<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">
	<nav class="navbar">
		<!-- Search Box-->

		<div class="container-fluid">
			<div
				class="navbar-holder d-flex align-items-center justify-content-between">
				<!-- Navbar Header-->
				<div class="navbar-header">
					<!-- Navbar Brand -->
					<a href="${pageContext.request.contextPath}/instructor/first" class="navbar-brand d-none d-sm-inline-block">
						<span class="brand-text d-none d-lg-inline-block">쌍용교육센터</span>
						<strong class="brand-text d-none d-sm-inline-block d-lg-none">SIST</strong>
					</a>
					<!-- Toggle Button-->
					<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
				</div>
				<!-- Navbar Menu -->
				<ul
					class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
					
					<!-- Languages dropdown    -->
					<li class="nav-item dropdown">
						<a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" class="nav-link language dropdown-toggle">
							<span class="d-none d-sm-inline-block">개인 설정</span></a>
						<ul class="dropdown-menu">
							<li><a rel="nofollow" href="${pageContext.request.contextPath}/instructor/info" class="dropdown-item"> 개인정보 확인</a></li>
							<li><a rel="nofollow" href="${pageContext.request.contextPath}/instructor/changepw" class="dropdown-item"> 비밀번호 변경</a></li>

						</ul></li>
					<!-- Logout    -->
					<li class="nav-item"><a href="${pageContext.request.contextPath}/common/logout" class="nav-link logout"> 
					<span class="d-none d-sm-inline">Logout</span>
					<i class="fa fa-sign-out"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>