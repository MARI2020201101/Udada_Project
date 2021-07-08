<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
							<!-- Insert to MyFood Card -->
							<div class="col-xl-4 col-md-4 mb-4">
								<div class="card border-left-primary shadow h-100 py-2">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">마이 푸드 다이어리에
											추가하기</h6>
									</div>
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">

												<div class="form-group my-2">
													<b>양 입력 : </b> <select class="form-select fmAmountOption">
														<option value=1>1 인분</option>
														<option value=2>2 인분</option>
														<option value=3>3 인분</option>
													</select><br>
													<br> <b>날짜 입력 : </b> <input type="text" name="fmDate"
														class="form-control form-control-user daySelector"
														required>

													<button type="button"
														class="btn btn-primary insertFoodMyBtn my-3 float-right">추가</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Insert to MyFood Card End-->
						</sec:authorize>
						
						<script type="text/javascript">
						
							$(document).ready(function(){
								
								var rNo = "${dto.FNo}";
								var insertFoodMyBtn =$(".insertFoodMyBtn");
								
								insertFoodMyBtn.on("click", function(e){
									e.preventDefault();
									console.log($(this));
									var fmAmount = $(".fmAmountOption").val();	
									var fmDate = $(".daySelector").val();
									console.log("fmDate>>", fmDate);
									console.log(typeof fmDate);
									var foodMyDTO = {
										"mEmail" : mEmail,
										"rNo" : rNo,
										"fmAmount" : fmAmount,
										"fmDate" : fmDate
											}
									console.log("fNo>>", fNo);
									console.log("foodMyDTO>>", foodMyDTO);
								/* $.ajax({
										 url:"/recipe/registerFoodMy",
								            method:"POST",
								            data:JSON.stringify(foodMyDTO),
								            contentType:"application/json; charset=utf-8",
								            success:function(result){
									            console.log(result);
									            alert("마이 푸드에 저장되었습니다.");
									            },
									        error: function(xhr,status,errorThrown){
										        console.log("xhr >>",xhr);			
										        }
										});  */
									
								});
								
							})
						
						</script>

</body>
</html>