<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

	<h1 class="h3 mb-4 text-gray-800">운동 상세</h1>
	 <img class="h3 mb-4 text-gray-800" weight="95px" height="95px" src="/resources/imgs/${dto.EName}.png" style="clear:left"/>
		<div class="form-group row">
       <label>번호</label>
        <input type="text" class="form-control form-control-user" value="${dto.ENo}" readonly>
      </div>
      <div class="form-group row">
        <label>운동 이름</label>
        <input type="text" class="form-control form-control-user" value="${dto.EName}" readonly>
      </div>
      <div class="form-group row">
        <label>운동 강도</label>
        <input type="text" class="form-control form-control-user" value="${dto.EStr}" readonly>
      </div>
     	<div>
     	<label>예상 소모 칼로리</label>
        <table class="borderBottom">
			<tr>
				<td class="borderBottom">5 분</td>
				<td class="borderBottom" align="right">${dto.EKcal} 칼로리</td> 
			</tr>
			<tr>
				<td class="borderBottom">10 분</td>
				<td class="borderBottom" align="right">${dto.EKcal*2} 칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">15 분</td>
				<td class="borderBottom" align="right">${dto.EKcal*3} 칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">30 분</td>
				<td class="borderBottom" align="right">${dto.EKcal*4} 칼로리</td>
			</tr>
			<tr>
				<td class="borderBottom">1 시간</td>
				<td class="borderBottom" align="right">${dto.EKcal*8}  칼로리</td>
			</tr>
		</table>
		</div>
      </div>
      
      <a href="/exercise/list" class="btn btn-secondary">
            <span class="text">목록</span>
        </a>

<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal">테스트</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
<script>
$(document).ready(function(){
	var msg = '${msg}';
	console.log("msg>>",msg);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
