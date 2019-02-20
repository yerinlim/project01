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
    <link rel="shortcut icon" href="img/favicon.ico">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <script src="${pageContext.request.contextPath}/resources/script/common.js"></script>
    
	<script>
	
		$(document).ready(function() {
		
			
			$(".btn-lookone").on("click", function() {

						var open_subject_id = $(this).val();
						
						var subject_name = $(this).parent().siblings().eq(1).text();
						var subject_date = $(this).parent().siblings().eq(2).text();
						
						
						$.ajax({
									url : "${pageContext.request.contextPath}/admin/osExamAjax",
									dataType : 'json',
									type : 'Post',
									data : {
										open_subject_id : open_subject_id
									},
									success : function(
											examList) {

										/* 
										var doc = JSON
												.stringify(examList);
										var array = JSON
												.parse(doc);
										 */
										 
										var array = examList; 
										 
										var txt = "";

										txt += "<div class=\"card\">";
										txt += "<div class=\"card-header\">";
										txt += "<h4>";
										txt += "<strong>"
												+subject_name +"("+ subject_date+")</strong> 시험 정보";
										txt += "</h4>";
										txt += "</div>";
										txt += "<div class=\"card-body\">";
										txt += "<div class=\"table-responsive\">";
										txt += "<table class=\"table\">";
										txt += "<thead>";
										txt += "		<tr>";
										txt += "		<th>시험 번호</th>";
										txt += "		<th>출결 배점</th>";
										txt += "		<th>필기 배점</th>";
										txt += "		<th>실기 배점</th>";
										txt += "		<th>시험 날짜</th>";
										txt += "		<th>시험 문제 파일</th>";
										txt += "		<th>수강생 정보</th>";
										txt += "		</tr>";
										txt += "	</thead>";
										txt += "		<tbody>";

										for (var a = 0; a < array.length; ++a) {
											var item = array[a];

											var exam_id = item.exam_id;
											var attendance_point = item.attendance_point;
											var write_point = item.write_point;
											var skill_point = item.skill_point;
											var exam_date = new Date(item.exam_date);
											var exam_file = item.exam_file;

											txt += "			<tr>";
											txt += "			<td>"
													+ exam_id
													+ "</td>";
											txt += "			<td>"
													+ attendance_point
													+ "</td>";
											txt += "			<td>"
													+ write_point
													+ "</td>";
											txt += "			<td>"
													+ skill_point
													+ "</td>";
											txt += "			<td>"
													+ exam_date.getFullYear() +"-" + digitConvert(exam_date.getMonth()+1) + "-" + digitConvert(exam_date.getDate())
													+ "</td>";
											txt += "			<td>"
													+ exam_file
													+ "</td>";
											txt += "			<td>"
													+ "<button class='btn btn-sm btn-light btn-looktwo' value=" + exam_id +">보기</button>"
													+ "</td>";
											txt += "		</tr>";
										}

										txt += "		</tbody>";
										txt += "	</table>";
										txt += "	</div>";
										txt += "	</div>";

										$("#demo")
												.html(txt);

									}
								});
					});
			
			
			$(document).on("click",".btn-looktwo", function() {
				
				var exam_id = $(this).val();
				
				var exam_date = $(this).parent().siblings().eq(4).text();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/studentScoreAjax",
					dataType : 'json',
					type : 'Post',
					data : {
						exam_id : exam_id
					},
					success : function(
							studentScoreList) {

						/* 
						var doc = JSON
								.stringify(studentScoreList);
						var array = JSON
								.parse(doc);
						 */
						 
						var array = studentScoreList;
						
						var txt = "";

						txt += "<div class=\"card\">";
						txt += "<div class=\"card-header\">";
						txt += "<h4>";
						
						txt += exam_id +"("+exam_date+")"+" 수강생 성적 정보";
						txt += "</h4>";
						txt += "</div>";
						txt += "<div class=\"card-body\">";
						txt += "<div class=\"table-responsive\">";
						txt += "<table class=\"table\">";
						txt += "<thead>";
						txt += "		<tr>";
						txt += "		<th>수강생 번호</th>";
						txt += "		<th>수강생 이름</th>";
						txt += "		<th>수강생 휴대폰번호</th>";
						txt += "		<th>출결 점수</th>";
						txt += "		<th>필기 점수</th>";
						txt += "		<th>실기 점수</th>";
						txt += "		<th>총점</th>";
						txt += "		</tr>";
						txt += "	</thead>";
						txt += "		<tbody>";

						for (var a = 0; a < array.length; ++a) {
							var item = array[a];

							var student_id = item.student_id;
							var student_name = item.student_name;
							var student_phone = item.student_phone;
							var attendance_score = item.attendance_score;
							var write_score = item.write_score;
							var skill_score = item.skill_score;
							var total_score = item.total_score;
							
							txt += "			<tr>";
							txt += "			<td>"
									+ student_id
									+ "</td>";
							txt += "			<td>"
									+ student_name
									+ "</td>";
							txt += "			<td>"
									+ student_phone
									+ "</td>";
							txt += "			<td>"
									+ attendance_score
									+ "</td>";
							txt += "			<td>"
									+ write_score
									+ "</td>";
							txt += "			<td>"
									+ skill_score
									+ "</td>";
							txt += "			<td>"
									+ total_score
									+ "</td>";
						
							txt += "		</tr>";
						}

						txt += "		</tbody>";
						txt += "	</table>";
						txt += "	</div>";
						txt += "	</div>";

						$("#demo2")
								.html(txt);

					}
				}); 
				
				
				
			});
			
			 
		});
		
		
		function digitConvert(digit) {
			var temp = digit;
			if (digit < 10) {
				temp = "0" + temp;
			}
			return temp;
		}
	
	</script>

</head>
<body>

	<div class="page">
        <!-- Main Navbar-->
        <%@ include file="/WEB-INF/views/partials/admin_header.jsp" %>
        <div class="page-content d-flex align-items-stretch">
            <!-- Side Navbar -->
            <%@ include file="/WEB-INF/views/partials/admin_sidebar.jsp" %>

            <div class="content-inner">

	            <!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/views/admin/admin_first.jsp">HOME</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/views/admin/admin_grade_opencourse1.jsp">개설 과정 성적 조회</a></li>
						<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/views/admin/admin_grade_opencourse2.jsp">과목 정보</a></li>
					</ul>
				</div>
				
				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
									<c:forEach var="t" items="${title}">
											<h3 class="h4">${t.course_name}(${t.open_course_start_date} ~ ${t.open_course_end_date}) 과목 정보</h3>
										</c:forEach>
										</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과목 번호</th>
														<th>과목명</th>
														<th>개설 과목 기간</th>
														<th>강사 이름</th>
														<th>교재명</th>
														<th>시험 정보</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="os" items="${list}">
														<tr>
															<td>${os.open_subject_id}</td>
															<td>${os.subject_name}</td>
															<td>${os.subject_start_date} ~ ${os.subject_end_date}</td>
															<td>${os.instructor_name}</td>
															<td>${os.subjectbook_name}</td>
															<td><button class="btn btn-sm btn-light btn-lookone" value="${os.open_subject_id}">보기</button></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div id="demo"></div>
							
								<!-- <div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">HTML(2018-09-01 ~ 2018-09-20)시험 정보</h3>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>시험 번호</th>
														<th>출결 배점</th>
														<th>필기 배점</th>
														<th>실기 배점</th>
														<th>시험 날짜</th>
														<th>시험 문제 파일</th>
														<th>수강생 정보</th>
														
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td>
															<button class="btn btn-sm btn-light">보기</button>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div> -->
								
								<div id="demo2"></div>
								
								<!-- 
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">홍길동 / 000-0000-000 성적 정보</h3>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>수강생 번호</th>
														<th>수강생 이름</th>
														<th>수강생 휴대폰번호</th>
														<th>출결 점수</th>
														<th>필기 점수</th>
														<th>실기 점수</th>
														<th>총점</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							 -->
							</div>
						</div>
					</div>
				</section>
                <!-- Page Footer-->
                <%@ include file="/WEB-INF/views/partials/footer.jsp" %>
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