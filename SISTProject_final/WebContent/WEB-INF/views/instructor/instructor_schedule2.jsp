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

<script>
	$(document).ready(function() {
		
		$(".student-look").popover({ 
			placement : 'left',
			trigger: "hover", 
			html: true
		});

	});
</script>

</head>
<body>

	<div class="page">
		<!-- Main Navbar-->
		<%@ include file="/WEB-INF/views/partials/instructor_header.jsp"%>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<%@ include file="/WEB-INF/views/partials/instructor_sidebar.jsp" %>
			<div class="content-inner">
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/instructor/first">HOME</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/instructor/schedule1">강사 스케줄 조회</a></li>
						<li class="breadcrumb-item active"><a href="">수강생 정보</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h3">수강생 정보</h3>
									</div>
									<div class="card-body">
										<c:forEach var="o" items="${list}">
											<h4 class="h4"> 
												${o.course_name} (${o.open_course_start_date} ~ ${o.open_course_end_date}) / ${o.subject_name} (${o.subject_start_date} ~ ${o.subject_end_date})
											</h4>
										</c:forEach>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>수강생 번호</th>
														<th>수강생 이름</th>
														<th>수강생 휴대폰번호</th>
														<th>수강생 등록일</th>
														<th>수료 여부</th>
														<th>날짜</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="s" items="${list2}">
														<tr>
															<td>${s.student_id}</td>
															<td>${s.student_name}</td>
															<td>${s.student_phone} </td>
															<td>${s.student_regDate}</td>
															<td>${s.completion_status}</td>
															<td>${s.completion_date}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div style="text-align: center; padding-top: 10px">
											<button class="btn btn-primary" id="prev">이전</button>
											<button class="btn btn-primary" id="next">다음</button>
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
	<script	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/charts-home.js"></script>

	<!-- Main File-->
	<script src="${pageContext.request.contextPath}/resources/js/front.js"></script>

</body>
</html>