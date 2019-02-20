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
function passwordCheckFunction(){
	 var pw = $('#password_reset #instructor_pw').val();
	 var pw2 = $('#password_reset #instructor_pw2').val();
		var confrimMsg = document.getElementById('confirmMsg');		
		var correctColor = "#00ff00";	
		var wrongColor ="#ff0000";	
		
		if(pw==pw2){
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML ="비밀번호가 일치합니다.";
			$('#password_reset button').attr('type', 'submit');
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호가 일치하지 않습니다.";
			$('#password_reset button').attr('type', 'button');
		}
	}
</script>
	<script>
		$(document).ready(function() {
		
 /* 			$(".check_subject").prop("checked");
			$(".check_subject:checked").each(function() { 
			}); */ 
			
			$(".btnCancel").click(function() {
				$('input:checkbox[name="check_subject"]').prop('checked', false); 
			});
			
			$(".instructor-look").popover({ 
				placement : 'left',
				trigger: "hover", 
				html: true
			});
			
			//삭제 액션처리
			$(".btn-del").on("click", function(){
				var instructor_id=$(this).parents("tr").find("td:eq(0)").text();
				var instructor_name=$(this).parents("tr").find("td:eq(1)").text();
				$("#instructor_delete #instructor_id").val(instructor_id);
				$("#instructor_delete #instructor_name").val(instructor_name);
			});
			
			//비밀번호 초기화
			$(".btn-reset").on("click", function(){
				var instructor_id=$(this).parents("tr").find("td:eq(0)").text();
				var instructor_name=$(this).parents("tr").find("td:eq(1)").text();
				$("#password_reset #instructor_id").val(instructor_id);
				$("#password_reset #instructor_name").val(instructor_name);
			});
			
			//강사 수정
			$(".btn-update").on("click", function(){
				var instructor_id=$(this).parents("tr").find("td:eq(0)").text();
				var instructor_name=$(this).parents("tr").find("td:eq(1)").text();
				var instructor_phone=$(this).parents("tr").find("td:eq(2)").text();
				var instructor_regDate=$(this).parents("tr").find("td:eq(3)").text();
				var instructor_photo_filepath=$(this).parents("tr").find("td:eq(4)").text();
				console.log(instructor_photo_filepath);
				
				$("#instructor_update #instructor_id").val(instructor_id);
				$("#instructor_update #instructor_name").val(instructor_name);
				$("#instructor_update #instructor_phone").val(instructor_phone);
				$("#instructor_update #instructor_regDate").val(instructor_regDate);
				$("#instructor_update #instructor_photo_filepath").val(instructor_photo_filepath);
			});
			
			//강의 가능 과목 관리
			$(".btn-manage").on("click", function(){
				var instructor_id=$(this).parents("tr").find("td:eq(0)").text();
				$("#subject_manage .instructor_id").val(instructor_id);
				console.log(instructor_id);
				
				var instructor_name=$(this).parents("tr").find("td:eq(1)").text();
				var instructor_phone=$(this).parents("tr").find("td:eq(2)").text();
				document.getElementById('ins_info').innerHTML= "<p>"+instructor_name + " / " + instructor_phone+"</p>";
				
				//강의하는 과목만 체크
 				var instructor_possible=$(this).val();
				var temp = new Array();
				temp = instructor_possible.split(',');
				
				for(var i=0; i<temp.length; i++){
					$("input[name=check_subject]:checkbox").each(function(){
				    	 if($(this).prop('id')==temp[i]){
				    		 $(this).prop('checked', true); 
				    	 }
					})

				}

			});
	        
	        //검색
			$(".btn-reset").on("click", function(){
				var instructor_id=$(this).parents("tr").find("td:eq(0)").text();
				var instructor_name=$(this).parents("tr").find("td:eq(1)").text();
				$("#password_reset #instructor_id").val(instructor_id);
				$("#password_reset #instructor_name").val(instructor_name);
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
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/instructor/mng1">강사 계정 관리</a></li>
					</ul>
				</div>
				
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">강사 목록</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<button class="btn btn-primary btn-sm btn-reg" data-toggle="modal" data-target="#instructor_reg">강사 등록</button>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>강사 번호</th>
		                                                <th>강사 이름</th>
		                                                <th>강사 휴대폰번호</th>
		                                                <th>강사 등록일</th>
		                                                <th>강의 가능 과목</th>
		                                                <th>강의 과목 조회</th>
		                                                <th>수정</th>
		                                                <th>삭제</th>
		                                                <th>비밀번호 초기화</th>
													</tr>
												</thead>
												<tbody>
		                                            <c:forEach var="ins" items="${list}">
		                                            <tr>
		                                            	<td>${ins.instructor_id}</td>
		                                                <td><a class="instructor-look popover-bold" data-toggle="popover" title="${ins.instructor_name} 사진" 
		                                                data-content="<img src='${pageContext.request.contextPath}/resources/img/${ins.instructor_photo_filepath}' 
		                                                		width='120' height='144'/>">${ins.instructor_name}</a></td>
		                                            	<td>${ins.instructor_phone}</td>
		                                            	<td>${ins.instructor_regDate}</td>
		                                            	<td>${ins.instructor_possible}<br><button class="btn btn-xs btn-light btn-manage" data-toggle="modal" data-target="#subject_manage" value="${ins.instructor_possible}">강의 가능 과목 관리</button></td>
		                                           		<td><form action="${pageContext.request.contextPath}/admin/instructor/mng2" method="POST">
		                                           			<input type="hidden" name="instructor_id" value="${ins.instructor_id}">
		                                           			<input type="hidden" name="instructor_name" value="${ins.instructor_name}">
		                                           			<input type="hidden" name="instructor_status" value="강의중">
		                                           			<button type="submit" class="btn btn-sm btn-light instructor_manage">조회</button>
		                                           		</form></td>
		                                                <td><button class="btn btn-sm btn-light btn-update"
																data-toggle="modal" data-target="#instructor_update">수정</button></td>
														<td><button class="btn btn-sm btn-light btn-del"
																data-toggle="modal" data-target="#instructor_delete" ${ins.count_>=1?"disabled='disabled'":""}>삭제</button></td>
														<td><button class="btn btn-sm btn-light btn-reset"
																data-toggle="modal" data-target="#password_reset">초기화</button></td>
		                                            </tr>
		                                            </c:forEach>
		                                        </tbody>
											</table>
										</div>
										<div style="text-align: center; padding-top: 10px">
<!-- 		                                    <button class="btn btn-primary" id="prev">이전</button>
		                                    <button class="btn btn-primary" id="next">다음</button> -->
		                                
			                                <form style="float: right" class="form-inline" method="post" 
			                                	action="${pageContext.request.contextPath}/admin/instructor/mng1/search">
			                                    <div>
			                                        <div class="form-group">
			                                            <!-- 검색 단어 입력 폼 -->
			                                            <select class="form-control text-small" id="key" name="key">
			                                                <option class="text-small" value="instructor_id">강사번호</option>
			                                                <option class="text-small" value="instructor_name">강사이름</option>
			                                                <option class="text-small" value="instructor_phone">강사휴대폰번호</option>
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
    
	<!-- 등록에 관한 모달 -->
	<div id="instructor_reg" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">강사 등록</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/instructor/mng1/insert" enctype="multipart/form-data"
				role="form" method="post"> 
				<div class="modal-body">
						<div class="form-group">
							<label for="instructor_name">이름</label> 
							<input type="text" id="instructor_name" name="instructor_name" placeholder="이름" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="instructor_pw">비밀번호</label> 
							<input type="text" id="instructor_pw" name="instructor_pw" placeholder="비밀번호" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="instructor_phone">휴대폰번호</label> 
							<input type="text" id="instructor_phone" name="instructor_phone" placeholder="휴대폰번호" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="instructor_regDate">등록일</label> 
							<input type="date" id="instructor_regDate" name="instructor_regDate" placeholder="등록일" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="instructor_photo">사진 파일</label> 
							<input type="file" id="instructor_photo_filepath" name="filePath" placeholder="사진 파일" class="form-control" required>
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
	<div id="instructor_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">강사 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/instructor/mng1/update" method="post" 
					enctype="multipart/form-data" role="form">
				<div class="modal-body">
						<div class="form-group">
							<label for="instructor_id">강사번호</label> 
							<input type="text" id="instructor_id" name="instructor_id" placeholder="강사번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="instructor_name">이름</label> 
							<input type="text" id="instructor_name" name="instructor_name" placeholder="이름" class="form-control">
						</div>
						<div class="form-group">
							<label for="instructor_phone">휴대폰번호</label> 
							<input type="text" id="instructor_phone" name="instructor_phone" placeholder="휴대폰번호" class="form-control">
						</div>
						<div class="form-group">
							<label for="instructor_regDate">등록일</label> 
							<input type="text" id="instructor_regDate" name="instructor_regDate" placeholder="등록일" class="form-control">
						</div>
						<div class="form-group">
							<label for="instructor_photo_filepath">사진 파일</label> 
							<input type="file" id="instructor_photo_filepath" name="filePath" placeholder="사진 파일" class="form-control"  required>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="btnUp">수정</button>
					<button type="button" data-dismiss="modal" class="btn btn-secondary">취소</button>
				</div>
					</form>
			</div>
		</div>
	</div>
	
	<!-- 삭제에 관한 모달 -->
	<div id="instructor_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">강사 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/instructor/mng1/delete" method="post">
				<div class="modal-body">
					<p>다음 강사를 삭제하시겠습니까?</p>
						<div class="form-group">
							<label for="instructor_id">강사번호</label> 
							<input type="text" id="instructor_id" name="instructor_id" placeholder="강사번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="instructor_name">이름</label> 
							<input type="text" id="instructor_name" name="instructor_name" placeholder="이름" class="form-control" readonly>
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
					<form action="${pageContext.request.contextPath}/admin/instructor/mng1/reset" method="post">
				<div class="modal-body">
						<div class="form-group">
							<label for="instructor_id">강사번호</label> 
							<input type="text" id="instructor_id" name="instructor_id" placeholder="강사번호" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="instructor_name">이름</label> 
							<input type="text" id="instructor_name" name="instructor_name" placeholder="이름" class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="instructor_pw">신규 비밀번호</label> 
							<input type="password" id="instructor_pw" name="instructor_pw" placeholder="신규 비밀번호" class="form-control" 
								onkeyup="passwordCheckFunction();">
						</div>
						<div class="form-group">
							<label for="instructor_pw2">신규 비밀번호 확인</label> 
							<input type="password" id="instructor_pw2" name="instructor_pw2" placeholder="신규 비밀번호 확인" class="form-control"
								onkeyup="passwordCheckFunction();">
							<span id="confirmMsg"></span>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">확인</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-light">취소</button>
				</div>
					</form>
			</div>
		</div>
	</div>
	
	<!-- 강의 가능 과목 관리 모달 -->
	<div id="subject_manage" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">강의 가능 과목 관리</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
					<form action="${pageContext.request.contextPath}/admin/instructor/mng1/possible" method="post">
				<div class="modal-body">
					<div id="ins_info">
					 <p>김강사 / 010-1234-1234</p> 
					</div>
						<div class="form-group">
							<div class="row">
							<c:forEach var="s" items="${sName}">
							<div class="col-lg-6">
									<div class="form-checkbox">
										<input type="checkbox" class="checkbox-template check_subject"
											id="${s.subject_name}"
											value="${s.subject_id}" name="check_subject" >
											 <label
											for="checkbox">${s.subject_name}</label>
									</div>
								</div>
							</c:forEach>
							<input type="hidden" class="instructor_id" name="instructor_id">	
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">확인</button>
					<button type="button" data-dismiss="modal"
						class="btn btn-light btnCancel">취소</button>
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