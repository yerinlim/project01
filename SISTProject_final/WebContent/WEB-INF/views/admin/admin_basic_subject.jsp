<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>과목 관리</title>
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
			//삭제 액션처리
			$(".btn-del").on("click", function(){
				var subject_id=$(this).parents("tr").find("td:eq(0)").text();
				var subject_name=$(this).parents("tr").find("td:eq(1)").text();
				$("#subject_delete #subject_id").val(subject_id);
				$("#subject_delete #subject_name").val(subject_name);
			});
			
			$(".btn-update").on("click", function(){
				var subject_id=$(this).parents("tr").find("td:eq(0)").text();
				var subject_name=$(this).parents("tr").find("td:eq(1)").text();
				$("#subject_update #subject_id").val(subject_id);
				$("#subject_update #subject_name").val(subject_name);
			});
		});
	
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
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/first">HOME</a></li>
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/basic/course">기초 정보 관리</a></li>
						<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/basic/subject">과목 관리</a></li>
					</ul>
				</div>
				
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">과목 목록</h3>
									</div>
									<div class="card-body">
										<button class="btn btn-primary btn-sm btn-reg" data-toggle="modal" data-target="#subject_reg">과목 등록</button>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>과목번호</th>
		                                                <th>과목명</th>
		                                                <th>수정</th>
		                                                <th>삭제</th>
													</tr>
												</thead>
												<tbody>
		                                          <c:forEach var="sub" items= "${list}">
		                                          <tr>
		                                          	<td>${sub.subject_id}</td>
		                                          	<td>${sub.subject_name}</td>
		                                          	<td><button class="btn btn-sm btn-light btn-update"
																data-toggle="modal" data-target="#subject_update">수정</button></td>
													<td><button class="btn btn-sm btn-light btn-del"
																data-toggle="modal" data-target="#subject_delete" ${sub.count_>=1?"disabled='disabled'":""}>삭제</button></td>
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
                <%@ include file="/WEB-INF/views/partials/footer.jsp" %>
            </div>
        </div>
    </div>
    
	<!-- 등록에 관한 모달 -->
	<div id="subject_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">과목 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/basic/subject/insert" method="post">
				<div class="modal-body">
						<div class="form-group">
							<label for="subject_name">과목명</label> 
							<input type="text" id="subject_name" name="subject_name" placeholder="과목명" class="form-control">
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="button" data-dismiss="modal" class="btn btn-secondary">취소</button>
				</div>
					</form>
			</div>
		</div>
	</div>
	
	<!-- 수정에 관한 모달 -->
	<div id="subject_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">과목 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/basic/subject/update" method="post">
				<div class="modal-body">
						<div class="form-group">
							<label for="subject_id">과목번호</label> 
							<input type="text" id="subject_id" name="subject_id" placeholder="과목번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="subject_name">과목명</label> 
							<input type="text" id="subject_name" name="subject_name" placeholder="과목명" class="form-control" >
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" data-dismiss="modal" class="btn btn-secondary">취소</button>
				</div>
					</form>
			</div>
		</div>
	</div>
	
	<!-- 삭제에 관한 모달 -->
	<div id="subject_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">과목 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/basic/subject/delete" method="post">
				<div class="modal-body">
					<p>다음 과목을 삭제하시겠습니까?</p>
						<div class="form-group">
							<label for="subject_id">과목번호</label> 
							<input type="text" id="subject_id" name="subject_id" placeholder="과목번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="subject_name">과목명</label> 
							<input type="text" id="subject_name" name="subject_name" placeholder="과목명" class="form-control" readonly>
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
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/charts-home.js"></script>
    
    <!-- Main File-->
    <script src="${pageContext.request.contextPath}/resources/js/front.js"></script>

</body>
</html>