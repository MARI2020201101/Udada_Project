<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">My Food Today</h6>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-hover" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th scope="col">Food Name</th>
						<th scope="col">Amount</th>
						<th scope="col">Kcalories</th>
						<th scope="col">Carbo</th>
						<th scope="col">Protein</th>
						<th scope="col">Fat</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="dto" items="${list}">

						<tr>
							<th scope="row"><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<a
										href='/recipe/read?rNo=<c:out value="${dto.RNo}"/>'>
										<c:out value="${dto.RTitle}" />
										</a>
									</c:when>
									<c:otherwise>
										<c:out value="${dto.FName}" />
									</c:otherwise>
								</c:choose></th>
							<td><select class="form-select fmAmountModify"
								data-fmNo="${dto.fmNo }">
									<option value=1 ${dto.fmAmount eq 1? "selected":"" }>1
										인분</option>
									<option value=2 ${dto.fmAmount eq 2? "selected":"" }>2
										인분</option>
									<option value=3 ${dto.fmAmount eq 3? "selected":"" }>3
										인분</option>
							</select> &nbsp;
								<button type="button"
									class="btn btn-outline-danger btn-sm removeFmBtn"
									data-fmNo="${dto.fmNo }">&times;</button></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsKcal}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsKcal}" />
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsCarbo}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsCarbo}" />
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsProtein}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsProtein}" />
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${not empty dto.RTitle}">
										<c:out value="${dto.rsFat}" />
									</c:when>
									<c:otherwise>
										<c:out value="${dto.fsFat}" />
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>

	<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<script>
$(document).ready(function(){

	var fmAmountModify = $(".fmAmountModify");
	var removeFmBtn = $(".removeFmBtn");
	//여기부터 다시~~ ajax로 하는 것의 장단점. day에 parameter던졌을 때 생각해보기
	var dayTotalDTO = '${dayTotalDTO }'
	var dayTotalDTOKCal = '${dayTotalDTO.dayTotalKcal }'
	console.log("dayTotalDTO>>", dayTotalDTO);
	console.log("dayTotalDTOKCal>>",dayTotalDTOKCal);
	console.log(typeof dayTotalDTO);
	console.log(typeof dayTotalDTOKCal);
	
	removeFmBtn.on("click",function(){
		var target = $(this);
		var fmNo = target.data('fmno');
		console.log(fmNo);

		$.ajax({
			 url:"/removeFoodMy",
	            method:"POST",
	            data:JSON.stringify({"fmNo" : fmNo}),
	            contentType:"application/json; charset=utf-8",
	            success:function(result){
		            console.log(result);
		          	reload();
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});
		});
		
	fmAmountModify.on("change",function(e){
	
		var target = $(this);
		var fmNo = target.data('fmno');
		var fmAmount = target.val();	
		
		var foodMyDTO = {
				"fmNo" : fmNo,
				"fmAmount" : fmAmount
				}	
		$.ajax({
			 url:"/modifyFoodMy",
	            method:"POST",
	            data:JSON.stringify(foodMyDTO),
	            contentType:"application/json; charset=utf-8",
	            success:function(result){
		            console.log(result);
		            reload();
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});
		
		});

	function reload(){
		setTimeout("location.reload()", 50);
		}
	
});

</script>
<%@ include file="../include/footer.jsp"%>
