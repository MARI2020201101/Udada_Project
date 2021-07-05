<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Begin Page Content -->

<div class="container-fluid">

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-lg font-weight-bold text-primary text-uppercase mb-0">
								제목</div>
							<div class="mb-0 text-lg font-weight-bold"
								style="text-align: center;">${info.CTitle}</div>
							<a href="/challenge/read/${info.CNo}" class="stretched-link"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-lg font-weight-bold text-primary text-uppercase mb-0">
								기간</div>
							<div class="mb-0 text-lg font-weight-bold"
								style="text-align: center;">
								<fmt:formatDate value="${info.CStart}" pattern="yyyy-MM-dd" />
								~
								<fmt:formatDate value="${info.CFinish}" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-lg font-weight-bold text-primary text-uppercase mb-0">
								운동</div>
							<div class="mb-0 text-lg font-weight-bold"
								style="text-align: center;">
								<c:forEach var="goal" items="${info.goalList}" varStatus="i">
									<c:choose>
										<c:when test="${i.last}">
                                          		${goal.EName} ${goal.cgTime}분
                                          		</c:when>
										<c:otherwise>
                                          		${goal.EName} ${goal.cgTime}분, 
                                          		</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-lg font-weight-bold text-success text-uppercase mb-0">진행률
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="mb-0 mr-3 text-lg font-weight-bold"
										style="text-align: center; color: #216b21;">
										<c:choose>
											<c:when test="${info.progress<=100}">${info.progress}%</c:when>
											<c:otherwise>종료</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: <c:choose><c:when test="${info.progress<=100}">${info.progress}</c:when><c:otherwise>100</c:otherwise></c:choose>%"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Pending Requests Card Example -->

		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-lg font-weight-bold text-warning text-uppercase mb-0">
								챌린지
								<div style="display: inline-block; color: #F36C1F">${info.procDate}일
									째</div>
								날입니다<br> 남은
								<div style="display: inline-block; color: #F36C1F">${info.totalDate-info.procDate}일</div>
								힘내세요!
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100">
				<div class="card-body pt-3">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-lg font-weight-bold text-info text-uppercase mb-0">
								나의 성공률
								<div style="display: inline-block; color: #40777C">
									<c:forEach var="mem" items="${mem}">
										<c:choose>
											<c:when test="${mem.MEmail==loginUser}">
												<fmt:formatNumber value="${(mem.success/info.procDate)*100}"
													pattern="0" />%</c:when>
										</c:choose>
									</c:forEach>
								</div>
								<br>챌린지 평균 성공률
								<div style="display: inline-block; color: #40777C">
									<fmt:formatNumber
										value="${(info.totalScs/(info.procDate*info.memCnt))*100}"
										pattern="0" />%
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<c:choose>
			<c:when test="${info.mySuccess>0}">
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100">
						<div class="card-body pt-3">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-lg font-weight-bold text-success text-uppercase mb-0">
										오늘 챌린지 성공!<br>충분한 휴식 잊지마세요
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-danger shadow h-100">
						<div class="card-body pt-3">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div
										class="text-lg font-weight-bold text-danger text-uppercase mb-0">
										오늘은 아직?<br> 도전하고 등록하세요!
										<a href="#" class="stretched-link"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>



	</div>

	<!-- Content Row -->

	<div class="row">
		<div class="col-lg-3 mb-4">
			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">챌린지 성공 현황</h6>
				</div>
				<div class="card-body">
					<c:forEach var="mem" items="${mem}">
						<c:choose>
							<c:when test="${mem.MEmail==loginUser}">
								<h5 class="font-weight-bold text-primary">${mem.MName}</h5>
							</c:when>
							<c:otherwise>
								<h6 class="font-weight-bold">${mem.MName}</h6>
							</c:otherwise>
						</c:choose>
						<div class="progress mb-4">
							<div class="progress-bar bg-info" role="progressbar"
								style="width: ${(mem.success/info.procDate)*100}%">${mem.success}일
								성공!</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- Area Chart -->
		<div class="col-xl-5 col-lg-6">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">챌린지 성공률 그래프</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<canvas id="myAreaChart" width="1920" height="1080"
							style="display: block; width: 460px; height: 240px;"
							class="chartjs-render-monitor"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-4 mb-4">
			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">챌린지 톡</h6>
				</div>
				<div class="card-body pt-2 pb-0">
				<div class="input-group" id="talkReg">
  					<textarea rows="1" class="form-control" ></textarea>
  					<button class="btn btn-outline-secondary" type="button"><i class="far fa-comment"></i></button>
				</div>
				</div>
				<div class="card-body pt-0 pb-2">
				<c:forEach var="talk" items="${talk}">
					<div>
						<hr class="my-2">
						<div style="display: inline-block; float: right; font-size: small;">
							<c:choose>
							<c:when test="${talk.MEmail==loginUser || loginUserRole=='ADMIN'}">
							<i class="far fa-edit talkEdit"></i>
							<i data-re-no="${talk.reNo}" data-check-talk="0" class="far fa-trash-alt talkDel"></i>
							</c:when>
							</c:choose>
						${talk.reDate}</div>
						<div class="font-weight-bold mb-1" style="font-size: small;">${talk.MName}</div>
						<div data-re-no="${talk.reNo}" class="talkContent">${talk.reContent}</div>
					<div class="input-group talkModify">
  					<textarea rows="1" class="form-control">${talk.reContent}</textarea>
  					<button data-re-no="${talk.reNo}" class="btn btn-outline-secondary applyEdit" type="button"><i class="fas fa-check"></i></button>
  					<button class="btn btn-outline-secondary cancelEdit" type="button"><i class="fas fa-times"></i></button>
					</div>
						
						<c:forEach var="reply" items="${talk.talkReply}">
							<div>
							<div class="mt-1" style="font-size: small;">&nbsp;└ ${reply.MName} : ${reply.reContent}
							<input type="hidden" value="${reply.reNo}">	
							<div style="display: inline-block; float: right; font-size: x-small;"> 
								<c:choose>
								<c:when test="${reply.MEmail==loginUser || loginUserRole=='ADMIN'}">
								<i class="far fa-edit"></i>
								<i data-re-no="${reply.reNo}" data-check-talk="1" class="far fa-trash-alt talkDel"></i>
								</c:when>
								</c:choose>
							${reply.reDate}</div></div>
							</div>
						</c:forEach>
						<div class="input-group talkReplyReg">
  						<textarea rows="1" class="form-control" ></textarea>
  						<button class="btn btn-outline-secondary" type="button"><i class="far fa-comment"></i></button>
						</div>
					</div>
				</c:forEach>
					
				</div>
			</div>
		</div>

	</div>
</div>
<script>
$(document).ready( function(){
$("#talkReg").one("click","button",function(){
	var reContent = $("#talkReg").find("textarea").val();
	if(!reContent.trim()){
		$("#talkReg").find("textarea").css({"border-color": "red"});	
		setTimeout(function() { 
			$("#talkReg").find("textarea").css({"border-color": ""});	
			}, 1000);
	}else{
		$.ajax({
			type : "post",
			url : "/challenge/talkReg",
			data : {mEmail:"${loginUser}", oriNo:${info.CNo}, reContent:reContent, reIndent:0},
			dataType : "json",
			async:false
		});
		location.reload();
	}
});
$(".talkReplyReg").hide();
$(".talkModify").hide();

});

$(".talkReplyReg").one("click","button",function(){
	var reContent = $(this).parent().find("textarea").val();
	var groupNo = $(this).parent().parent().find(".talkContent").data("reNo")
	if(!reContent.trim()){
		var textarea = $(this).parent().find("textarea");
		textarea.css({"border-color": "red"});	
		setTimeout(function() { 
			textarea.css({"border-color": ""});	
			}, 1000);
	}else{
	$.ajax({
		type : "post",
		url : "/challenge/talkReg",
		data : {mEmail:"${loginUser}", oriNo:${info.CNo}, reContent:reContent, reIndent:1, groupNo:groupNo},
		dataType : "json",
		async:false
	});
	location.reload();
	}
});

$(".talkContent").on("click", function(){
	$(this).parent().find(".talkReplyReg").toggle();
});

$(".talkDel").one("click", function(){
	var data = $(this).data();
	$.ajax({
		type : "post",
		url : "/challenge/talkDel",
		data : data,
		dataType : "json",
		async:false
	});
	location.reload();
});

$(".talkEdit").on("click",function(){
	$(this).parent().parent().find(".talkModify").toggle();
	$(this).parent().parent().find(".talkContent").toggle();
});

/* $(".talkModify").one("click",".applyEdit",function(){
	var reContent = $(this).find("textarea").val();
	var reNo = $(this).parent().parent().find(".talkContent").data("reNo")
	if(!reContent.trim()){
		var textarea = $(this).find("textarea");
		textarea.css({"border-color": "red"});	
		setTimeout(function() { 
			textarea.css({"border-color": ""});	
			}, 1000);
	}else{
	$.ajax({
		type : "post",
		url : "/challenge/talkEdit",
		data : {reNo:reNo,
		dataType : "json",
		async:false
	});
	location.reload();
	}
}); */

</script>

<script>
var chartLbl = new Array();
var chartDta = new Array();
<c:choose>
<c:when test="${info.procDate>7}">
<c:set var="chartBegin" value="${info.procDate-7}"></c:set>
</c:when>
<c:otherwise>
<c:set var="chartBegin" value="0"></c:set>
</c:otherwise>
</c:choose>
<c:forEach items="${day}" var="day" begin="${chartBegin}">
chartLbl.push("${day.period}");
chartDta.push(<fmt:formatNumber value="${(day.success/info.memCnt)*100}" pattern="0"/>);
</c:forEach>

//Set new default font family and font color to mimic Bootstrap's default styling

Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: chartLbl,
    datasets: [{
      label: "Earnings",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: chartDta,
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return number_format(value) + '%';
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return number_format(tooltipItem.yLabel) + '%';
        }
      }
    }
  }
});

</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>