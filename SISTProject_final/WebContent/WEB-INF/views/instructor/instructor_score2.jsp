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
		$(".btn-student").on("click", function() {
			$("#card").css("display","block");
			var exam_id = $(this).parents("tr").find("td:eq(0)").text();
	   			$.ajax({
	   				url : "${pageContext.request.contextPath}/instructor/score2Ajax",
	   				dataType : 'json',
	   				type : 'Post',
	   				data : {
	   					open_subject_id : "${os.open_subject_id}",
	   					exam_id : exam_id
	   				},
	   				success : function(result) {
	   					var doc = JSON.stringify(result);
						var array = JSON.parse(doc);

	   					var txt = "";
	   					
   						txt += "<div class='card'>";
   						txt += "<div class='card-header d-flex align-items-center'>";
   						txt += "	<h3 class='h3'>수강생 정보</h3>";
   						txt += "</div>";
   						txt += "<div class='card-body'>";
   						txt += "	<div class='table-responsive'>";
   						txt += "		<table class='table'>";
   						txt += "			<thead>";
   						txt += "				<tr>";
   						txt += "					<th>수강생 번호</th>";
   						txt += "					<th>수강생 이름</th>";
   						txt += "					<th>수강생 휴대폰번호</th>";
   						txt += "					<th>수강생 등록일</th>";
   						txt += "					<th>수료 여부</th>";
   						txt += "					<th>날짜</th>";
   						txt += "					<th>출석 점수</th>";
						txt += "					<th>필기 점수</th>";
						txt += "					<th>실기 점수</th>";
						txt += "					<th>총점</th>";
						txt += "					<th>성적</th>";
						txt += "				</tr>";
						txt += "			</thead>";
						txt += "			<tbody>";

	   					for(var i=0; i<array.length; i++) {
	   						var item = array[i];
	   						
	   						var student_regDate = new Date(item.student_regDate);
	   						var completion_date = new Date(item.completion_date);
	   					
	   						txt += "<tr>"
	   						txt += "<td>" + item.student_id + "</td>";
	   						txt += "<td>" + item.student_name + "</td>";
	   						txt += "<td>" + item.student_phone + "</td>";
	   						txt += "<td>" + student_regDate.toISOString().slice(0,10) + "</td>";
	   						txt += "<td>" + item.completion_status + "</td>";
	   						txt += "<td>" + completion_date.toISOString().slice(0,10) + "</td>";
	   						txt += "<td>" + item.attendance_score + "</td>";
	   						txt += "<td>" + item.write_score + "</td>";
	   						txt += "<td>" + item.skill_score + "</td>";
	   						txt += "<td>" + item.total_score + "</td>";
	   						txt += "<td>" + "<div class='btn-group'>" + 
	   									"<button class='btn btn-light btn-sm btn-look1' data-toggle='modal' data-target='#score_reg' value='" + item.student_id + "'>입력</button>" + 
	   									"<button class='btn btn-sm btn-light btn-del' data-toggle='modal' data-target='#score_del'>삭제</button></div>" + 
	   								"</td>"
	   						txt += "</tr>";
	   					}
	   					
						txt += "		</tbody>";
   						txt += "	</table>";
						txt += "	</div>";
						txt += "</div>";
	   					
	   					$("#second_table").html(txt);
	   					
	   				}
	   			}); 
	        }); 
      
		$(document).on("click", ".btn-look1", function() {

			var student_name = $(this).parent().parent().siblings().eq(1).text();
			var student_phone = $(this).parent().parent().siblings().eq(2).text();

			var student_info = student_name + " / "	+ student_phone;
			
			$("#score_reg #student_info").html(student_info);
		});
		
		$(document).on("click", ".btn-del", function() {

			var student_id = $(this).parent().parent().siblings().eq(0).text();
			var student_name = $(this).parent().parent().siblings().eq(1).text();
			
			$("#score_del #student_id").val(student_id);
			$("#score_del #student_name").val(student_name);
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
			<%@ include file="/WEB-INF/views/partials/instructor_sidebar.jsp"%>
			<div class="content-inner">

				<!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/instructor/first">HOME</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/instructor/score1">성적 관리</a></li>
						<li class="breadcrumb-item active"><a href="">시험 정보</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<c:forEach var="o" items="${list2}">
											<h3 class="h4">${o.course_name}
												(${o.open_course_start_date} ~ ${o.open_course_end_date})
												<br>
												${o.subject_name} (${o.subject_start_date} ~
												${o.subject_end_date})</h3>
										</c:forEach>
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
														<th>시험 문제</th>
														<th>성적 등록 인원수</th>
														<th>성적 입력 여부</th>
														<th>수강생 정보</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="e" items="${list}">
														<tr>
															<td>${e.exam_id}</td>
															<td>${e.attendance_point}</td>
															<td>${e.write_point}</td>
															<td>${e.skill_point}</td>
															<td>${e.exam_date}</td>
															<td>${e.exam_file}</td>
															<td>${e.student_count}</td>
															<td>${e.score_status}</td>
															<td>
																<button	class="btn btn-sm btn-light btn-student">보기</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div id="second_table"></div>
							</div>
						</div>
					</div>
				</section>
				<!-- Page Footer-->
				<%@ include file="/WEB-INF/views/partials/footer.jsp"%>
			</div>
		</div>
	</div>

	<!-- 등록에 관한 모달 -->
	<div id="score_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">성적 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close" class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form action="${pageContext.request.contextPath}/instructor/score2/insert" method="post">
					<div class="modal-body">
					<h5 id="student_info"></h5>
						<div class="form-group">
							<label for="attendance_score">출석 점수</label> 
							<input type="text" id="attendance_score" name="attendance_score" placeholder="출석 점수" class="form-control">
						</div>
						<div class="form-group">
							<label for="write_score">필기 점수</label> 
							<input type="text" id="write_score" name="write_score" placeholder="필기 점수" class="form-control">
						</div>
						<div class="form-group">
							<label for="skill_score">실기 점수</label> 
							<input type="text" id="skill_score" name="skill_score" placeholder="실기 점수" class="form-control">
						</div>
						<input type="hidden" name="student_id" id="student_id" value="">
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" data-dismiss="modal" class="btn btn-secondary">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 삭제에 관한 모달 -->
	<div id="score_del" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">성적 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close" class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form action="${pageContext.request.contextPath}/instructor/score2/delete" method="post">
					<div class="modal-body">
						<p>다음 성적 정보를 삭제하시겠습니까?</p>
						<div class="form-group">
							<label for="student_id">수강생 번호</label> 
							<input type="text" id="student_id" name="student_id" placeholder="" class="form-control" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="student_name">이름 </label> 
							<input type="text" id="student_name" name="student_name" placeholder="" class="form-control" readonly="readonly">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">확인</button>
						<button type="button" data-dismiss="modal" class="btn btn-secondary">취소</button>
					</div>
				</form>
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