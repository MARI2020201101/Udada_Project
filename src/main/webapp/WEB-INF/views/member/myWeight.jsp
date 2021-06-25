<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	

<h1 class="h3 mb-4 text-gray-800">체중 재기</h1>
<form action="/member/insertWeight" method="post">
	<input type="hidden" name="mEmail" id="mEmail" value="${dto.MEmail}">
		<table style="width:100%;">
			<tr>
				<td>키</td>
				<td>현재 체중</td>
				<td>목표 체중</td>
			</tr>
			<tr>
				<td><input type="text" name="msHeight" id="msHeight" class="form-control form-control-user" value="${dto.msHeight}" required></td>
				<td><input type="text" name="msWeight" id="msWeight" class="form-control form-control-user" value="${dto.msWeight}" required></td>
				<td><input type="text" name="msGoal" id="msGoal" class="form-control form-control-user" value="${dto.msGoal}" required></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="체중 등록" id="submit" name="submit" class="btn btn-facebook btn-block"></td>
			</tr>
		</table>
</form>
<br>
<br>

	<div class="row">
		<c:forEach var="dto" items="${list }">
			<div class="col-lg-6">
				<div class="card  mb-4 py-3 border-left-primary">
					<div class="card-body">
						<table style="width: 100%; text-align: center;">
							<tr>
								<th>날짜</th>
								<th>키</th>
								<th>현재 체중</th>
								<th>목표 체중</th>
								<th rowspan="2"><a href="/member/deleteWeight?msNo=${dto.msNo }" class="btn btn-secondary"><span class="text">삭제하기</span></a></th>
							</tr>
							<tr>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.msDate }" /></td>
								<td>${dto.msHeight }</td>
								<td>${dto.msWeight }</td>
								<td>${dto.msGoal }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- /.container-fluid -->
</div>

<script>

	$("#submit").on("click", function(){
		if($("#msHeight").val() == ""){
			alert("키를 입력해주세요.")
			$("#msHeight").focus();
			return false;
		}
		
		if($("#msWeight").val() == ""){
			alert("체중을 입력해주세요.")
			$("#msWeight").focus();
			return false;
		}
		
		if($("#msGoal").val() == ""){
			alert("목표 체중을 입력해주세요.")
			$("#msGoal").focus();
			return false;
		}
	});
	
	$(document).ready(function() {
		
		var msg = '${msg}';
		console.log("msg>>", msg);
		if (!(msg === '' || history.state)) {
			var modal = $(".modal");
			console.log(modal);
			modal.modal();
		}
		
	});
</script>

<div class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Result</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>${msg }</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
