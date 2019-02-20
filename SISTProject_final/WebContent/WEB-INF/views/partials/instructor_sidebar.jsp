<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="side-navbar">
    <!-- Sidebar Header-->
    <div class="sidebar-header d-flex align-items-center">
        <div class="avatar">
        	<img src="${pageContext.request.contextPath}/resources/img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle">
        </div>
        <div class="title">
            <h1 class="h4">${sessionScope.instructor.instructor_name}</h1>
            <p>${sessionScope.instructor.instructor_id}</p>
        </div>
    </div>
    <!-- Sidebar Navidation Menus-->
    <span class="heading">Main</span>
    <ul class="list-unstyled">
		<li>
			<a href="${pageContext.request.contextPath}/instructor/schedule1"><i class="icon-user"></i>강사 스케쥴 조회</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/instructor/point1"><i class="fa fa-bar-chart"></i>배점 관리</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/instructor/score1"><i class="icon-padnote"></i>성적 관리</a>
		</li>
	</ul>
</nav>