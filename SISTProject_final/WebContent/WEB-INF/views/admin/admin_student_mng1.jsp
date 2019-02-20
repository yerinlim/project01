<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>수강생 관리</title>
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
						$(".btnSearch")
								.on(
										"click",
										function() {
											window.location
													.assign("${pageContext.request.contextPath}/admin/student/mng2?student_id="
															+ $(this).val());
										});

						$(".student-look").popover({
							placement : 'left',
							trigger : "hover",
							html : true
						});

						$(".btn-update").on(
								"click",
								function() {

									$("#student_update #student_id").val(
											$(this).val());
									$("#student_update #student_id").attr(
											"placeholder", $(this).val());

								});

						$(".btn-del").on(
								"click",
								function() {

									var student_name = $(this).parent()
											.siblings().eq(1).text();

									$("#student_delete #student_id").val(
											$(this).val());
									$("#student_delete #student_id").attr(
											"placeholder", $(this).val());

									$("#student_delete #student_name").attr(
											"placeholder", student_name);

								});

						$(".btn-reset").on(
								"click",
								function() {

									var student_name = $(this).parent()
											.siblings().eq(1).text();

									$("#password_reset #student_id").val(
											$(this).val());
									$("#password_reset #student_id").attr(
											"placeholder", $(this).val());

									$("#password_reset #student_name").attr(
											"placeholder", student_name);

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
							href="${pageContext.request.contextPath}/views/admin/admin_first.jsp">HOME</a></li>
						<li class="breadcrumb-item active"><a
							href="${pageContext.request.contextPath}/views/admin/admin_student_mng1.jsp">수강생
								관리</a></li>
					</ul>
				</div>

				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h4>
											<strong>전체 수강생 목록</strong>
										</h4>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<button class="btn btn-primary btn-sm btn-reg"
											data-toggle="modal" data-target="#student_reg">수강생
											등록</button>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>수강생 번호</th>
														<th>수강생 이름</th>
														<th>수강생 휴대폰번호</th>
														<th>수강생 등록일</th>
														<th>수강 횟수</th>
														<th>수강내역 조회</th>
														<th>수정</th>
														<th>삭제</th>
														<th>비밀번호 초기화</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="st" items="${list}">
														<tr>
															<td>${st.student_id}</td>
															<td><a class="student-look popover-bold"
																data-toggle="popover" title="${st.student_name} 사진"
																data-content="<img src='${pageContext.request.contextPath}/resources/img/${st.student_photo_filepath}' width='120' height='144'/>">${st.student_name}</a></td>
															<td>${st.student_phone}</td>
															<td>${st.student_regDate}</td>
															<td>${st.count_}</td>
															<td><button class="btn btn-sm btn-light btnSearch"
																	value="${st.student_id}">조회</button></td>
															<td><button class="btn btn-sm btn-light btn-update"
																	data-toggle="modal" data-target="#student_update"
																	value="${st.student_id}">수정</button></td>
															<td><button class="btn btn-sm btn-light btn-del"
																	data-toggle="modal" data-target="#student_delete"
																	value="${st.student_id}"
																	${st.count_>=1?"disabled='disabled'":""}>삭제</button></td>
															<td><button class="btn btn-sm btn-light btn-reset"
																	data-toggle="modal" data-target="#password_reset"
																	value="${st.student_id}">초기화</button></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<div style="text-align: center; padding-top: 10px">
											<button class="btn btn-primary" id="prev">이전</button>
											<button class="btn btn-primary" id="next">다음</button>

											<form
												action="${pageContext.request.contextPath}/admin/student/mng1/search"
												style="float: right" class="form-inline" method="post">
												<div>
													<div class="form-group">
														<!-- 검색 단어 입력 폼 -->
														<!-- 검색 기준은 각자 상황에 맞춰서 설정하세요!! -->
														<select class="form-control text-small" id="key"
															name="key">
															<option class="text-small" value="student_id">Gid</option>
															<option class="text-small" value="student_name">Name</option>
															<option class="text-small" value="student_phone">Phone</option>
															<option class="text-small" value="student_regDate">RegDate</option>
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


	<!-- 수강생 등록에 관한 모달 -->
	<div id="student_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">수강생 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/admin/student/mng1/insert"
						method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="student_name">이름</label> <input type="text"
								id="student_name" name="student_name" placeholder="이름"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_pw">비밀번호</label> <input type="password"
								id="student_pw" name="student_pw" placeholder="비밀번호"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_phone">휴대폰번호</label> <input type="text"
								id="student_phone" name="student_phone" placeholder="휴대폰번호"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_regDate">등록일</label> <input type="date"
								id="student_regDate" name="student_regDate" placeholder="등록일"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_photo">사진 파일</label> <input type="file"
								id="student_photo_file" name="student_photo_file"
								placeholder="사진 파일" class="form-control">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" data-dismiss="modal"
								class="btn btn-secondary">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- 수강생 수정에 관한 모달 -->
	<div id="student_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">수강생 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form
						action="${pageContext.request.contextPath}/admin/student/mng1/update"
						method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label for="student_id">수강생 번호</label> <input type="text"
								id="student_id" name="student_id" placeholder="수강생 번호"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="student_name">이름</label> <input type="text"
								id="student_name" name="student_name" placeholder="이름"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_phone">휴대폰번호</label> <input type="text"
								id="student_phone" name="student_phone" placeholder="휴대폰번호"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_regDate">등록일</label> <input type="date"
								id="student_regDate" name="student_regDate" placeholder="등록일"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="student_photo">사진 파일</label> <input type="file"
								id="student_photo_file" name="student_photo_file"
								placeholder="사진 파일" class="form-control">
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


	<!-- 수강생 삭제에 관한 모달 -->
	<div id="student_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">수강생 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<p>다음 수강생 정보를 삭제하시겠습니까?</p>
					<form
						action="${pageContext.request.contextPath}/admin/student/mng1/delete"
						method="post">
						<div class="form-group">
							<label for="student_id">수강생 번호</label> <input type="text"
								id="student_id" name="student_id" placeholder="수강생번호"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="student_name">이름</label> <input type="text"
								id=student_name name="student_name" placeholder="이름"
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

	<!-- 비밀번호 초기화에 관한 모달 -->
	<div id="password_reset" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">비밀번호 초기화</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<p>다음 수강생 비밀번호를 초기화하시겠습니까?</p>
					<form
						action="${pageContext.request.contextPath}/admin/student/mng1/pwupdate"
						method="post">
						<div class="form-group">
							<label for="student_id">수강생번호</label> <input type="text"
								id="student_id" name="student_id" placeholder="수강생번호"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="student_name">이름</label> <input type="text"
								id="student_name" name="student_name" placeholder="이름"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="student_pw">신규 비밀번호</label> <input type="password"
								id="student_new_pw" name="student_new_pw"
								placeholder="신규 비밀번호" class="form-control">
						</div>
						<div class="form-group">
							<label for="student_pw2">신규 비밀번호 확인</label> <input
								type="password" id="student_new_pw2" name="student_new_pw2"
								placeholder="신규 비밀번호 확인" class="form-control">
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