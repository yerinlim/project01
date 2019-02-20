<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.domain.Subjectbook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@ page import="org.xml.sax.*"%>
<%@ page import="java.net.*"%>
<%@ page import="javax.xml.xpath.*"%>
<%@ page import="javax.xml.transform.*"%>
<%@ page import="javax.xml.transform.dom.*"%>
<%@ page import="javax.xml.transform.stream.*"%>

<!DOCTYPE html>
<html>
<head>
<title>교재 관리</title>
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

						$("a[rel]").on("mouseover", function(){
				    		var isbn = $(this).attr("rel");
				    		
				    		var s="a[rel="+isbn+"]";
				    		console.log(s);
				    	//	console.log(isbn);
				    		$.ajax({
				    			url: "${pageContext.request.contextPath}/admin/book/info"
				    			,data: {isbn:isbn}
				    			,success: function(data_) {
				    				var array = data_.item;
				    				for (var i = 0; i < array.length; ++i) {
				    	                var item = array[i];
				    	                var title = item.title;
				    	                var publisher = item.publisher;
				    	                var author = item.author;
				    	                var priceStandard = item.priceStandard;
				    	                var coverLargeUrl = item.coverLargeUrl;
				    	            }
				    				var dataContent = "<img src='" + coverLargeUrl + " 'width='120' height='144'><div><ul><li>저자 : " + author + "</li><li>가격 : " + priceStandard + "원 </li><li>출판사 : " + publisher + "</li></ul></div>";
				    				$(".subjectbook-look").attr("data-content", dataContent);
				    		}});
				    	});

					 	$(".subjectbook-look").popover({
							placement : 'left',
							trigger : "hover",
							html : true
						}); 

						//삭제
						$(".btn-del").on(
								"click",
								function() {
									var subjectbook_id = $(this).parents("tr")
											.find("td:eq(0)").text();
									var subjectbook_name = $(this)
											.parents("tr").find("td:eq(1)")
											.text();
									var subjectbook_isbn = $(this)
											.parents("tr").find("td:eq(2)")
											.text();

									$("#subjectbook_delete #subjectbook_id")
											.val(subjectbook_id);
									$("#subjectbook_delete #subjectbook_name")
											.val(subjectbook_name);
									$("#subjectbook_delete #subjectbook_isbn")
											.val(subjectbook_isbn);
								});

						$(".btn-update").on(
								"click",
								function() {
									var subjectbook_id = $(this).parents("tr")
											.find("td:eq(0)").text();
									var subjectbook_name = $(this)
											.parents("tr").find("td:eq(1)")
											.text();
									var subjectbook_isbn = $(this)
											.parents("tr").find("td:eq(2)")
											.text();

									$("#subjectbook_update #subjectbook_id")
											.val(subjectbook_id);
									$("#subjectbook_update #subjectbook_name")
											.val(subjectbook_name);
									$("#subjectbook_update #subjectbook_isbn")
											.val(subjectbook_isbn);
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
				<div class="breadcrumb-holder container-fluid">
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/admin/first">HOME</a></li>
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/admin/basic/course">기초
								정보 관리</a></li>
						<li class="breadcrumb-item active"><a
							href="${pageContext.request.contextPath}/admin/basic/subjectbook">교재
								관리</a></li>
					</ul>
				</div>
				<section class="table">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">교재 목록</h3>
									</div>
									<div class="card-body">
										<!-- 우상단에 위치할 등록버튼에'만' btn-reg 클래스 추가! -->
										<button class="btn btn-primary btn-sm btn-reg"
											data-toggle="modal" data-target="#subjectbook_reg">교재
											등록</button>
										<div class="table-responsive">
											<table class="table"  >
												<thead>
													<tr>
														<th>교재번호</th>
														<th>교재명</th>
														<th>ISBN</th>
														<th>수정</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="sb" items="${list}">
														<tr>
															<td>${sb.subjectbook_id}</td>
															<td><a class="subjectbook-look popover-bold" rel="${sb.subjectbook_isbn}"
																data-toggle="popover" title="${sb.subjectbook_name}"
																data-content="" > <span>${sb.subjectbook_name}</span></a></td>
															<td>${sb.subjectbook_isbn}</td>
															<td><button class="btn btn-sm btn-light btn-update"
																	data-toggle="modal" data-target="#subjectbook_update"
																	name="${sb.subjectbook_name}">수정</button></td>
															<td><button class="btn btn-sm btn-light btn-del"
																	data-toggle="modal" data-target="#subjectbook_delete"
																	${sb.count_>=1?"disabled='disabled'":""}>삭제</button></td>
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
				<%@ include file="/WEB-INF/views/partials/footer.jsp"%>
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
				<form
					action="${pageContext.request.contextPath}/admin/basic/subjectbook/insert"
					method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="subjectbook_name">교재명</label> <input type="text"
								id="subjectbook_name" name="subjectbook_name" placeholder="교재명"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="subjectbook_isbn">ISBN</label> <input type="text"
								id="subjectbook_isbn" name="subjectbook_isbn" placeholder="ISBN"
								class="form-control">
						</div>
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

	<!-- 수정에 관한 모달 -->
	<div id="subjectbook_update" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">교재 수정</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form
					action="${pageContext.request.contextPath}/admin/basic/subjectbook/update"
					method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="subjectbook_id">교재번호</label> <input type="text"
								id="subjectbook_id" name="subjectbook_id" placeholder="교재번호"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="subjectbook_name">교재명</label> <input type="text"
								id="subjectbook_name" name="subjectbook_name" placeholder="교재명"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="subjectbook_isbn">ISBN</label> <input type="text"
								id="subjectbook_isbn" name="subjectbook_isbn" placeholder="ISBN"
								class="form-control">
						</div>
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

	<!-- 삭제에 관한 모달 -->
	<div id="subjectbook_delete" role="dialog" class="modal fade text-left">
		<div role="document" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 id="exampleModalLabel" class="modal-title">교재 삭제</h4>
					<button type="button" data-dismiss="modal" aria-label="Close"
						class="close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form
					action="${pageContext.request.contextPath}/admin/basic/subjectbook/delete"
					method="post">
					<div class="modal-body">
						<p>다음 교재를 삭제하시겠습니까?</p>
						<div class="form-group">
							<label for="subjectbook_id">교재번호</label> <input type="text"
								id="subjectbook_id" name="subjectbook_id" placeholder="교재번호"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="subjectbook_name">교재명</label> <input type="text"
								id="subjectbook_name" name="subjectbook_name" placeholder="교재명"
								class="form-control" readonly>
						</div>
						<div class="form-group">
							<label for="subjectbook_isbn">ISBN</label> <input type="text"
								id="subjectbook_isbn" name="subjectbook_isbn" placeholder="ISBN"
								class="form-control" readonly>
						</div>
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