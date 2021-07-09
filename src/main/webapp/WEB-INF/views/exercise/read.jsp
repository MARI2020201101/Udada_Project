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
<div class="container">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">운동 상세</h1>
	

	<div class="row">
							<div class="col-md-10 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                이름</div>
                                            <div class="h5 mb-0 font-weight-bold" style="text-align: center;">${dto.EName}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        						<div class="col-md-2 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                운동 강도</div>
                                            <div class="h5 mb-0 font-weight-bold" style="text-align: center;">
											<c:choose>
											<c:when test="${dto.EStr=='MD'}">
											<div style="color:orange;">중간</div>
											</c:when>
											<c:when test="${dto.EStr=='HIGH'}">
											<div style="color:red;">강함</div>
											</c:when>
											<c:when test="${dto.EStr=='LOW'}">
											<div style="color:blue;">낮음</div>
											</c:when>
											<c:when test="${dto.EStr=='REST'}">
											<div style="color:green;">휴식</div>
											</c:when>
                                            </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

							<div class="col-md-4 mb-4">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
<%-- <img class="mb-4" width="100%" src="/resources/imgs/${dto.ENo}.png"> --%></div>
                   
                                    </div>
                                </div>
                            </div>
                        </div>
						<div class="col-md-8 mb-4 row">
                        <c:forEach varStatus="status" begin="1" end="6">
                         <div class="col-md-4 my-2">
                            <div class="card shadow h-100 py-2">
                                <div class="card-body py-2">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <div class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                ${status.count*10}분</div>
                                            <div class="h5 mb-0 font-weight-bold" style="text-align: center;">
                                            <fmt:formatNumber value="${(dto.EKcal/5)*(status.count*10)}"
									pattern="0" />칼로리
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        </div>
                        

	</div>
	
	<div class="row">
	<div class="col-4">
	<sec:authorize access="isAuthenticated()">
	<form action="/exercise/insert" method="post" id="emInsert">
	<div class="input-group">
	<input type="hidden" id="mEmail" name="mEmail" class="form-control" value="${loginUser}" readonly>
	<input type="hidden" id="eNo" name="eNo" class="form-control" value="${dto.ENo}" readonly>
	<button class="btn btn-outline-secondary" type="button" id="btnAddon" disabled>마이운동 추가</button>
	<input type="text" class="form-control" name="emTime" placeholder="시간(분) 입력" required>
	<button class="btn btn-primary" type="submit" id="btnAddon">추가</button>
	</div>
	</form>
	</sec:authorize>
	</div>
	<div class="col-7">
	</div>
	<div class="col-1 mr-0">
	<button class="btn btn-secondary" onclick="location.href='/exercise/list'">목록</button>
	<div>
	</div>

</div>
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
		$(".btnAddon").on("click",function(){
			$("#emInsert").submit();
		});
	});
	
	
</script>
<%@ include file="../include/footer.jsp"%>
