<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">운동 종류</h1>




	<table class="table table-bordered" id="dataTable" width="100%"
		cellspacing="0">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">운동 이름</th>
				<th scope="col">운동 강도</th>
				<th scope="col">소모 칼로리(5분)</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="dto" items="${list}">
				<tr>
					<th scope="row"><c:out value="${dto.ENo}" /></th>
					<td><a href='/exercise/read?eNo=<c:out value="${dto.ENo}"/>'><c:out
								value="${dto.EName}" /></a></td>
					<td><c:out value="${dto.EStr}" /></td>
					<td><c:out value="${dto.EKcal}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<nav>
		<ul class="pagination">
			<li class="page-item ${pageResultDTO.prev ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&keyword=${pageResultDTO.pageRequestDTO.keyword}"
				tabindex="-1" aria-disabled="true">Prev</a></li>

			<c:forEach var="page" begin="${pageResultDTO.start}"
				end="${pageResultDTO.end }">
				<li
					class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
					<a class="page-link"
					href="/exercise/list?pageNum=${page}&keyword=${pageResultDTO.pageRequestDTO.keyword}">
						<c:out value="${page}" />
				</a>
				</li>
			</c:forEach>

			<li class="page-item ${pageResultDTO.next ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&keyword=${pageResultDTO.pageRequestDTO.keyword}">Next</a>
			</li>
		</ul>
	</nav>
	<form action="/exercise/list" method="GET" id="searchForm"
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<input type="hidden" class="form-control form-control-user"
			name="pageNum" value=${pageResultDTO.pageRequestDTO.pageNum }>

		<div class="input-group">
			<input type="text" class="form-control bg-light border- small"
				name="keyword" value="${pageRequestDTO.keyword }"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary searchBtn" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

</div>
</div>

<script>
$(document).ready(function(){

	var searchForm = $("#searchForm");
	var msg = '${msg}';
	console.log("msg>>",msg);

	$("#searchForm button").on("click",function(e){

		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();		
		});

	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
	
</script>


<%@ include file="../include/footer.jsp"%>
