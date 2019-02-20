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

		});
	
	</script>

</head>
<body>

	<div class="page">
        <!-- Main Navbar-->
        <%@ include file="/WEB-INF/views/partials/superadmin_header.jsp" %>
        <div class="page-content d-flex align-items-stretch">
            <!-- Side Navbar -->
            <%@ include file="/WEB-INF/views/partials/superadmin_sidebar.jsp" %>

            <div class="content-inner">

	            <!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item active"><a href="">HOME</a></li>
					</ul>
				</div>
				
				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">계정 출력</h3>
									</div>
									<div class="card-body">
									<button class="btn btn-primary btn-sm btn-reg"
											data-toggle="modal" data-target="#admin_reg">계정 등록</button>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>관리자 번호</th>
														<th>관리자 이름</th>
														<th>관리자 휴대폰번호</th>
														<th>관리자 등록일</th>
														<th>관리자 등급</th>
														<th>계정 잠금 상태</th>
														<th>계정잠금</th>
														<th>수정</th>
														<th>삭제</th>
														<th>비밀번호 초기화</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>admin001</td>
		                                                <td>김관리</td>
		                                                <td>010-1234-1234</td>
		                                                <td>2018-01-01</td>
		                                                <td>superadmin</td>
		                                                <td>unlocking</td>
														<td><button class=" btn btn-sm btn-light"
																data-toggle="modal" data-target="#admin_lock">계정잠금</button></td>
														<td><button class="btn btn-sm btn-light btn-update"
																data-toggle="modal" data-target="#admin_update">수정</button></td>
														<td><button class="btn btn-sm btn-light btn-del"
																data-toggle="modal" data-target="#admin_delete">삭제</button></td>
														<td><button class=" btn btn-sm btn-light"
																data-toggle="modal" data-target="#password_reset">초기화</button></td>
		                                           </tr>
													<tr>
                                               			<td>admin002</td>
		                                                <td>이관리</td>
		                                                <td>010-1111-1234</td>
		                                                <td>2018-01-01</td>
		                                                <td>admin</td>
		                                                <td>unlocking</td>
														<td><button class=" btn btn-sm btn-light"
																data-toggle="modal" data-target="#admin_lock">계정잠금</button></td>
														<td><button class="btn btn-sm btn-light btn-update"
																data-toggle="modal" data-target="#admin_update">수정</button></td>
														<td><button class="btn btn-sm btn-light btn-del"
																data-toggle="modal" data-target="#admin_delete">삭제</button></td>
														<td><button class=" btn btn-sm btn-light"
																data-toggle="modal" data-target="#password_reset">초기화</button></td>
		                                           </tr>
		                                           <tr>
		                                                <td>admin003</td>
		                                                <td>박관리</td>
		                                                <td>010-2222-1234</td>
		                                                <td>2018-01-01</td>
		                                                <td>admin</td>
		                                                <td>unlocking</td>
														<td><button class=" btn btn-sm btn-light"
																data-toggle="modal" data-target="#admin_lock">계정잠금</button></td>
														<td><button class="btn btn-sm btn-light btn-update"
																data-toggle="modal" data-target="#admin_update">수정</button></td>
														<td><button class="btn btn-sm btn-light btn-del"
																data-toggle="modal" data-target="#admin_delete">삭제</button></td>
														<td><button class=" btn btn-sm btn-light"
																data-toggle="modal" data-target="#password_reset">초기화</button></td>
		                                           </tr>
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
    
    <!-- 계정 잠금에 관한 모달 -->
	<div id="admin_lock" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">계정 잠금</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<p>다음 관리자의 계정을 잠그시겠습니까?</p>
					<form action="" method="post">
						<div class="form-group">
							<label for="admin_id">관리자 번호</label> 
							<input type="text" id="admin_id" name="admin_id" placeholder="관리자 번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="admin_name">관리자 이름</label> 
							<input type="text" id="admin_name" name="admin_name" placeholder="관리자 이름" class="form-control" readonly>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-light">취소</button>
				</div>
			</div>
		</div>
	</div>
	
 	<!-- 등록에 관한 모달 -->
	<div id="admin_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">관리자 계정 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="form-group">
							<label for="admin_name">이름</label> 
							<input type="text" id="admin_name" name="admin_name" placeholder="이름" class="form-control">
						</div>
						<div class="form-group">
							<label for="admin_pw">비밀번호</label> 
							<input type="text" id="admin_pw" name="admin_pw" placeholder="비밀번호" class="form-control">
						</div>
						<div class="form-group">
							<label for="admin_phone">휴대폰번호</label> 
							<input type="text" id="admin_phone" name="admin_phone" placeholder="휴대폰번호" class="form-control">
						</div>
						<div class="form-group">
							<label for="admin_regDate">등록일</label> 
							<input type="text" id="admin_regDate" name="admin_regDate" placeholder="등록일" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">등록</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>   

	<!-- 수정에 관한 모달 -->
	<div id="admin_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">관리자 계정 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="form-group">
							<label for="admin_id">관리자 번호</label> 
							<input type="text" id="admin_id" name="admin_id" placeholder="관리자 번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="admin_name">이름</label> 
							<input type="text" id="admin_name" name="admin_name" placeholder="이름" class="form-control">
						</div>
						<div class="form-group">
							<label for="admin_phone">휴대폰번호</label> 
							<input type="text" id="admin_phone" name="admin_phone" placeholder="휴대폰번호" class="form-control">
						</div>
						<div class="form-group">
							<label for="admin_regDate">등록일</label> 
							<input type="text" id="admin_regDate" name="admin_regDate" placeholder="등록일" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">수정</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>   
	
	<!-- 삭제에 관한 모달 -->
	<div id="admin_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">관리자 계정 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="form-group">
							<label for="admin_id">관리자 번호</label> 
							<input type="text" id="admin_id" name="admin_id" placeholder="관리자 번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="admin_name">이름</label> 
							<input type="text" id="admin_name" name="admin_name" placeholder="이름" class="form-control" readonly>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-secondary">취소</button>
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
					<p>다음 관리자 비밀번호를 초기화하시겠습니까?</p>
					<form action="" method="post">
						<div class="form-group">
							<label for="admin_id">관리자 번호</label> 
							<input type="text" id="admin_id" name="admin_id" placeholder="관리자 번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="admin_name">관리자 이름</label> 
							<input type="text" id="admin_name" name="admin_name" placeholder="관리자 이름" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="admin_pw">신규 비밀번호</label> 
							<input type="password" id="admin_pw" name="admin_pw" placeholder="신규 비밀번호" class="form-control">
						</div>
						<div class="form-group">
							<label for="admin_pw2">신규 비밀번호 확인</label> 
							<input type="password" id="admin_pw2" name="admin_pw2" placeholder="신규 비밀번호 확인" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-light">취소</button>
				</div>
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