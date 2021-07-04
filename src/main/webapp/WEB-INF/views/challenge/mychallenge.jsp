<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<style>
@font-face {
     font-family: 'S-CoreDream-4Regular';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-4Regular.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
</style>
<!-- Begin Page Content -->

<div class="container-fluid" style="font-family: 'S-CoreDream-4Regular', sans-serif;">
	<div class="card my-3 border-left-primary">
    	<div class="card-body py-2">
    	    <label class="h4 my-0">진행중</label>
    		<div class="float-right">
    		<button class="stretched-link" style="background-color:transparent; border-color: transparent; color: gray;" id="proceedBtn"><i id="proceedIcn" class="fas fa-chevron-down"></i></button>
    		</div>
    	</div>
   	</div>
	<div class="row" id="proceed">
		<c:forEach var="list" items="${proceedList}">
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-1">
					<div class="row no-gutters align-items-center" >
						<div class="col p-3 d-flex flex-column position-static">
							<div class="progress mb-2">
  							<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: ${list.progress}%;">
  							<i class="fas fa-running"></i>
  							</div>
							</div>
							<h5 class="my=">${list.CTitle}</h5>
							<p class="mb-auto">
								<fmt:formatDate value="${list.CStart}" pattern="yyyy.MM.dd" />
								-
								<fmt:formatDate value="${list.CFinish}" pattern="yyyy.MM.dd" />
							</p>
							<a href="progress/${list.CNo}" class="stretched-link"></a>
						</div>
						<div class="col-auto" style="margin: 20px">
						<c:forEach var="excs" items="${list.GList}">
							<p class="mb-auto">${excs.EName} ${excs.cgTime}분</p>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div class="card my-3 border-left-success">
    	<div class="card-body py-2">
    	    <label class="h4 my-0">신청</label>
    		<div class="float-right">
    		<button class="stretched-link" style="background-color:transparent; border-color: transparent; color: gray;" id="applyBtn"><i id="applyIcn"class="fas fa-chevron-down"></i></button>
    		</div>
    	</div>
   	</div>
	<div class="row" id="apply">
		<c:forEach var="list" items="${applyList}">
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-1">
					<div class="row no-gutters align-items-center">
						<div class="col p-3 d-flex flex-column position-static">
							<strong class="d-inline-block mb-2 text-success">D - ${list.DDay}</strong>
							<h5 class="py-1 mb-1">${list.CTitle}</h5>
							<p class="mb-auto">
								<fmt:formatDate value="${list.CStart}" pattern="yyyy.MM.dd" />
								-
								<fmt:formatDate value="${list.CFinish}" pattern="yyyy.MM.dd" />
							</p>
							<a href="read/${list.CNo}" class="stretched-link"></a>
						</div>
						<div class="col-auto" style="margin: 20px">
						<c:forEach var="excs" items="${list.GList}">
							<p class="mb-auto">${excs.EName} ${excs.cgTime}분</p>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr>
	<div class="card my-3 border-left-danger">
    	<div class="card-body py-2">
    	    <label class="h4 my-0">종료</label>
    		<div class="float-right">
    		<button class="stretched-link" style="background-color:transparent; border-color: transparent; color: gray;" id="endBtn"><i id="endIcn" class="fas fa-chevron-up"></i></button>
    		</div>
    	</div>
   	</div>
	<div class="row" id="end">
		<c:forEach var="list" items="${endList}">
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-danger shadow h-100 py-1">
					<div class="row no-gutters align-items-center">
						<div class="col p-3 d-flex flex-column position-static">
							<strong class="d-inline-block mb-2 text-danger">90% 성공</strong>
							<h5 class="py-1 mb-1">${list.CTitle}</h5>
							<p class="mb-auto">
								<fmt:formatDate value="${list.CStart}" pattern="yyyy.MM.dd" />
								-
								<fmt:formatDate value="${list.CFinish}" pattern="yyyy.MM.dd" />
							</p>
							<a href="read/${list.CNo}" class="stretched-link"></a>
						</div>
						<div class="col-auto" style="margin: 20px">
						<c:forEach var="excs" items="${list.GList}">
							<p class="mb-auto">${excs.EName} ${excs.cgTime}분</p>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</div>
</div>
<script>
	$(document).ready( function(){
		$("#end").hide();
	});
	$("#applyBtn").on("click", function() {
		  $("#apply").toggle();
		  $("#applyIcn").toggleClass("fa-chevron-down fa-chevron-up");
		});
	$("#endBtn").on("click", function() {
		  $("#end").toggle();
		  $("#endIcn").toggleClass("fa-chevron-down fa-chevron-up");
		});
	$("#proceedBtn").on("click", function() {
		  $("#proceed").toggle();
		  $("#proceedIcn").toggleClass("fa-chevron-down fa-chevron-up");
		});
	flatpickr.localize(flatpickr.l10ns.ko);
	$(".selector").flatpickr({
		mode : "range",
		minDate : "today",
		dateFormat : "Y-m-d"
	});
</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>



