<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> 
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<div class="container-fluid">

<style>
	.starBox {font-size:0; letter-spacing:-4px;}
	.starBox span {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#FF46C5;
	    text-decoration:none;
	}
</style>
	<!-- Page Heading -->

	<div class="row">
		<div class="col-lg-12">
			<div class="card mb-4 py-3">
				<div class="card-body">
					<h1 class="h3 mb-4 text-gray-800">
						<c:out value="${dto.RTitle}"></c:out>
					</h1>

					<div class="form-group row">
						<p class="starBox"></p>
					</div>
					<sec:authorize access="isAuthenticated()">
						<div class="form-group row">
							<select class="form-select form-select-sm selectStarOption">
								<option value=5>5</option>
								<option value=4>4</option>
								<option value=3>3</option>
								<option value=2>2</option>
								<option value=1>1</option>
							</select>&nbsp;
							<button type="button"
								class="btn btn-primary btn-sm insertStarBtn">평가하기</button>
						</div>
					</sec:authorize>
					<div class="form-group row">
						<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
							<a href="/image/show?imagePath=${dto.imageDTO.imagePath }"> <img
								src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
								<p>크게보기</p>
							</a>
						</c:if>

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

						<div class="col-xl-6 col-md-6 mb-4">
							<div
								class="card border-left-primary shadow h-100 py-2 recipeSpecBox">

								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">레시피 칼로리 정보</h6>
								</div>
								<div class="card-body">
									<div>
										<canvas id="kaloriesSpecBar"></canvas>
									</div>

								</div>
							</div>
						</div>

					</div>

					<div class="form-group row">
						<b><label>조리법</label></b>
						<textarea cols="5" class="form-control form-control-user" readonly>${dto.RContent}</textarea>
					</div>
					<div class="ingreBox">
						<ul>
							<c:if
								test="${not empty dto.ingredientList && dto.ingredientList.size() gt 0 }">

								<c:forEach var="ingredient" items="${dto.ingredientList}"
									varStatus="status">
									<li>
										<div class='card w-80'>
											<div class='card-body'>
												<b class='card-title ingreName'>${ingredient.FName}</b>
												<p class='card-text'>
													<span>selected amount : </span>${ingredient.riAmount}</p>
											</div>
										</div>
									</li>
								</c:forEach>

							</c:if>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="card shadow mb-4 recipeSpecBox">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">레시피 영양소 정보</h6>
		</div>
		<div class="card-body">
			<div>
				<canvas id="recipeSpecChart"></canvas>
			</div>
		</div>
	</div>

	
	
	<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageRequestDTO.pageNum }> 
	<input type="hidden" class="form-control form-control-user" name="keyword" value=${pageRequestDTO.keyword }> 
	<input type="hidden" class="form-control form-control-user" name="rNo" value="${dto.RNo}">

	<div class="form-group row">
		<input type="hidden" class="form-control form-control-user" value="${dto.MEmail}">
	</div>



	<a href="/recipe/list?pageNum=${pageRequestDTO.pageNum }&keyword=${pageRequestDTO.keyword}" class="btn btn-secondary">
       <span class="text">LIST</span>
    </a>
  
    <c:if test="${loginUser eq dto.MEmail || loginUserRole eq 'ADMIN'}">
    <a href='/recipe/modify?rNo=${dto.RNo}&pageNum=${pageRequestDTO.pageNum }&keyword=${pageRequestDTO.keyword}' class="btn btn-warning">
        <span class="text">MODIFY</span>
    </a>
    </c:if>
    
    
</div>
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
              
<script>
$(document).ready(function(){

	var rNo = "${dto.RNo}";
	var starBox = $( ".starBox" );
	var msg = '${msg}';
	var ingreName = $(".ingreName");
	var ingreBox = $(".ingreBox");
	var insertStarBtn = $(".insertStarBtn");
	var selectStarOption = $(".selectStarOption");
	var insertFoodMyBtn =$(".insertFoodMyBtn");
	var mEmail = '${loginUser}';
	var recipeSpecList = [];
	var kaloriesSpecList = [];
	var ctx = document.getElementById("recipeSpecChart");
	var ctx2 = document.getElementById("kaloriesSpecBar");
	console.log("mEmail>>",mEmail);
	
	loadStar();
	loadSpec();
	
	$(".daySelector").flatpickr(
			{
				   dateFormat: "Y-m-d",
				   maxDate:new Date()
			}
		);

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

			console.log("foodMyDTO>>", foodMyDTO);
		$.ajax({
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
				}); 
			
		});

	function loadSpec(){

		$.ajax({
			 url:"/recipe/spec/"+rNo,
	           method:"GET",
	           dataType:"json",
	           success:function(result){
		            console.log(result);
					console.log(result.sumCarbo);

					if(result.sumCarbo+ result.sumProtein+ result.sumFat==0){
						$(".recipeSpecBox").remove();
						
						return;}
					else{
						
						kaloriesSpecList.push(result.sumKcal,result.sumCarbo,result.sumProtein,result.sumFat );
						
						var sums = result.sumCarbo+ result.sumProtein+ result.sumFat ;
						var sumCarbo = Math.round((result.sumCarbo/sums)*100);
						var sumProtein = Math.round((result.sumProtein/sums)*100);
						var sumFat = Math.round((result.sumFat/sums)*100);
						
						recipeSpecList.push(sumCarbo, sumProtein, sumFat);
						console.log("recipeSpecList>> ", recipeSpecList);


						var myChart = new Chart(ctx, {
							  type: 'doughnut',
							  data: {
							    labels: ['탄수화물 % ', '단백질 % ', '지방 %'],
							    datasets: [{
							      label: '# nutrients + %',
							      data: recipeSpecList,
							      backgroundColor: [
							        'rgba(255, 99, 132, 0.5)',					      				        
							        'rgba(75, 192, 192, 0.2)',
							        'rgba(255, 206, 86, 0.2)'
							      ],
							      borderColor: [
							        'rgba(255,99,132,1)',					       
							        'rgba(75, 192, 192, 1)',
							        'rgba(255, 206, 86, 1)'
							      ],
							      borderWidth: 3
							    }]
							  },
							  options : {
								  responsive: true,
									maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
									scales : {
										yAxes : [ {
											ticks : {
												beginAtZero : true
											}
										} ]
									},
							    plugins: {
							        datalabels: {
							          color: 'grey',
							          anchor: 'center',
							          borderWidth: 2,
							          align: 'end',
							          offset: 10,
							          borderColor: '#fff',
							          borderRadius: 25,
							          backgroundColor: (context) => {
							            return context.dataset.backgroundColor;
							          },
							          labels: {
							            title: {
							              font: {
							                weight: 'bold'
								            					              
							              }
							            },
							            value: {
							              color: 'green'
							            }
							          }
							        }
							      }//plugins end
								
								}//options end
							});//nutrientDoughutgraph end

							var myChart2 = new Chart(ctx2, {
						    type: 'horizontalBar',
						    data: {
						        labels: ['총 칼로리', '탄수화물', '단백질', '지방'],
						        datasets: [{
						            label: 'Kalories (kcal) & nutrients (g)',
						            data: kaloriesSpecList,
						            borderColor: "rgba(130, 24, 32, 1)",
						            backgroundColor: "rgba(125, 231, 213, 0.5)",
						            fill: false,
						        }]
						    },
						    options: {
						        responsive: true,
						        
						        tooltips: {
						            mode: 'index',
						            intersect: false,
						        },
						        hover: {
						            mode: 'nearest',
						            intersect: true
						        },
						        scales: {
						            xAxes: [{
						                display: true,
						                scaleLabel: {
						                    display: true
						                    
						                },
						            }],
						            yAxes: [{
						                display: true,
						                ticks: {
						                    autoSkip: false,
						                },
						                scaleLabel: {
						                    display: true
						                   
						                }
						            }]
						        },plugins: {
							        datalabels: {
								          color: 'grey',
								          anchor: 'center',
								          borderWidth: 2,
								          align: 'end',
								          offset: 10,
								          borderColor: '#fff',
								          borderRadius: 25,
								          backgroundColor: (context) => {
								            return context.dataset.backgroundColor;
								          },
								          labels: {
								            title: {
								              font: {
								                weight: 'bold'
									            					              
								              }
								            },
								            value: {
								              color: 'green'
								            }
								          }
								        }
								      }//plugins end
						    }
						});


		
						}

					
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});

		
		};
	
	
	insertStarBtn.click(function(e){
		var starPoint = selectStarOption.val();

		console.log("rNo>>",rNo);
		console.log("starPoint>>" , starPoint);
	var recipeGradeDTO = {
		"rNo" : rNo,
		"mEmail" : mEmail,
		"rgGrade" : starPoint
		} 
		console.log(recipeGradeDTO);
		$.ajax({
			 url:"/recipe/grade",
	            method:"POST",
	            data:JSON.stringify(recipeGradeDTO),
	            contentType:"application/json; charset=utf-8",
	            success:function(result){
		            console.log(result);
		            loadStar();
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});
		});
	function loadStar(){
		starBox.empty();
		
		$.getJSON("/recipe/grade/"+rNo, function(result){
			var avg = result;
			var star = Math.round(result);

			for(var i=1; i<=star ; i++){
				starBox.append("<span>★</span>");
				}
			for(var i=1 ; i<=5-star; i++){
				starBox.append("<span>☆</span>");
				}			
			starBox.append("<span>("+ result +")</span>");
			});
		}


	
	console.log("msg>>",msg);
	console.log("ingreName>>",ingreName);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}


	if(ingreName.text()==''|| ingreName.text()==null){
		console.log("$(this).closest('li')>>",$(this).closest('li'));
		ingreName.closest('li').remove();
		}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
