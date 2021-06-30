<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<h1 class="h3 mb-4 text-gray-800">Food Detail Page</h1>
	
	<div class="card-body">
	
		<div class="table-responsive">
		
			<!-- <form role="form" method="post" action="/food/read"> -->
			
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			
					<div class="form-group row">
				        <label> 식품 명</label>
				        <input type="text" class="form-control form-control-user" value=" ${dto.FName}" readonly>
				    </div>
				      
				    <div class="form-group row">
				        <label> 1회 제공량</label>
				        <input type="text" class="form-control form-control-user" value=" ${dto.FOnceoffer}" readonly>
				    </div>
				      
				    <div class="form-group row">
				        <label> 섭취 칼로리량</label>
				        <input type="text" class="form-control form-control-user"  value=" ${dto.FKcal}" readonly>
				    </div>
				      
				    <div class="form-group row">
				        <label> 섭취 단백질량</label>
				        <input type="text" class="form-control form-control-user"  value="${dto.FProtein}" readonly>
				    </div>
				    
				    <div class="form-group row">
				        <label> 섭취 지방량</label>
				        <input type="text" class="form-control form-control-user"  value=" ${dto.FFat}" readonly>
				    </div>
				    
				    <div class="form-group row">
				        <label> 섭취 탄수화물량</label>
				        <input type="text" class="form-control form-control-user"  value=" ${dto.FCarbo}" readonly>
				    </div>
				
				</table>
			
			</form>
		
		</div>
	
	</div>

</div>
<%@ include file="../include/footer.jsp"%>
