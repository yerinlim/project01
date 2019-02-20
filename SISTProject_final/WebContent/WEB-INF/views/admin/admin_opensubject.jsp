<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>개설 과목 관리</title>
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
	$(document).ready(
			function() {

				//검색 진행시 상태값 유지 설정
				$("#key option[value='${key}']").attr("selected", "selected");
				$("#value").val('${value}');

				$(".btn-update").on(
						"click",
						function() {

							$("#opensubject_update #open_subject_id").val(
									$(this).val());
							$("#opensubject_update #open_subject_id").attr(
									"placeholder", $(this).val());

						});

				$(".btn-del").on("click", function() {

					var subject_name = $(this).parent().siblings().eq(1).text();
					var subject_date = $(this).parent().siblings().eq(2).text();

					$("#opensubject_delete #open_subject_id").val($(this).val());
					$("#open_subject_id").attr("placeholder", $(this).val());

					$("#subject_name").attr("placeholder", subject_name);
					$("#subject_date").attr("placeholder", subject_date);

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
							href="${pageContext.request.contextPath}/views/admin/admin_first.jsp">Home</a></li>
						<li class="breadcrumb-item active"><a
							href="${pageContext.request.contextPath}/views/admin/admin_opensubject.jsp">개설
								과목 관리</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h3 class="h4">개설 과목 정보</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<button class="btn btn-primary btn-sm btn-reg"
											data-toggle="modal" data-target="#opensubject_reg">신규
											개설 과목 추가</button>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과목 번호</th>
														<th>과목명</th>
														<th>개설 과목 기간</th>
														<th>강사 이름</th>
														<th>교재명</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>수정</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="os" items="${list}">
														<tr>
															<td>${os.open_subject_id}</td>
															<td>${os.subject_name}</td>
															<td>${os.subject_start_date}~${os.subject_end_date}</td>
															<td>${os.instructor_name}</td>
															<td>${os.subjectbook_name}</td>
															<td>${os.course_name}</td>
															<td>${os.open_course_start_date}~
																${os.open_course_end_date}</td>
															<td>${os.classroom_name}</td>
															<td>
																<button class="btn btn-sm btn-light btn-update"
																	data-toggle="modal" data-target="#opensubject_update"
																	value="${os.open_subject_id}">수정</button>
															</td>
															<td>
																<button class="btn btn-sm btn-light btn-del"
																	data-toggle="modal" data-target="#opensubject_delete"
																	value="${os.open_subject_id}" 
																	${os.count_>=1?"disabled='disabled'":""}>삭제</button>
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
												action="${pageContext.request.contextPath}/admin/opensubject/search"
												style="float: right" class="form-inline" method="post">
												<div>
													<div class="form-group">
														<!-- 검색 단어 입력 폼 -->
														<!-- 검색 기준은 각자 상황에 맞춰서 설정하세요!! -->
														<select class="form-control text-small" id="key"
															name="key">
															<option class="text-small" value="open_subject_id">개설
																과목 번호</option>
															<option class="text-small" value="subject_name">개설
																과목명</option>
															<option class="text-small" value="instructor_name">강사명</option>
															<option class="text-small" value="course_name">개설
																과정명</option>

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
										<br>
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
	<div id="opensubject_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">신규 개설 과목 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/admin/opensubject/insert"
						method="post">
						<div class="form-group">
							<label for="courseNumSelect">개설 과정</label> <select
								class="form-control" id="open_course_id" name="open_course_id"
								required>
								<c:forEach var="oc" items="${openCourse}">
									<option value="${oc.open_course_id }">${oc.open_course_id} / ${oc.course_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="subjectSelect">과목</label> <select
								class="form-control" id="subject_id" name="subject_id" required>
								<c:forEach var="s" items="${subject}">
									<option value="${s.subject_id}">${s.subject_id} / ${s.subject_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="subjectStartDate">과목 시작일</label> <input type="date"
								class="form-control" id="subject_start_date"
								name="subject_start_date" required>
						</div>
						<div class="form-group">
							<label for="subjectEndDate">과목 종료일</label> <input type="date"
								class="form-control" id="subject_end_date"
								name="subject_end_date" required>
						</div>
						<div class="form-group">
							<label for="subjectBookSelect">교재</label> <select
								class="form-control" id="subjectbook_id" name="subjectbook_id"
								required>
								<c:forEach var="sb" items="${subjectbook}">
									<option value="${sb.subjectbook_id}">${sb.subjectbook_id} / ${sb.subjectbook_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="instructorSelect">강사</label> <select
								class="form-control" id="instructor_id" name="instructor_id"
								required>
								<c:forEach var="i" items="${instructor}">
									<option value="${i.instructor_id}">${i.instructor_id} / ${i.instructor_name}</option>
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


	<!-- 수정에 관한 모달 -->
	<div id="opensubject_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">신규 개설 과목 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/admin/opensubject/update"
						method="post">
						<div class="form-group">
							<label for="open_subject_id">개설 과목 번호</label> <input type="text"
								class="form-control" id="open_subject_id" name="open_subject_id"
								value="" readonly>
						</div>
						<div class="form-group">
							<label for="courseNumSelect">개설과정명</label> <select
								class="form-control" id="open_course_id"
								name="open_course_id" required>
								<c:forEach var="oc" items="${openCourse}">
									<option value="${oc.open_course_id }">${oc.open_course_id} / ${oc.course_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="subjectSelect">과목</label> <select
								class="form-control" id="subject_id" name="subject_id" required>
								<c:forEach var="s" items="${subject}">
									<option value="${s.subject_id}">${s.subject_id} / ${s.subject_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="subjectStartDate">과목 시작일</label> <input type="date"
								class="form-control" id="subject_start_date"
								name="subject_start_date" required>
						</div>
						<div class="form-group">
							<label for="subjectEndDate">과목 종료일</label> <input type="date"
								class="form-control" id="subject_end_date"
								name="subject_end_date" required>
						</div>
						<div class="form-group">
							<label for="subjectBookSelect">교재</label> <select
								class="form-control" id="subjectbook_id" name="subjectbook_id"
								required>
								<c:forEach var="sb" items="${subjectbook}">
									<option value="${sb.subjectbook_id}">${sb.subjectbook_id} / ${sb.subjectbook_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="instructorSelect">강사</label> <select
								class="form-control" id="instructor_id" name="instructor_id"
								required>
								<c:forEach var="i" items="${instructor}">
									<option value="${i.instructor_id}">${i.instructor_id} / ${i.instructor_name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">수정</button>
							<button type="button" data-dismiss="modal" class="btn btn-light">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 과목 삭제에 관한 모달 -->
	<div id="opensubject_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">개설 과목 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<p>다음 개설과목을 삭제하시겠습니까?</p>
					<form
						action="${pageContext.request.contextPath}/admin/opensubject/delete"
						method="post">
						<div class="form-group">
							<label for="open_subject_id">개설 과목 번호</label> <input type="text"
								class="form-control" id="open_subject_id" name="open_subject_id"
								value="" readonly>
						</div>
						<div class="form-group">
							<label for="subject_name">개설 과목명</label> <input type="text"
								id=subject_name name="subject_name" placeholder="과목명"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="subject_date">과목 기간</label> <input type="text"
								id="subject_date" name="subject_date" placeholder="과목 기간"
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