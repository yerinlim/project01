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
            <h1 class="h4">${sessionScope.student.student_name}</h1>
            <p>${sessionScope.student.student_id}</p>
        </div>
    </div>
    <!-- Sidebar Navidation Menus-->
    <span class="heading">Main</span>
    <ul class="list-unstyled">
		<li>
			<a href="${pageContext.request.contextPath}/student/score1"><i class="icon-user"></i>성적 조회</a>
		</li>
	</ul>
</nav>