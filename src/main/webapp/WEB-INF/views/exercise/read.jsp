<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
table.type03 {
  border-collapse: collapse;
  text-align: center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 4.4px solid #697491;
  margin : 20px 10px;
}
table.type03 th {
  width: 80px;
  padding: 7px;
  font-weight: bold;
  vertical-align: top;
  color: #a9b0c4;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.type03 td {
  width: 100px; 
  padding: 7px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
</style>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">운동 상세</h1>
	
<form action="/exercise/insert" method="post">
	<img class="h3 mb-4 text-gray-800" height="95px" width="95px"
		src="/resources/imgs/${dto.EName}.png" style="clear: left" />
		
		
		<table class="type03">
  <tr>
    <th scope="row">5분 당</th>
    <td id="eKcal" name="eKcal" class="type03" align="right">${dto.EKcal}칼로리</td>
  </tr>
  <tr>
    <th scope="row">10분 당</th>
    <td id="eKcal" name="eKcal" class="type03" align="right">${dto.EKcal*2}칼로리</td>
  </tr>
  <tr>
    <th scope="row">15분 당</th>
    <td id="eKcal" name="eKcal" class="type03" align="right">${dto.EKcal*3}칼로리</td>
  </tr>
  <tr>
    <th scope="row">30분 당</th>
    <td id="eKcal" name="eKcal" class="type03" align="right">${dto.EKcal*6}칼로리</td>
  </tr>
  <tr>
    <th scope="row">1시간 당</th>
    <td id="eKcal" name="eKcal" class="type03" align="right">${dto.EKcal*12}칼로리</td>
  </tr>
</table>
		
		
			
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

	<div class="form-group">
	<label>운동 시간 </label> 
	
	<br>
		<select class="form-select" id="emTime" name="emTime">
			<option value=1>5 분</option>
			<option value=2>10 분</option>
			<option value=3>15 분</option>
			<option value=6>30 분</option>
			<option value=12>1 시간</option>
		</select>&nbsp;&nbsp;

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
