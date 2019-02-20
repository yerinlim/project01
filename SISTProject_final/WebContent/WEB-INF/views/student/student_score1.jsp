<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>쌍용교육센터</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

<!-- Font Awesome CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">

<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontastic.css">

<!-- Google fonts - Poppins -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">

<!-- theme stylesheet-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.default.css" id="theme-stylesheet">

<!-- Favicon-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Customizing Common Element -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/util.js"></script>

<script>
	$(document).ready(function() {

				/* 	 	var siblings = $("#slist").find("td").siblings("td");
						var start = new Date($(siblings).eq(2).text().substring(0,10)); // Jul 02 2012 
						var end = new Date($(siblings).eq(2).text().substring(13));
						var today = new Date();  
						var total = end - start; 
						var progress = today - start; 

						var p = Math.round(progress/ total * 100) + "%"; 
						
						$(".progressbar").css("width", p);   */
						

		$(".btn-look").on("click", function() {
			window.location.assign("${pageContext.request.contextPath}/views/student/student_score2.jsp");
		});
	
	});
</script>
</head>
<body>

	<div class="page">

		<%@ include file="/WEB-INF/views/partials/student_header.jsp"%>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<%@ include file="/WEB-INF/views/partials/student_sidebar.jsp"%>
			<div class="content-inner">

				<!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/student/first">HOME</a></li>
						<li class="breadcrumb-item active"><a href="">성적 조회</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">성적 조회</h3>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-sm-2">
												<img src="${pageContext.request.contextPath}/resources/img/${stinfo.student_photo_filepath}" height="182px">
											</div>
											<div class="col-sm-10">
												<table class="table table-bordered text-center">
													<tbody>
														<tr>
															<td>수강생 번호</td>
															<td>${stinfo.student_id}</td>
														</tr>
														<tr>
															<td>수강생 이름</td>
															<td>${stinfo.student_name}</td>
														</tr>
														<tr>
															<td>수강생 휴대폰번호</td>
															<td>${stinfo.student_phone}</td>
														</tr>
														<tr>
															<td>수강생 등록일</td>
															<td>${stinfo.student_regDate}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<div class="table-responsive list">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과정 번호</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>진행 상황</th>
														<th>수료 여부</th>
														<th>성적</th>
													</tr>
												</thead>
												<tbody id="slist">
													<c:forEach var="s" items="${list}">
														<tr>
															<td>${s.open_course_id}</td>
															<td>${s.course_name}</td>
															<td>${s.open_course_start_date}~
																${s.open_course_end_date}</td>
															<td>${s.classroom_name}</td>
															<td>
																<div class="progress">
																	<div class="progress-bar bg-primary progressbar"
																		role="progressbar" style="width: ${s.percent}%"
																		aria-valuemax="100">
																	</div>
																</div>
															</td>
															<td>${s.completion_status} </td>
															<td>
																<form action="${pageContext.request.contextPath}/student/score2" method="POST">
																	<input type="hidden" name=student_id value="${sessionScope.student.student_id}">
																	<input type="hidden" name="open_course_id" value="${s.open_course_id}">
																	<button type="submit" class="btn btn-sm btn-light btn-look">성적 조회</button>
																</form>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Page Footer-->
				<%@ include file="/WEB-INF/views/partials/footer.jsp"%>
			</div>
		</div>
	</div>

	<!-- JavaScript files-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/popper.js/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/charts-home.js"></script>
    
    <!-- Main File-->
    <script src="${pageContext.request.contextPath}/resources/js/front.js"></script>

</body>
</html>