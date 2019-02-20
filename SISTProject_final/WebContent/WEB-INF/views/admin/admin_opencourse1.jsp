<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>개설 과정 관리</title>
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
						$(".btn-look")
								.on(
										"click",
										function() {
											window.location
													.assign("${pageContext.request.contextPath}/admin/opencourse2?open_course_id="
															+ $(this).val());
										});

						$(".btn-update")
								.on(
										"click",
										function() {

											$(
													"#opencourse_update #open_course_id")
													.val($(this).val());
											$(
													"#opencourse_update #open_course_id")
													.attr("placeholder",
															$(this).val());

										});

						$(".btn-del").on(
								"click",
								function() {

									var course_name = $(this).parent()
											.siblings().eq(1).text();
									var course_date = $(this).parent()
											.siblings().eq(2).text();

									$("#opencourse_delete #open_course_id")
											.val($(this).val());
									$("#open_course_id").attr("placeholder",
											$(this).val());

									$("#course_name").attr("placeholder",
											course_name);
									$("#course_date").attr("placeholder",
											course_date);

								});

						//검색 진행시 상태값 유지 설정
						$("#key option[value='${key}']").attr("selected",
								"selected");
						$("#value").val('${value}');

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
							href="${pageContext.request.contextPath}/views/admin/admin_first.jsp">Home</a></li>
						<li class="breadcrumb-item active"><a
							href="${pageContext.request.contextPath}/views/admin/admin_opencourse1.jsp">개설
								과정 관리</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">개설 과정 정보</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<button class="btn btn-primary btn-sm btn-reg"
											data-toggle="modal" data-target="#opencourse_reg">신규
											개설 과정 등록</button>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과정 번호</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>개설 과목 등록 개수</th>
														<th>수강생 등록 인원</th>
														<th>개설 과목</th>
														<th>수정</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="oc" items="${list}">
														<tr>
															<td>${oc.open_course_id}</td>
															<td>${oc.course_name}</td>
															<td>${oc.open_course_start_date}~${oc.open_course_end_date}</td>
															<td>${oc.classroom_name}</td>
															<td>${oc.open_subject_count}</td>
															<td>${oc.student_count}</td>
															<td>
																<button class="btn btn-sm btn-light btn-look"
																	id="openSubject" value="${oc.open_course_id}">보기</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-sm btn-light btn-update"
																	data-toggle="modal" data-target="#opencourse_update"
																	value="${oc.open_course_id}">수정</button>
															</td>
															<td>
																<button type="button"
																	class="btn btn-sm btn-light btn-del"
																	data-toggle="modal" data-target="#opencourse_delete"
																	value="${oc.open_course_id}"
																	${oc.student_count>=1?"disabled='disabled'":""}>삭제</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div style="text-align: center; padding-top: 10px">
											<button class="btn btn-primary" id="prev">이전</button>
											<button class="btn btn-primary" id="next">다음</button>

											<form
												action="${pageContext.request.contextPath}/admin/opencourse1/search" 
												style="float: right" class="form-inline" method="post">
												<div>
													<div class="form-group">
														<select class="form-control text-small" id="key"
															name="key">
															<option class="text-small" value="open_course_id">개설
																과정 번호</option>
															<option class="text-small" value="course_name">과정명</option>
														</select> <input type="text" class="form-control" id="value"
															name="value" placeholder="Search">
														<!-- 검색 진행 버튼 -->
														<button type="submit" class="btn btn-md btn-light"
															id="btnSearch">
															<i class="fa fa-search"></i>
														</button>
													</div>
												</div>
											</form>
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

	<!-- 등록에 관한 모달 -->
	<div id="opencourse_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">신규 개설 과정 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/admin/opencourse1/insert"
						method="post">
						<div class="form-group">
							<label for="courseSelect">과정명</label> <select
								class="form-control" id="course_id" name="course_id" required>
								<c:forEach var="c" items="${course}">
									<option value="${c.course_id}">${c.course_id}/
										${c.course_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="courseStartDate">과정 시작일</label> <input type="date"
								class="form-control" id="open_course_start_date"
								name="open_course_start_date" required>
						</div>
						<div class="form-group">
							<label for="courseEndDate">과정 종료일</label> <input type="date"
								class="form-control" id="open_course_end_date"
								name="open_course_end_date" required>
						</div>
						<div class="form-group">
							<label for="classroomSelect">강의실</label> <select
								class="form-control" id="classroom_id" name="classroom_id"
								required>
								<c:forEach var="c" items="${classroom}">
									<option value="${c.classroom_id}">${c.classroom_id}/
										${c.classroom_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" data-dismiss="modal" class="btn btn-light">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 과정 수정에 관한 모달 -->
	<div id="opencourse_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">과정 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/admin/opencourse1/update"
						method="post">
						<div class="form-group">
							<label for="open_course">개설과정번호</label> <input type="text"
								id="open_course_id" name="open_course_id" placeholder="과정명"
								class="form-control" value="" readonly>
						</div>
						<div class="form-group">
							<label for="courseSelect">과정명</label> <select
								class="form-control" id="course_id" name="course_id" required>
								<c:forEach var="c" items="${course}">
									<option value="${c.course_id}">${c.course_id}/${c.course_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="courseStartDate">과정 시작일</label> <input type="date"
								class="form-control" id="open_course_start_date"
								name="open_course_start_date" required>
						</div>
						<div class="form-group">
							<label for="courseEndDate">과정 종료일</label> <input type="date"
								class="form-control" id="open_course_end_date"
								name="open_course_end_date" required>
						</div>
						<div class="form-group">
							<label for="classroomSelect">강의실</label> <select
								class="form-control" id="classroom_id" name="classroom_id"
								required>
								<c:forEach var="c" items="${classroom}">
									<option value="${c.classroom_id}">${c.classroom_id}/${c.classroom_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="button" data-dismiss="modal"
								class="btn btn-secondary">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 과정 삭제에 관한 모달 -->
	<div id="opencourse_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">과정 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<p>다음 과정을 삭제하시겠습니까?</p>
					<form
						action="${pageContext.request.contextPath}/admin/opencourse1/delete"
						method="post">
						<div class="form-group">
							<label for="open_course_id">개설과정번호</label> <input type="text"
								id="open_course_id" name="open_course_id" placeholder="과정명"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="open_course_name">과정명</label> <input type="text"
								id=course_name name="course_name" placeholder="과정명"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="open_course_date">과정 기간</label> <input type="text"
								id="course_date" name="course_date" placeholder="과정 기간"
								class="form-control" readonly>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">확인</button>
							<button type="button" data-dismiss="modal"
								class="btn btn-secondary">취소</button>
						</div>
					</form>
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