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
				var student_id = $(this).parents("tr").find("td:eq(0)").text(); 
	            window.location.assign("${pageContext.request.contextPath}/admin/grade/student2?student_id="+student_id);
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
						<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/views/admin/admin_grade_student1.jsp">수강생 개인 성적 조회</a> </li>
					</ul>
				</div>
				
				<!-- 테이블이 들어갈 자리입니다. -->
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">수강생 정보</h3>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>수강생 번호</th>
														<th>수강생 이름</th>
														<th>수강생 휴대폰번호</th>
														<th>수강생 등록일</th>
														<th>수강 횟수</th>
														<th>수강 과정</th>
													</tr>
												</thead>
												<tbody>
												<!-- 
													<tr>
														<td>ST000001</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td><button class="btn-look btn btn-sm btn-light">보기</button></td>
		                                            </tr>
		                                             -->
		                                             <c:forEach var="s" items="${list}">
		                                             <tr>
														<td>${s.student_id}</td>
														<td>${s.student_name}</td>
														<td>${s.student_phone}</td>
														<td>${s.student_regDate}</td>
														<td>${s.count_}</td>
														<td><button class="btn-look btn btn-sm btn-light">보기</button></td>
		                                            </tr>
		                                            </c:forEach>
												</tbody>
											</table>
										</div>
										<div style="text-align: center; padding-top: 10px">
		                                    <button class="btn btn-primary" id="prev">이전</button>
		                                    <button class="btn btn-primary" id="next">다음</button>
		                                
			                                <form 
				                                action="${pageContext.request.contextPath}/admin/grade_student1/search"
				                                style="float: right" class="form-inline" method="post">
			                                    <div>
			                                        <div class="form-group">
			                                            <!-- 검색 단어 입력 폼 -->
			                                            <!-- 검색 기준은 각자 상황에 맞춰서 설정하세요!! -->
			                                            <select class="form-control text-small" id="key" name="key">
			                                               <option value="student_id">번호</option>
														   <option value="student_name">이름</option>
														   <option value="student_phone">전화번호</option>
														   <option value="student_regDate">등록일</option>
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