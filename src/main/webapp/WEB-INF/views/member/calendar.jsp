<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">calendar Page</h1>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Last 7 Days : TOTAL KCAL</h6>
		</div>
		<div class="card-body">
			<div>
				<canvas id="myChart"></canvas>
			</div>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		$.ajax({
				url:"/member/calendar",
			    method:"POST",
			    dataType:"json",		            
			    success:function(result){
					console.log(result);
					var arr = result;
					$.each(arr, function(idx, obj){
					console.log(obj);
					console.log(obj.calendarDate);


					var ctx = document.getElementById("myChart").getContext('2d');
					var myChart = new Chart(ctx, {
						type : 'line',
						data : {
							labels : [ "Red", "Blue", "Yellow", "Green", "Purple",
									"Orange" ],
							datasets : [ {
								label : '# kcalories',
								data : [ 12, 19, 3, 5, 2, 3 ],
								backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)' ],
								borderColor : [ 'rgba(255,99,132,1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});

					}); 
				            },
				error: function(xhr,status,errorThrown){
					console.log("xhr >>",xhr);			}
		});



				
	
			});
</script>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
