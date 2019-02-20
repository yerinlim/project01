<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>수강생 관리 > 수강생 과정 관리</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Fontastic Custom icon font-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontastic.css">
<!-- Google fonts - Poppins -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Favicon-->
<link rel="shortcut icon" href="img/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<script
	src="${pageContext.request.contextPath}/resources/script/common.js"></script>

<script>
	$(document)
			.ready(
					function() {

						$(".student-look").popover({
							placement : 'left',
							trigger : "hover",
							html : true
						});

						$(".btn-reg").on(
								"click",
								function() {

									var student_name = $(this).parent()
											.parent().siblings().eq(1).text();
									var student_phone = $(this).parent()
											.parent().siblings().eq(2).text();

									var temp = student_name + " / "
											+ student_phone;

									$("#myModal01 #student_id").val(
											$(this).val());
									$("#myModal01 #student_name").html(temp);

								});

						$(".btn-update")
								.on(
										"click",
										function() {

											var student_id = $(this).val();

											var student_name = $(this).parent()
													.parent().siblings().eq(1)
													.text();

											$
													.ajax({
														url : "${pageContext.request.contextPath}/admin/student/mng2Ajax",
														dataType : 'json',
														type : 'Post',
														data : {
															student_id : student_id
														},
														success : function(
																ocList) {

															var doc = JSON
																	.stringify(ocList);
															var array = JSON
																	.parse(doc);

															var txt = "";

															txt += "<div class=\"card\">";
															txt += "<div class=\"card-header\">";
															txt += "<h4>";
															txt += "<strong>"
																	+ student_name
																	+ "의 수강 과정</strong>";
															txt += "</h4>";
															txt += "</div>";
															txt += "<div class=\"card-body\">";
															txt += "<div class=\"table-responsive\">";
															txt += "<table class=\"table\">";
															txt += "<thead>";
															txt += "		<tr>";
															txt += "		<th>과정 번호</th>";
															txt += "		<th>과정명</th>";
															txt += "		<th>과정 기간</th>";
															txt += "		<th>수료 여부</th>";
															txt += "		<th>수료(중도탈락) 날짜</th>";
															txt += "		<th>중도탈락처리</th>";
															txt += "		</tr>";
															txt += "	</thead>";
															txt += "		<tbody>";

															for (var a = 0; a < array.length; ++a) {
																var item = array[a];

																var open_course_id = item.open_course_id;
																var course_name = item.course_name;
																var open_course_start_date = new Date(
																		item.open_course_start_date);
																var open_course_end_date = new Date(
																		item.open_course_end_date);
																var completion_status = item.completion_status;
																var student_id = item.student_id;
																var dropout_date = new Date(
																		item.dropout_date);

																txt += "			<tr>";
																txt += "			<td>"
																		+ open_course_id
																		+ "</td>";
																txt += "			<td>"
																		+ course_name
																		+ "</td>";
																txt += "			<td>"
																		+ open_course_start_date
																				.getFullYear()
																		+ "-"
																		+ (open_course_start_date
																				.getMonth() + 1)
																		+ "-"
																		+ open_course_start_date
																				.getDate()
																		+ " ~ "
																		+ open_course_end_date
																				.getFullYear()
																		+ "-"
																		+ (open_course_end_date
																				.getMonth() + 1)
																		+ "-"
																		+ open_course_end_date
																				.getDate()
																		+ "</td>";
																txt += "			<td>"
																		+ completion_status
																		+ "</td>";
																txt += "			<td>"
																		+ dropout_date
																				.getFullYear()
																		+ "-"
																		+ (dropout_date
																				.getMonth() + 1)
																		+ "-"
																		+ dropout_date
																				.getDate()
																		+ "</td>";
																txt += "			<td>"
																		+ "<button type=\"button\" class=\"btn btn-sm btn-light btn-look\""
												+"		data-toggle=\"modal\" data-target=\"#myModal03\""
												+"		value="+student_id+">처리</button>"
																		+ "</td>";

																txt += "		</tr>";
															}

															txt += "		</tbody>";
															txt += "	</table>";
															txt += "	</div>";
															txt += "	</div>";

															$("#demo")
																	.html(txt);
															
															
															$(".btn-look").on(
																	"click",
																	function() {

																		var open_course_id = $(this).parent()
																				.siblings().eq(0).text();
																		var course_name = $(this).parent()
																				.siblings().eq(1).text();
																		var course_date = $(this).parent()
																				.siblings().eq(2).text();

																		var temp = course_name + " / "
																				+ course_date;

																		$("#myModal03 #student_id").val(
																				$(this).val());
																		$("#myModal03 #open_course_id").val(open_course_id);
																		$("#myModal03 #course_name").html(temp);

																	});
															

														}
													});

										});

						

						$(".btn-del").on(
								"click",
								function() {

									var student_name = $(this).parent()
											.parent().siblings().eq(1).text();
									var student_phone = $(this).parent()
											.parent().siblings().eq(2).text();

									var temp = student_name + " / "
											+ student_phone;

									$("#myModal02 #student_id").val(
											$(this).val());
									$("#myModal02 #student_name").html(temp);

								});

					});
</script>

</head>
<body>

	<div class="page">
		<!-- Main Navbar-->
		<%@ include file="/WEB-INF/views/partials/admin_header.jsp"%>
		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<%@ include file="/WEB-INF/views/partials/admin_sidebar.jsp"%>
			<div class="content-inner">

				<!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/views/admin/admin_first.jsp">HOME</a></li>
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/views/admin/admin_student_mng1.jsp">수강생
								관리</a></li>
						<li class="breadcrumb-item active"><a
							href="${pageContext.request.contextPath}/views/admin/admin_student_mng2.jsp">수강생
								과정 관리</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h3 class="h4">수강생 과정 관리</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>수강생 번호</th>
														<th>수강생 이름</th>
														<th>수강생 휴대폰번호</th>
														<th>수강생 등록일</th>
														<th>수강 횟수</th>
														<th>과정 관리</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="st" items="${list}">
														<tr>
															<td>${st.student_id}</td>
															<td><a class="student-look popover-bold"
																data-toggle="popover" title="${st.student_name} 사진"
																data-content="<img src='${pageContext.request.contextPath}/resources/img/avatar-1.jpg' width='120' height='144'/>">${st.student_name}</a></td>
															<td>${st.student_phone}</td>
															<td>${st.student_regDate}</td>
															<td>${st.class_count}</td>
															<td>
																<div class="btn-group" role="group"
																	aria-label="Basic example">
																	<button type="button"
																		class="btn btn-sm btn-light btn-reg"
																		data-toggle="modal" data-target="#myModal01"
																		value="${st.student_id}">과정 등록</button>
																	<button type="button"
																		class="btn btn-sm btn-light btn-del"
																		data-toggle="modal" data-target="#myModal02"
																		value="${st.student_id}">과정 취소</button>
																	<button class="btn btn-sm btn-light btn-update"
																		value="${st.student_id}">중도 탈락</button>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div id="demo"></div>
							</div>
						</div>
					</div>
				</section>
				<!-- Page Footer-->
				<%@ include file="/WEB-INF/views/partials/footer.jsp"%>
			</div>
		</div>
	</div>


	<!-- 수강생 과정 등록 -->
	<div id="myModal01" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">수강생 과정 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<p id="student_name">홍길동 / 010-2356-4528</p>
						<br>
						<form
							action="${pageContext.request.contextPath}/admin/student/mng2/insert"
							method="post">
							<div class="form-group">
								<label for="exampleFormControlSelect3">개설 과정</label>
								<div class="form-group">
									<select class="form-control" id="open_course_id"
										name="open_course_id">
										<c:forEach var="oc" items="${openCourse}">
											<option value="${oc.open_course_id}">${oc.open_course_id}
												/ ${oc.course_name} / ${oc.open_course_start_date} ~
												${oc.open_course_end_date}</option>
										</c:forEach>
									</select> <input type="hidden" name="student_id" id="student_id"
										value="">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" data-dismiss="modal" class="btn btn-light">취소</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 수강생 과정 취소 -->
	<div id="myModal02" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">수강생 과정 취소</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<p id="student_name">홍길동 / 010-2356-4528</p>
						<br>
						<form
							action="${pageContext.request.contextPath}/admin/student/mng2/delete"
							method="post">
							<div class="form-group">
								<label for="exampleFormControlSelect3">개설 과정</label>
								<div class="form-group">
									<select class="form-control" id="open_course_id"
										name="open_course_id">
										<c:forEach var="oc" items="${studentCourse}">
											<option value="${oc.open_course_id }">${oc.open_course_id}
												/ ${oc.course_name} / ${oc.open_course_start_date} ~
												${oc.open_course_end_date}</option>
										</c:forEach>
									</select> <input type="hidden" name="student_id" id="student_id"
										value="">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" data-dismiss="modal" class="btn btn-light">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 수강생 중도 탈락 -->
	<div id="myModal03" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">수강생 중도 탈락</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<p>과정명</p>
						<p id="course_name">과정명</p>
						<br>
						<form
							action="${pageContext.request.contextPath}/admin/student/mng2/update"
							method="post">
							<div class="form-group">
								<label for="exampleFormControlSelect3">중도 탈락 날짜</label>
								<div class="input group">
									<input type="date" class="form-control" id="dropout_date"
										name="dropout_date" placeholder="날짜"> <input
										type="hidden" name="open_course_id" id="open_course_id"
										value="">
										<input
										type="hidden" name="student_id" id="student_id"
										value="">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" data-dismiss="modal" class="btn btn-light">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- JavaScript files-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/charts-home.js"></script>

	<!-- Main File-->
	<script src="${pageContext.request.contextPath}/resources/js/front.js"></script>

</body>
</html>