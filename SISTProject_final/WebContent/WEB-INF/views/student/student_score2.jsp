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
		$(".instructor-look").popover({
			placement : 'left',
			trigger : "hover",
			html : true
		});
		
		$("a[rel]").on("mouseover", function(){
    		var isbn = $(this).attr("rel");
    		var s="a[rel="+isbn+"]";
    		$.ajax({
    			url: "${pageContext.request.contextPath}/admin/book/info"
    			,data: {isbn:isbn}
    			,success: function(data_) {
    				var array = data_.item;
    				for (var i = 0; i < array.length; ++i) {
    	                var item = array[i];
    	                var title = item.title;
    	                var publisher = item.publisher;
    	                var author = item.author;
    	                var priceStandard = item.priceStandard;
    	                var coverLargeUrl = item.coverLargeUrl;
    	                console.log(author);
    	            }

    				var dataContent = "<img src='" + coverLargeUrl + " 'width='120' height='144'><div><ul><li>저자 : " + author + "</li><li>가격 : " + priceStandard + "원 </li><li>출판사 : " + publisher + "</li></ul></div>";
    				$(".subjectbook-look").attr("data-content", dataContent);
    		}});
    	});

	 	$(".subjectbook-look").popover({
			placement : 'left',
			trigger : "hover",
			html : true
		});
	});
</script>

</head>
<body>

	<div class="page">
		<!-- Main Navbar-->
		<%@ include file="/WEB-INF/views/partials/student_header.jsp"%>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<%@ include file="/WEB-INF/views/partials/student_sidebar.jsp"%>
			<div class="content-inner">

				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/student/first">HOME</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/student/score1">성적 조회</a></li>
						<li class="breadcrumb-item active"><a href="">수강생 성적 조회</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">

								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h3">${sessionScope.student.student_name} 수강생 성적 조회</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->

										<div class="table-responsive">
											<table class="table" >
												<thead>
													<tr>
														<th>개설 과정 번호</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>진행 상황</th>
														<th>수료 여부</th>
													</tr>
												</thead>
												<tbody>
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
																		aria-valuemax="100"></div>
																</div>
															</td>
															<td>${s.completion_status}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header d-flex align-items-center"></div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table" id="forRowspan">
												<thead>
													<tr>
														<th>과목명</th>
														<th>교재명</th>
														<th>강사 이름</th>
														<th>시험 날짜</th>
														<th>출결 점수(배점)</th>
														<th>필기 점수(배점)</th>
														<th>실기 점수(배점)</th>
														<th>시험 문제</th>
													</tr>
												</thead>
												<tbody>
												
													<c:forEach var="s2" items="${list2}">
														<tr>
															<td> ${s2.subject_name}<br>(${s2.subject_start_date}~${s2.subject_end_date})</td>
															<td><a class="subjectbook-look popover-bold" rel="${s2.subjectbook_isbn}"
															data-toggle="popover" title="${s2.subjectbook_name}"
															data-content="" > <span>${s2.subjectbook_name}</span></a></td>
															<td><a
																class="instructor-look popover-bold"
																data-toggle="popover" title="${s2.instructor_name}<br>${s2.instructor_phone}"
																data-content="<img src='${pageContext.request.contextPath}/resources/img/${s2.instructor_photo_filepath}' width='120' height='144'/>">${s2.instructor_name}</a></td>
															<td>${s2.exam_date}</td>
															<td>${s2.attendance_score}(${s2.attendance_point})</td>
															<td>${s2.skill_score}(${s2.skill_point})</td>
															<td>${s2.write_score}(${s2.write_point})</td>
															<td>${s2.exam_file}<br>
																<button type="button" class="btn btn-xs btn-light">다운로드</button></td>
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