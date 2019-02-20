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
		
			$(".btn-look").on("click", function() {
				var oc_id = $(this).parents("tr").find("td:eq(0)").text(); 
				window.location.assign("${pageContext.request.contextPath}/admin/grade/opencourse2?oc_id="+oc_id);
	         });
			 
			//검색 진행시 상태값 유지 설정
			$("#key option[value='${key}']").attr("selected", "selected");
			$("#value").val('${value}');
			
			
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

	            <!-- 네비게이션이 들어갈 자리입니다. -->
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/views/admin/admin_first.jsp">HOME</a></li>
						<!-- 자신이 현재 위치한 마지막에 active 클래스 추가 -->
						<li class="breadcrumb-item active"><a
									href="${pageContext.request.contextPath}/views/admin/admin_grade_opencourse1.jsp">개설
										과정 성적 조회</a></li>
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
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>개설 과정 번호</th>
														<th>과정명</th>
														<th>개설 과정 기간</th>
														<th>강의실명</th>
														<th>수강생 등록 인원</th>
														<th>개설 과목 등록 개수</th>
														<th>개설 과목 보기</th>
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
														<td><button type="button"
																class="btn-look btn btn-sm btn-light">보기</button>
														</td>
														<td>3명</td>
													</tr>
													 -->
													<c:forEach var="oc" items="${list}">
														<tr>
															<td>${oc.open_course_id}</td>
															<td>${oc.course_name}</td>
															<td>${oc.open_course_start_date} ~ ${oc.open_course_end_date}</td>
															<td>${oc.classroom_name}</td>
															<td>${oc.student_count}</td>
															<td>${oc.open_subject_count}</td>
															<td><button type="button"
																class="btn-look btn btn-sm btn-light">보기</button>
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
			                                	action="${pageContext.request.contextPath}/admin/opencourse/search"  
			                                	style="float: right" class="form-inline" method="post">
			                                    <div>
			                                        <div class="form-group">
			                                            <select class="form-control text-small" id="key" name="key">
			                                                <option class="text-small" value="open_course_id">개설 과정 번호</option>
			                                                <option class="text-small" value="course_name">과정명</option>
			                                            </select>
			                                            <input type="text" class="form-control" id="value" name="value" placeholder="Search">
			                                            <!-- 검색 진행 버튼 -->
			                                            <button type="submit" class="btn btn-md btn-secondary" id="btnSearch">
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