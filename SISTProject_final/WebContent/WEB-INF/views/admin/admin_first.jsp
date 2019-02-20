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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <script src="${pageContext.request.contextPath}/resources/script/common.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawChart);
	
		$(window).resize(function(){
			  drawChart();
			});
		
		function drawChart() {
		  var data = google.visualization.arrayToDataTable([
		    ['강의실명', '최대 정원', '수강 인원', '중도 탈락 인원'],
		    <c:forEach var="os" items="${list}">
		    	['${os.classroom_name}', ${os.max_number}, ${os.student_count}, ${os.dropout_count}],
        	</c:forEach>
		  ]);
		
		  var options = {
		    bars: 'horizontal' // Required for Material Bar Charts.
		  };
		
		  var chart = new google.charts.Bar(document.getElementById('barchart_material'));
		
		  chart.draw(data, google.charts.Bar.convertOptions(options));
		}
	</script>
	<script>
	
		$(document).ready(function() {
			
		});
	
	</script>

</head>
<body>

	<div class="page">
        <!-- Main Navbar-->
        <jsp:include page="/WEB-INF/views/partials/admin_header.jsp"/>
        <div class="page-content d-flex align-items-stretch">
            <!-- Side Navbar -->
            <%@ include file="/WEB-INF/views/partials/admin_sidebar.jsp" %>
            <div class="content-inner">
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="">HOME</a></li>
					</ul>
				</div>
				
				<section>
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">수강생 등록 현황</h3>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>강의실</th>
		                                                <th>최대정원</th>
		                                                <th>수강인원</th>
		                                                <th>중도 탈락 인원</th>
		                                                <th>과정명(개설 과정 기간)</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="os" items="${list}">
		                                           		<tr>
		                                           			<td>${os.classroom_name}</td>
		                                           			<td>${os.max_number}</td>
		                                           			<td>${os.student_count}</td>
		                                           			<td>${os.dropout_count}</td>
		                                           			<td>${os.course_name} (${os.open_course_start_date} ~ ${os.open_course_end_date})</td>
		                                           		</tr>
		                                            </c:forEach>
		                                        </tbody>									
											</table>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">수강생 등록 현황 차트</h3>
									</div>
									<div class="card-body">
										<div id="barchart_material" style="width: 100%; height: 500px;"></div>
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