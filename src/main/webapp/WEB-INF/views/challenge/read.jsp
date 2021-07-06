<%@page import="org.ourapp.udada.challenge.ChallengeGoalDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Begin Page Content -->

<div class="container">
	<div class="col-md-12"></div>
	<form class="form-material" method="POST">

			<input type="hidden" name="mEmail" id="mEmail" class="form-control" value="${dto.MEmail}" readonly >

		<label>제목</label>
		<div class="form-group form-default">
			<input type="text" name="cTitle" class="form-control" value="${dto.CTitle}" readonly >
		</div>
		<label>기간</label>
		<div class="form-group form-default">
			<input type="text" name="cPeriod" class="form-control" value="<fmt:formatDate value="${dto.CStart}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${dto.CFinish}" pattern="yyyy-MM-dd" />" readonly>
		</div>
		<label>신청 현황</label>
		<div class="form-group form-default">
			<input type="text" name="cTotal" class="form-control" value="${dto.caCnt}명 / ${dto.CTotal}명" readonly>
		</div>

		<label>운동종류 / 시간(분)</label>
		<c:forEach var="goal" items="${goal}">
		<div class="form-group form-default" id="excsDiv">
			<input type="text" name="goal" class="form-control" value="${goal.EName} ${goal.cgTime}분 &nbsp;(<fmt:formatNumber value="${goal.cgTime/5*goal.EKcal}" pattern="0" />칼로리)" readonly>
		</div>
		</c:forEach>
		<label>상세 내용</label>
		<textarea name="cContent" class="form-control" rows="10" readonly>${dto.CContent}</textarea>
    	<br>
		<div align="center">
		<sec:authorize access="isAuthenticated()">
		<input type="hidden" name="cNo" value="${dto.CNo}">
		<c:if test="${loginUser != dto.MEmail && loginUserRole != 'ADMIN'}">
		<input type="button" class="btn btn-primary" id="applyChallenge" value="신청">
		<input type="button" class="btn btn-danger" id="cancelChallenge" value="신청취소">
		</c:if>
		<c:if test="${loginUser == dto.MEmail || loginUserRole == 'ADMIN'}">
		<input type="button" class="btn btn-warning" id="modifyChallenge" value="수정" onclick="modify()">
		<input type="button" class="btn btn-danger" id="delBtn" value="삭제">
		</c:if>
		</sec:authorize>
		<input type="button" class="btn btn-secondary" style="float: right" onclick="location.href='/challenge/list'" value="목록">
		</div>
		<br>
	</form>
</div>
</div>
	<form name="cnoForm" method="post" action="/challenge/edit">
	<input type="hidden" name="cNo" value="${dto.CNo}">
	</form>
<script type="text/javascript">

	$(document).ready( function(e){
		var sEmail = $("#mEmail").val();		
		var uEmail = "${loginUser}";
		$.ajax({
			type : "post",
			url : "/challenge/applyCheck",
			data : {sEmail:uEmail, cNo:${dto.CNo}},
			dataType : "json",
			async:false,
			success :
				function(data){
					if(data>0){
						$("#applyChallenge").hide();
						$("#cancelChallenge").show();
					}else{
						$("#applyChallenge").show();
						$("#cancelChallenge").hide();
					}
				}
		});
	
		if(${dto.checkEnd}>0 && "${loginUserRole}" != "ADMIN"){
			$("#applyChallenge").hide();
			$("#cancelChallenge").hide();
			$("#modifyChallenge").hide();
			$("#delBtn").hide();
		}
	});
	
	function modify() {
		var cnoForm = document.cnoForm;
		cnoForm.submit();
	}
	
	$("#delBtn").one("click", function() {
		$.post("/challenge/delete",{cNo : "${dto.CNo}"});
		window.location.href = "/challenge/list";
		  });

	$("#applyChallenge").one("click", function(e) {
		var uEmail = "${loginUser}";
		$.ajax({
			type : "post",
			url : "/challenge/apply",
			data : {sEmail:uEmail, cNo:${dto.CNo}},
			dataType : "json",
			success :
				function(){
				$("#applyChallenge").hide();
				$("#cancelChallenge").show();
				location.reload();
				}
		});
	});

	$("#cancelChallenge").one("click", function(e) {
		var uEmail = "${loginUser}";
		$.ajax({
			type : "post",
			url : "/challenge/cancel",
			data : {sEmail:uEmail, cNo:${dto.CNo}},
			dataType : "json",
			success :
				function(){
				$("#applyChallenge").show();
				$("#cancelChallenge").hide();
				location.reload();
				}
		});
	});
</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>

