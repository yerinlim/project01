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
			
		});
	
	</script>

</head>
<body>

	<div class="page">
        <!-- Main Navbar-->
        <%@ include file="/WEB-INF/views/partials/instructor_header.jsp" %>
        <div class="page-content d-flex align-items-stretch">
            <!-- Side Navbar -->
            <%@ include file="/WEB-INF/views/partials/instructor_sidebar.jsp" %>
            <!-- 맡은 페이지에 따라 유동적으로 교체하고 나머지는 삭제 -->
            <%-- <%@ include file="/views/partials/student_sidebar.jsp" %> --%>
            <%-- <%@ include file="/views/partials/instructor_sidebar.jsp" %> --%>
            <div class="content-inner">
	            <!-- --------------------미활용---------------------- -->
	                <!-- Page Header-->
					<!--                 
					<header class="page-header">
	                    <div class="container-fluid">
	                        <h2 class="no-margin-bottom">Dashboard</h2>
	                    </div>
	                </header> 
	                -->
	            <!-- ------------------------------------------------ -->
	            <!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html">Home</a></li>
						<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/views/common/05_common_info.jsp" >개인 정보 확인</a></li>
<!-- 						자신이 현재 위치한 마지막에 active 클래스 추가
						<li class="breadcrumb-item active"><a href="index.html">교재 관리</a></li> -->
					</ul>
				</div>
					
                <!-- 폼 자리-->
				<section>
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">개인 정보 확인</h3>
									</div>
									<div class="card-body">
										<form class="form-horizontal">
											<div class="form-group row">
												<label class="col-sm-3 form-control-label">이름</label>
												<div class="col-sm-9">
													<input id="name" type="text" placeholder="김강사"
														class="form-control form-control-success" readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 form-control-label">휴대폰 번호</label>
												<div class="col-sm-9">
													<input id="phone" type="text" placeholder="010-1234-1234"
														class="form-control form-control-success" readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-3 form-control-label">등록일</label>
												<div class="col-sm-9">
													<input id="regDate" type="text" placeholder="2010-00-00"
														class="form-control form-control-success" readonly>
												</div>
											</div>
											<div class="form-group row">
												<div class="col-sm-12 text-center">
													<input type="submit" value="확인" class="btn btn-primary"
														style="width: 72px;">
												</div>
											</div>
										</form>
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