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
				
				var open_course_id = $(this).val();
				
				var open_course_name = $(this).parent().siblings().eq(1).text();
				var open_course_date = $(this).parent().siblings().eq(2).text();
				var student_id = $(this).parent().siblings().eq(5).text();
				console.log(student_id);
				
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/osAjax",
					dataType : 'json',
					type : 'Post',
					data : {
						open_course_id : open_course_id
					},
					success : function(
							opensubjectList) {

						/* 
						var doc = JSON
								.stringify(opensubjectList);
						var array = JSON
								.parse(doc);
						 */
						var array = opensubjectList;
						 
						var txt = "";

						txt += "<div class=\"card\">";
						txt += "<div class=\"card-header\">";
						txt += "<h4>";
						txt += "<strong>"
								+open_course_name +"("+ open_course_date+")</strong> 과목 정보";
						txt += "</h4>";
						txt += "</div>";
						txt += "<div class=\"card-body\">";
						txt += "<div class=\"table-responsive\">";
						txt += "<table class=\"table\">";
						txt += "<thead>";
						txt += "		<tr>";
						txt += "		<th>개설 과목 번호</th>";
						txt += "		<th>과목명</th>";
						txt += "		<th>개설 과목 기간</th>";
						txt += "		<th>강사 이름</th>";
						txt += "		<th>교재명</th>";
						txt += "		<th>시험 정보</th>";
						txt += "		</tr>";
						txt += "	</thead>";
						txt += "		<tbody>";

						for (var a = 0; a < array.length; ++a) {
							var item = array[a];

							var open_subject_id = item.open_subject_id;
							var subject_name = item.subject_name;
							var subject_start_date = new Date(item.subject_start_date);
							var subject_end_date = new Date(item.subject_end_date);
							var instructor_name = item.instructor_name;
							var subjectbook_name = item.subjectbook_name;
							

							txt += "			<tr>";
							txt += "			<td>"
									+ open_subject_id
									+ "</td>";
							txt += "			<td>"
									+ subject_name
									+ "</td>";
							txt += "			<td>"
									+ subject_start_date.getFullYear() +"-" + digitConvert(subject_start_date.getMonth()+1) + "-" + digitConvert(subject_start_date.getDate())
									+"~" 
									+ subject_end_date.getFullYear() +"-" + digitConvert(subject_end_date.getMonth()+1) + "-" + digitConvert(subject_end_date.getDate())
									+ "</td>";
							txt += "			<td>"
									+ instructor_name
									+ "</td>";
							txt += "			<td>"
									+ subjectbook_name
									+ "</td>";
							txt += "			<td hidden>"
									+ student_id
									+ "</td>";
							txt += "			<td>"
									+ "<button class='btn btn-sm btn-light btn-looktwo' value=" + open_subject_id +">보기</button>"
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
				
				var open_subject_id = $(this).val();
				
				var open_subject_date = $(this).parent().siblings().eq(2).text();
				var student_id = $(this).parent().siblings().eq(5).text();
				
				
				$.ajax({

					url : "${pageContext.request.contextPath}/admin/studentScoreAjax2",
					dataType : 'json',
			
					type : 'Post',
					data : {
						open_subject_id : open_subject_id,
						student_id : student_id
					},
					
					success : function(
							studentScoreList2) {

						/* var doc = JSON
								.stringify(studentScoreList2);
						var array = JSON
								.parse(doc); */
								
						var array = studentScoreList2;

						var txt = "";

						txt += "<div class=\"card\">";
						txt += "<div class=\"card-header\">";
						txt += "<h4>";
						
						txt += student_id +"의 "+open_subject_id+"("+open_subject_date+")"+" 성적 정보";
						txt += "</h4>";
						txt += "</div>";
						txt += "<div class=\"card-body\">";
						txt += "<div class=\"table-responsive\">";
						txt += "<table class=\"table\">";
						txt += "<thead>";
						txt += "		<tr>";
						txt += "		<th>시험 번호</th>";
						txt += "		<th>출결 점수(배점)</th>";
						txt += "		<th>필기 점수(배점)</th>";
						txt += "		<th>실기 점수(배점)</th>";
						txt += "		<th>총점</th>";
						txt += "		<th>시험 날짜</th>";
						txt += "		<th>시험 문제 파일</th>";
						txt += "		</tr>";
						txt += "	</thead>";
						txt += "		<tbody>";

						for (var a = 0; a < array.length; ++a) {
							var item = array[a];

							var exam_id = item.exam_id;
							var attendance_score = item.attendance_score;
							var attendance_point = item.attendance_point;
							var write_score = item.write_score;
							var write_point = item.write_point;
							var skill_score = item.skill_score;
							var skill_point = item.skill_point;
							var total_score = item.total_score;
							var exam_date = new Date(item.exam_date);
							
							
							var exam_file = item.exam_file;
							
							txt += "			<tr>";
							txt += "			<td>"
									+ exam_id
									+ "</td>";
							txt += "			<td>"
									+ attendance_score+"("+attendance_point+")"
									+ "</td>";
							txt += "			<td>"
									+ write_score+"("+write_point+")"
									+ "</td>";
							txt += "			<td>"
									+ skill_score+"("+skill_point+")"
									+ "</td>";
							txt += "			<td>"
									+ total_score
									+ "</td>";
							txt += "			<td>"
									+ exam_date.getFullYear() +"-" + digitConvert(exam_date.getMonth()+1) + "-" + digitConvert(exam_date.getDate())
									+ "</td>";
							txt += "			<td><a href=\"\">"
									+ exam_file
									+ "</a></td>";
						
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
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/views/admin/admin_grade_student1.jsp">수강생 개인 성적 조회</a></li>
						<!-- 자신이 현재 위치한 마지막에 active 클래스 추가 -->
						<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/views/admin/admin_grade_student2.jsp">과정 정보</a></li>
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
											<h3 class="h4">${t.student_name} / ${t.student_phone}수강 과정 정보</h3>
										</c:forEach>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과정 번호</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>개설 과목 등록 개수</th>
														<th>개설 과목</th>
													</tr>
												</thead>
												<tbody>
												<!-- 
													<tr>
		                                                <td>OC0015</td>
		                                                <td>Python &amp; Java 응용 SW 실무 개발자 양성 과정</td>
		                                                <td>2018-06-25~2019-01-17</td>
		                                                <td>2강의실</td>
		                                                <td>3개</td>
		                                                <td><button type="button" class=" btn btn-sm btn-light">보기</button></td>
		                                           </tr>
												 -->
												  <c:forEach var="oc" items="${list}">
		                                             <tr>
														<td>${oc.open_course_id}</td>
														<td>${oc.course_name}</td>
														<td>${oc.open_course_start_date} ~ ${oc.open_course_end_date}</td>
														<td>${oc.classroom_name}</td>
														<td>${oc.open_subject_count}</td>
														<td hidden>${oc.student_id}</td>
														<td><button class="btn-lookone btn btn-sm btn-light" value="${oc.open_course_id}">보기</button></td>
		                                            </tr>
		                                            </c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								
								<div id="demo"></div>
								<!-- 
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">Python &amp; Java 응용 SW 실무 개발자 양성 과정(2018-06-25~2019-01-17) 과목 정보</h3>
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
													<tr>
		                                                <td></td>
		                                                <td></td>
		                                                <td></td>
		                                                <td></td>
		                                                <td></td>
		                                                <td><button type="button" class=" btn btn-sm btn-light">보기</button></td>
		                                           </tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								 -->
								 <div id="demo2"></div>
								<!-- 
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">홍길동의Java SE(2018-06-25~2018-08-10) 시험 정보</h3>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>시험 번호</th>
														<th>출결 점수(배점)</th>
														<th>필기 점수(배점)</th>
														<th>실기 점수(배점)</th>
														<th>총점</th>
														<th>시험 날짜</th>
														<th>시험 문제 파일</th>
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