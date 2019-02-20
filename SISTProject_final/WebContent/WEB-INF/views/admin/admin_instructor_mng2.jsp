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
			
			var instructor_id = "${os.instructor_id}";
			var instructor_status = "${os.instructor_status}";
			lectureAjax("강의중");
			$(".btn-status").on("click", function(){
				$(".btn-status").removeClass("active");
				$(this).addClass("active");
				instructor_status = $(this).val();
				lectureAjax($(this).val());
			});
			
			$("#btnSearch").on("click", function(){
				var key = $("#key").val()
				var value =	$("#value").val()
				var instructor_status=$(".btn-status").val();
				console.log(instructor_status);
				
				lectureAjax(instructor_status, key, value);
			});
			
			function lectureAjax(instructor_status, key, value){
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/instructorAjax",
					data : {
						instructor_id : instructor_id,
						instructor_status : instructor_status,
						key : key,
						value : value
					},
					dataType : 'json',
					type : 'Post',
					success : function(result) {
	           	  		var doc = JSON.stringify(result);
						var array = JSON.parse(doc);
						var txt = "";
						
						for(var i=0; i<array.length; i++) {
							var item = array[i];
	                        
	                        var subject_start_date = new Date(item.subject_start_date).toISOString().slice(0,10);
	                        var subject_end_date = new Date(item.subject_end_date).toISOString().slice(0,10);
	                        
	                        var open_course_start_date = new Date(item.open_course_start_date).toISOString().slice(0,10);
	                        var open_course_end_date = new Date(item.open_course_end_date).toISOString().slice(0,10);
	                        
	                        txt += "<tr>";
	                        txt += "<td>" + item.open_subject_id + "</td>";
	                        txt += "<td>" + item.subject_name + "</td>";
	                        txt += "<td>" + subject_start_date + " ~ " + subject_end_date + "</td>";
	                        txt += "<td>" + item.course_name + "</td>";
	                        txt += "<td>" + open_course_start_date + " ~ " + open_course_end_date + "</td>";
	                        txt += "<td>" + item.classroom_name+"</td>";
	                        txt += "<td>" + item.instructor_status +"</td>";
	                        txt += "</tr>";
                     }
						
                     $("#tbody").html(txt);
               }}); 
			}
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
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/instructor/mng1">강사 계정 관리</a></li>
						<li class="breadcrumb-item active"><a href="">강의 과목 관리</a></li>
					</ul>
				</div>
				
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h3">  ${os.instructor_name} - 강의 과목</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<div class="btn-group">					
											<button type="button" class="btn btn-sm btn-light btn-status" value="강의종료">강의 종료</button>
											<button type="button" class="btn btn-sm btn-light btn-status active" value="강의중">강의 중</button>
											<button type="button" class="btn btn-sm btn-light btn-status" value="강의예정">강의 예정</button>
										</div>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
		                                                <th>개설 과목 번호</th>
		                                                <th>개설 과목명</th>
		                                                <th>개설 과목 기간</th>
		                                                <th>개설 과정명</th>
		                                                <th>개설 과정 기간</th>
		                                                <th>강의실</th>
		                                                <th>강의 진행 여부</th>
		                                            </tr>
												</thead>
												<tbody id="tbody">
												</tbody>
											</table>
										</div>
										<div style="text-align: center; padding-top: 10px">
	                                        <div style="float: right" class="form-group form-inline">
	                                            <!-- 검색 단어 입력 폼 -->
	                                            <select class="form-control text-small" id="key" name="key">
	                                                <option class="text-small" value="opensubject_id">개설과목번호</option>
	                                                <option class="text-small" value="subject_name">개설과목명</option>
	                                                <option class="text-small" value="course_name">개설과정명</option>
	                                            </select>
	                                            <input type="text" class="form-control" id="value" name="value" placeholder="Search">
	                                            <!-- 검색 진행 버튼 -->
	                                             <input type="hidden" id="instructor_id" name="instructor_id" value = "${l2}">
	                                             <input type="hidden" id="completion" name="completion" value = "${l3}">
	                                             
	                                            <button class="btn btn-md btn-secondary" id="btnSearch">
	                                                <i class="fa fa-search"></i>
	                                            </button>
	                                        </div>
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
	<div id="subjectbook_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">교재 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<div class="form-group">
							<label for="subjectbook_name">교재명</label> 
							<input type="text" id="subjectbook_name" name="subjectbook_name" placeholder="교재명" class="form-control">
						</div>
						<div class="form-group">
							<label for="subjectbook_isbn">ISBN</label> 
							<input type="text" id="subjectbook_isbn" name="subjectbook_isbn" placeholder="ISBN" class="form-control">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">등록</button>
					<button type="button" data-dismiss="modal" class="btn btn-secondary">취소</button>
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