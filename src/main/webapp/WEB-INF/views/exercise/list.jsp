<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container">

	<!-- Page Heading -->
	<div class="h3 mb-3 my-4">운동 종류</div>

<div class="row" align="center">
			<c:forEach var="dto" items="${list}">
						<div class="col-md-6 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-3">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="h4 font-weight-bold text-primary text-uppercase mb-1">
                                            	${dto.EName}
                                                <a class="stretched-link" href='/exercise/read?eNo=${dto.ENo}'></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
             </c:forEach>
</div>

<%-- 	<table class="table table-bordered" id="dataTable" width="100%"
		cellspacing="0">
		<thead>
			<tr align="center">
				<th scope="col" width="50%">운동 이름</th>
				<th scope="col" width="25%">운동 강도</th>
				<th scope="col" width="25%">소모 칼로리(5분)</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="dto" items="${list}">
				<tr align="center">
					<td><a href='/exercise/read?eNo=<c:out value="${dto.ENo}"/>'><c:out
								value="${dto.EName}" /></a></td>
					<td><c:out value="${dto.EStr}" /></td>
					<td><c:out value="${dto.EKcal}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table> --%>
<div class="row mr-2" style="justify-content: flex-end;">
	<nav>
		<ul class="pagination">
			<li class="page-item ${exercisePageResultDTO.prev ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/list?pageNum=${exercisePageResultDTO.exercisePageRequestDTO.pageNum-1}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}"
				tabindex="-1" aria-disabled="true">&lt;</a></li>

			<c:forEach var="page" begin="${exercisePageResultDTO.start}"
				end="${exercisePageResultDTO.end }">
				<li
					class="page-item ${page==exercisePageResultDTO.exercisePageRequestDTO.pageNum? 'active' : '' }">
					<a class="page-link"
					href="/exercise/list?pageNum=${page}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}">
						<c:out value="${page}" />
				</a>
				</li>
			</c:forEach>

			<li class="page-item ${exercisePageResultDTO.next ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/list?pageNum=${exercisePageResultDTO.exercisePageRequestDTO.pageNum+1}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}">&gt;</a>
			</li>
		</ul>
	</nav>
	<form action="/exercise/list" method="GET" id="searchForm"
		class="d-none d-sm-inline-block ml-2 form-inline navbar-search">
		<input type="hidden" class="form-control form-control-user"
			name="pageNum" value=${exercisePageResultDTO.exercisePageRequestDTO.pageNum }>

		<div class="input-group">
			<input type="text" class="form-control bg-light border- small"
				name="keyword" value="${exercisePageRequestDTO.keyword }"
				placeholder="검색" aria-label="Search"
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
