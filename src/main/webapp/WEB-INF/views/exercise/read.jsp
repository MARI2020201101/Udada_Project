<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">운동 상세</h1>
<form action="/exercise/insert" method="post">
	<img class="h3 mb-4 text-gray-800" height="95px" width="95px"
		src="/resources/imgs/${dto.EName}.png" style="clear: left" />
	<div class="form-group row">
		<label>번호</label> 
		<input type="text" id="eNo" name="eNo" class="form-control form-control-user" value="${dto.ENo}" readonly>
	</div>
	<div class="form-group row">
		<label>운동 이름</label> 
		<input type="text" id="eName" name="eName" class="form-control form-control-user" value="${dto.EName}" readonly>
	</div>
	<div class="form-group row">
		<label>운동 강도</label> 
		<input type="text" id="eStr" name="eStr" class="form-control form-control-user" value="${dto.EStr}" readonly>
	</div>
	<div>
		<label>예상 소모 칼로리</label>
		<table class="borderBottom">
			<tr>
				<td class="borderBottom">5 분</td>
				<td id="eKcal" name="eKcal" class="borderBottom" align="right">${dto.EKcal}칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">10 분</td>
				<td id="eKcal" name="eKcal" class="borderBottom" align="right">${dto.EKcal*2}칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">15 분</td>
				<td id="eKcal" name="eKcal" class="borderBottom" align="right">${dto.EKcal*3}칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">30 분</td>
				<td id="eKcal" name="eKcal" class="borderBottom" align="right">${dto.EKcal*6}칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">1 시간</td>
				<td id="eKcal" name="eKcal" class="borderBottom" align="right">${dto.EKcal*12}칼로리</td>
			</tr>
		</table>
	</div>
	<br>
	<div class="form-group my-2">
	<label>운동 시간 </label> <br>
		<select class="form-select" id="emTime" name="emTime">
			<option value=1>5 분</option>
			<option value=2>10 분</option>
			<option value=3>15 분</option>
			<option value=6>30 분</option>
			<option value=12>1 시간</option>
		</select>&nbsp;

		<input type="submit" class="btn btn-primary btn-sm" value="추가">
		</div>
		
	<a href="/exercise/list" class="btn btn-secondary"> 
	<span class="text">목록</span>
	</a>
</form>

<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<div class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Result</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>${msg }</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">테스트</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
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
<%@ include file="../include/footer.jsp"%>
