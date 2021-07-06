<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>


<!-- Begin Page Content -->

<div class="container-fluid">

<div class="row">
<form class="col-md-11" name="searchBox" method="get" action="">
	<div class="row col-md-11 mb-4">
		<div class="col-md-4">
			<div class="input-group">
  			<span class="input-group-text"><i class="fas fa-font"></i></span>
 			<input type="text" name="keyword" class="form-control">
			</div>
		</div>
		<div class="col-md-4">
			<div class="input-group">
  			<span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
 			<input type="text" name="period" class="form-control selector" readonly>
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group">
  			<span class="input-group-text"><i class="fas fa-dumbbell"></i></span>
 			<input type="text" name="exercise" class="form-control">
			</div>
		</div>
		<div class="col-md-1">
			<button type="submit" class="btn btn-outline-secondary"><i class="fas fa-search"></i></button>
		</div>
			<input type="hidden" name=pageNo value=1>
	</div>
</form>
	<div class="col-md-1 mb-4" style="text-align:right">
		<button type="button" class="btn btn-primary" onclick="location.href='register'"><i class="bi bi-journal-plus"></i></button>
	</div>
</div>
<hr class="mt-0 mb-4">

	<div class="row">
		<c:forEach var="dto" items="${list}">
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-${dto.CIng} shadow h-100 py-2">
					<div class="row no-gutters align-items-center">
						<div class="col p-3 d-flex flex-column position-static">
							<strong class="d-inline-block mb-1 text-${dto.CIng}"><fmt:formatDate value="${dto.CStart}" pattern="yy.MM.dd" />
								-
								<fmt:formatDate value="${dto.CFinish}" pattern="yy.MM.dd" /></strong>
							<h4 class="my-2">${dto.CTitle}</h4>
							<p class="mb-auto">${dto.caCnt}명/ ${dto.CTotal}명</p>
							<a href="read/${dto.CNo}" class="stretched-link"></a>
						</div>
						<div class="col-auto" style="margin: 20px">
						<c:forEach var="goal" items="${dto.GList}">
							<p class="mb-auto">${goal.EName} ${goal.cgTime}분</p>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>


	</div>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:set var="pageNo" value="${page.pageNo}" />
			<c:choose>
				<c:when test="${checkEnd==true}">
					<c:set var="endPage" value="${page.startPage+4}" />
				</c:when>
				<c:otherwise>
					<c:set var="endPage" value="${page.endPage}" />
				</c:otherwise>
			</c:choose>
			<c:if test="${pageNo>5}">
				<li class="page-item"><a class="page-link" href="list?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=1"
					aria-label="Previous"> <span aria-hidden="true">&#171;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="list?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo-1}">&#60;</a></li>
			</c:if>
			<c:forEach var="pageNo" begin="${page.startPage}" end="${endPage}">
				<c:choose>
				<c:when test="${pageNo!=page.pageNo}">
				<li class="page-item"><a class="page-link" href="list?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo}">${pageNo}</a></li>
				</c:when>
				<c:otherwise>
				<li class="page-item disabled"><a class="page-link" href="list?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo}">${pageNo}</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${checkEnd==true}">
				<li class="page-item"><a class="page-link" href="list?keyword=${page.keyword}&period=${page.period}&excercise=${page.exercise}&pageNo=${pageNo+1}">&#62;</a></li>
				<li class="page-item"><a class="page-link"
					href="list?pageNo=${page.endPage}" aria-label="Next"> <span
						aria-hidden="true">&#187;</span>
				</a></li>
			</c:if>
		</ul>
	</nav>

</div>
</div>
<script>

	flatpickr.localize(flatpickr.l10ns.ko);
	
	$(".selector").flatpickr({
		mode : "range",
		dateFormat : "Y-m-d"
	});
</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>



