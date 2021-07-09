<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->

<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>

	<div class="container-fluid">
	
		<h1 class="h3 mb-4 text-gray-800">
			<a href="/food/list"> Food MjList Page</a>
		</h1>
		<!-- Page Heading -->
		
		<div class="row">
			
			<c:forEach items="${list}" var="dto">
			
				<div class="col-xl-3 col-md-6 mb-4">
					
					<div class="card border-left-success shadow h-100 py-0">
						
						<div class="card-body">
						
							<div class="row no-gutters align-items-center">
								
								<div class="col mt-2">
									
									<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
									
										<h5 class="card-title">
											<a href='/food/MinClassPage?fMjclass=<c:out value="${dto.FMjclass}"/>'><c:out value="${dto.FMjclass}"/></a>
										</h5>
									
									</div>
								
								</div>
							
							</div>
						
						</div>
						
					</div>
				</div>
	        
	        </c:forEach>
	            
		</div>
		
	</div>

</div>	

<!-- /.container-fluid -->
<!-- End of Main Content -->

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
