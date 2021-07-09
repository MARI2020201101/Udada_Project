<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container card pb-3">

	<!-- Page Heading -->
	<div class="h3 mb-0 mt-3">마이 운동</div>
	<div class="col-12 pr-1" align="right">
	<button class="btn btn-primary mb-2 modalBtn" style="width: 80px">등록</button>
	</div>

			<table class="table table-bordered" id="dataTable"
				cellspacing="0">
				<thead>
					<tr align="center">
						<th scope="col" width="50%">운동 내역</th>
						<th scope="col" width="15%">총 소모 칼로리</th>
						<th scope="col" width="25%">등록일</th>
						<th scope="col" width="10%">삭제</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="dto" items="${mylist}">
						<tr align="center">
							<th scope="row">
								${dto.EName} ${dto.emTime}분
										</th>
							<td><fmt:formatNumber value="${dto.emTime*dto.EKcal/5}"
									pattern="0" />칼로리</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${dto.emDate}" /></td>
							<td>
							<form class="emDel" method="post" action="/exercise/remove?emNo=${dto.emNo}">
							<input type="hidden" name="emNo">
							<button class="btn btn-danger btn-sm removeBtn">삭제</button>
							</form>
							</td>
						</tr>
						

					</c:forEach>
				</tbody>
			</table>
			<div class="row mr-2" style="justify-content: flex-end;">
	<nav>
		<ul class="pagination">
			<li class="page-item ${exercisePageResultDTO.prev ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/mylist?pageNum=${exercisePageResultDTO.exercisePageRequestDTO.pageNum-1}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}"
				tabindex="-1" aria-disabled="true">&lt;</a></li>

			<c:forEach var="page" begin="${exercisePageResultDTO.start}"
				end="${exercisePageResultDTO.end }">
				<li
					class="page-item ${page==exercisePageResultDTO.exercisePageRequestDTO.pageNum? 'active' : '' }">
					<a class="page-link"
					href="/exercise/mylist?pageNum=${page}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}">
						<c:out value="${page}" />
				</a>
				</li>
			</c:forEach>

			<li class="page-item ${exercisePageResultDTO.next ? "":'disabled' }"><a
				class="page-link"
				href="/exercise/mylist?pageNum=${exercisePageResultDTO.exercisePageRequestDTO.pageNum+1}&keyword=${exercisePageResultDTO.exercisePageRequestDTO.keyword}">&gt;</a>
			</li>
		</ul>
	</nav>
	<form action="/exercise/mylist" method="GET" id="searchForm"
		class="d-none d-sm-inline-block ml-2 form-inline navbar-search">
		<input type="hidden" class="form-control form-control-user"
			name="pageNum" value=${exercisePageResultDTO.exercisePageRequestDTO.pageNum }>

		<div class="input-group">
			<input type="text" class="form-control bg-light border- small"
				name="keyword" value="${exercisePageRequestDTO.keyword }"
				placeholder="검색" aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary searchBtn" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>
	</div>
			


</div>
</div>
<!-- End of Main Content -->
<div class="modal" id="msgModal" tabindex="-1" role="dialog">
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
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
	<div class="modal" id="goalModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">오늘 운동 등록</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<label>운동</label>

						<div class="input-group mb-3">
							<input type="text" class="form-control searchInput" aria-describedby="btnAddon">
							<button class="btn btn-outline-secondary excsSearch" type="button" id="btnAddon"><i class="fa fa-search"></i></button>
						</div>
						<div class="input-group mb-3" id="getResultExcs">
						</div>
						<div id="excsTimeDiv">
						</div>
				
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary" id="excsAddBtn" >등록</a>
				</div>
			</div>
		</div>
	</div>

<script>
	$(document).ready(function() {
		var msg = '${msg}';
		console.log("msg>>", msg);
		if (!(msg === '' || history.state)) {
			var modal = $("#msgModal");
			console.log(modal);
			modal.modal();
		}
		
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click",function(e){

		searchForm.find("input[name='pageNum']").val(1);
		searchForm.submit();		
		});
	
	
	$(".removeBtn").on("click",function(e){
		e.preventDefault();
	if(confirm("삭제하시겠습니까? ")){
		$(this).parent().submit();
		}
		});
	
	});
	
	$(".modalBtn").on("click", function(){
        $("#goalModal").modal();   
        $("#getResultExcs").empty(); 
    	$("#excsTimeDiv").empty();
    	$("#excsAddBtn").hide();
    	$(".searchInput").val("");
    });

	$(".excsSearch").on("click", function(){
        	var excs = $(".searchInput").val();
        	var str = "";
	        $("#getResultExcs").empty();
	        $("#excsTimeDiv").empty();
        	$("#excsAddBtn").hide();
            $.ajax({
                type: "post",
                url: "/challenge/searchExcs",
                data: { eName: excs },
                dataType: "json",
                success: function (data) {
                    var cnt = 1;
                    if(data.length>0){
                    $.each(data, function (index, excs) {
                        str += "<div class='input-group mb-3'>" +
                            "<input type='text' class='form-control' aria-describedby='btnAddon" + cnt + "' value='" + excs.ename + " (" + excs.ekcal + "kcal/5분)' readonly>" +
                            "<input type='hidden' class='form-control' id='excsSelNo' value='"+excs.eno+"' readonly>" +
                            "<input type='hidden' class='form-control' id='excsSelName' value='"+excs.ename+"' readonly>" +
                            "<input type='hidden' class='form-control' id='excsSelKcal' value='"+excs.ekcal+"' readonly>" +
                            "<button class='btn btn-outline-secondary' type='button' id='btnAddon" + cnt + "'> " +
                            "<i class='fas fa-check'>" +
                            "</i>" +
                            "</button>" +
                            "</div>";
                        cnt++;
                    });
                    $("#getResultExcs").append(str);
             	   }else{
                    str += "<div class='input-group mb-3'>" +
                    "<input type='text' class='form-control' value='검색 결과가 없습니다' disabled readonly>" +
                    "</div>";
                    $("#getResultExcs").append(str);
                }
                    },
                error: function () {
                }           
        });
    });
    	
	    $("#getResultExcs").on("click","button",function(){
	    	var str="";
	    	$(this).attr("class","btn btn-outline-success")
			var check = $(this).closest("div").clone();
			$("#excsTimeDiv").empty();
			$("#getResultExcs").empty();
			$("#getResultExcs").append(check);
			str+= "<label>시간(분)</label>" +
			"<input type='number' id='excsSelTime' class='form-control'>";
			$("#excsTimeDiv").append(str);
            $("#excsAddBtn").show();
	});	
	    
		$("#excsAddBtn").on("click", function(e){
			var eNo = $("#excsSelNo").val();
			var emTime = $("#excsSelTime").val();
			var mEmail = "${loginUser}";
			var exercise_myDTO = {
					"eNo" : eNo,
					"emTime" : emTime,
					"mEmail" : mEmail,
						}

			if(emTime>=1 && !!emTime){
				$.ajax({
					type : "post",
					url : "/exercise/insert",
					data : exercise_myDTO,
					dataType : "json",
					async:false
				});
				
				location.reload();
			}else{
				$("#excsSelTime").css({"border-color": "red"});	
				setTimeout(function() { 
					$("#excsSelTime").css({"border-color": ""});	
				}, 1000);
				}
		});
</script>
<%@ include file="../include/footer.jsp"%>
	
