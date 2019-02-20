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
		
		lectureAjax('강의중');
		$("#lecture_ing").addClass("active");
		
		$(".btn-status").on("click", function() {
			var instructor_status = $(this).val();
			$(this).addClass("active");
			$(this).siblings().removeClass("active");
			lectureAjax(instructor_status);
	    });
		
		$(document).on("mouseover", ".subjectbook-look", function() {
			var subjectbook_isbn = $(this).attr("data-isbn"); 
			console.log(subjectbook_isbn);
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/book/info",
				data : {isbn : subjectbook_isbn},
				success : function(result) {
					var array = result.item;
    				for (var i = 0; i < array.length; ++i) {
    	                var item = array[i];
    	                var title = item.title;
    	                var publisher = item.publisher;
    	                var author = item.author;
    	                var priceStandard = item.priceStandard;
    	                var coverLargeUrl = item.coverLargeUrl;
    	            }
    				var dataContent = "<img src='" + coverLargeUrl + " 'width='120' height='144'><div><ul><li>저자 : " + author + "</li><li>가격 : " + priceStandard + "원 </li><li>출판사 : " + publisher + "</li></ul></div>";
    				$(".subjectbook-look").attr("data-content", dataContent);
				}
			});
			
			$(this).popover({
				placement : 'left',
				trigger : "hover",
				html : true
			});
		});
		
		function lectureAjax(instructor_status) {
			$.ajax({
				url : "${pageContext.request.contextPath}/instructor/lectureAjax",
				dataType : 'json',
				type : 'Post',
				data : {
					instructor_id : "${sessionScope.instructor.instructor_id}",
					instructor_status : instructor_status
				},
				success : function(result) {
					var doc = JSON.stringify(result);
					var array = JSON.parse(doc);
					
					var txt = "";
					
					for(var i=0; i<array.length; i++) {
						var item = array[i];
						
						var open_subject_id = item.open_subject_id;
						var subject_name = item.subject_name;
						var subject_start_date = new Date(item.subject_start_date);
						var subject_end_date = new Date(item.subject_end_date);
						var course_name = item.course_name;
						var open_course_start_date = new Date(item.open_course_start_date);
						var open_course_end_date = new Date(item.open_course_end_date);
						var classroom_name = item.classroom_name;
						var subjectbook_name = item.subjectbook_name;
						var subjectbook_isbn = item.subjectbook_isbn;
						var student_count = item.student_count;
						var instructor_status = item.instructor_status;

						txt += "<tr>";
						txt += "<td>" + open_subject_id + "</td>";
						txt += "<td>" + subject_name + "</td>";
						txt += "<td>" + subject_start_date.toISOString().slice(0,10) + " ~ " + 
										subject_end_date.toISOString().slice(0,10) + "</td>";
						txt += "<td>" + course_name + "</td>";
						txt += "<td>" + open_course_start_date.toISOString().slice(0,10) + " ~ " + 
										open_course_end_date.toISOString().slice(0,10) + "</td>";
						txt += "<td>" + classroom_name + "</td>";
						txt += "<td>" + 
								"<a class='subjectbook-look popover-bold' data-isbn='" + subjectbook_isbn + "'data-toggle='popover' title='" + subjectbook_name + "' data-content=''>" + subjectbook_name + "</a></td>";
						txt += "<td>" + student_count + "</td>";
						txt += "<td>" + instructor_status + "</td>";
						txt += "<td>" + 
								"<form action='${pageContext.request.contextPath}/instructor/schedule2' method='post'>" + 
								"<input type='hidden' name='open_subject_id' value='" + open_subject_id + "'>" + 
								"<button class='btn btn-sm btn-light btn-look'>보기</button></form>" + 
								"</td>";
						txt += "</tr>";
					}
					
					$("#tbody_lecture").html(txt);
				}	
			});
		}
	});

</script>
</head>
<body>

	<div class="page">
		<!-- Main Navbar-->
		<%@ include file="/WEB-INF/views/partials/instructor_header.jsp"%>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<%@ include file="/WEB-INF/views/partials/instructor_sidebar.jsp"%>
			<div class="content-inner">

				<!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/instructor/first">HOME</a></li>
						<li class="breadcrumb-item active"><a href="">강사 스케줄 조회</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h3">강사 스케줄 조회</h3>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-sm-2">
												<img src="${pageContext.request.contextPath}/resources/img/${list.instructor_photo_filepath}" height="182px">
											</div>
											<div class="col-sm-10">
												<table class="table table-bordered text-center">
													<tbody>
														<tr>
															<td>강사 번호</td>
															<td>${list.instructor_id}</td>
														</tr>
														<tr>
															<td>강사 이름</td>
															<td>${list.instructor_name}</td>
														</tr>
														<tr>
															<td>강사 휴대폰 번호</td>
															<td>${list.instructor_phone}</td>
														</tr>
														<tr>
															<td>강사 등록일</td>
															<td>${list.instructor_regDate}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

										<div class="btn-group">
											<button type="button" class="btn btn-sm btn-light btn-status" id="lecture_end" value="강의종료">강의 종료</button>
											<button type="button" class="btn btn-sm btn-light btn-status" id="lecture_ing" value="강의중">강의 중</button>
											<button type="button" class="btn btn-sm btn-light btn-status" id="lectrue_begin" value="강의예정">강의 예정</button>
										</div>
										
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과목 번호</th>
														<th>과목명</th>
														<th>개설 과목 기간</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>교재명</th>
														<th>수강생 등록 인원</th>
														<th>강의 진행 여부</th>
														<th>수강생 정보</th>
													</tr>
												</thead>
												<tbody id="tbody_lecture"></tbody>
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