<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Journal list Page</h1>
	
	<!-- Topbar Search -->
		<form action="/journal/list" method="GET" id="searchForm"
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageResultDTO.pageRequestDTO.pageNum }/>
			
			<div class="input-group">
				<input type="text" class="form-control bg-light border- small" name="keyword" value="${pageRequestDTO.keyword }"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary searchBtn" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>

	<hr>

	<c:forEach var="dto" items="${list}">
	<div style="margin: 0 auto; width:50%;"><a href='/journal/read?jNo=<c:out value="${dto.JNo}"/>'>${dto.MEmail }</a></div>
		<div class="card" style="margin: 0 auto; width: 50%;">
			<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
				<img src="/image/show?imagePath=${dto.imageDTO.imagePath }" height="450px">
			</c:if>
			<!--  <img src="/resources/imgs/heart2.svg" class="card-img-top">-->
			<hr>
			<div class="card-body">
				<p class="card-text">${dto.JContent }</p>
			</div>
			<hr>
			
			<div>
				<a class="btn heart">
           		<img id="heart" src="" width="40px"></a>${dto.LCnt }
           		<a class="btn">
           		<img id="comment" src="/resources/imgs/comment.svg" width="40px"></a>
			</div>

			

			
    <div class="row height d-flex justify-content-center align-items-center">
        <div class="col-md-12">
            <div class="card">
                <div class="p-3">
                    <h6>Comments</h6>
                    <input type="hidden" name="mEmail" value="${dto.MEmail }"/>
                    <input type="hidden" name="jNo" value="${dto.JNo }"/>
                </div>
                <div class="mt-3 d-flex flex-row align-items-center p-3 form-color"> <img src="https://i.imgur.com/zQZSWrt.jpg" width="50" class="rounded-circle mr-2"> <textarea type="text" id="reContent" class="form-control" placeholder="Enter your comment..."></textarea>
                &nbsp;<input type="button" class="btn btn-primary" id="replybtn" value="등록"></input></div>
                <div class="mt-2">
                    <div class="d-flex flex-row p-3"> 
                    <img src="https://i.imgur.com/zQZSWrt.jpg" width="40" height="40" class="rounded-circle mr-3">
                        <div class="w-100">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex flex-row align-items-center"> <span class="mr-2">${dto.replyDTO.MEmail }</span> <small class="c-badge">Top Comment</small> </div> <small>12h ago</small>
                            </div>
                            <p>${dto.replyDTO.reContent }12333</p>
                            <div class="d-flex flex-row user-feed"> <span class="wish"><i class="fa fa-heartbeat mr-2"></i>24</span><span class="ml-3"><i class="fa fa-comments-o mr-2"></i>Reply</span> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

		</div>
		<br>
	</c:forEach>
	
	
	<nav>
		  <ul class="pagination">
		    <li class="page-item ${pageResultDTO.prev ? "":'disabled' }">
		      <a class="page-link" href="/journal/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&keyword=${pageResultDTO.pageRequestDTO.keyword}" tabindex="-1" aria-disabled="true">Prev</a>
		    </li>
		    
		    <c:forEach var="page" begin="${pageResultDTO.start}" end="${pageResultDTO.end }">
		    	<li class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
		    		<a class="page-link" href="/journal/list?pageNum=${page}&keyword=${pageResultDTO.pageRequestDTO.keyword}">
		    			<c:out value="${page}"/>
		    		</a>
		    	</li>
		    </c:forEach>
		   
		    <li class="page-item ${pageResultDTO.next ? "":'disabled' }">
		      <a class="page-link" href="/journal/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&keyword=${pageResultDTO.pageRequestDTO.keyword}">Next</a>
		    </li>
		  </ul>
		</nav>

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
				<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	/*
	function replySave(mEmail, jNo){
		console.log($("#reContent").text());
		console.log($("#reContent").val());
		
		var data={
				mEmail : mEmail,
				jNo : jNo,
				reContent : $("#reContent").text()
		}
		
		$.ajax({  
			type : "post",
			url : "/reply/replyinsert",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			dataType : "json"
		}).done(function(result){
			console.log(result);
			});	
		}
	*/
	
	
	$("#replybtn").on("click", function(e) {
		alert("클릭");
		var mEmail = "user01@gmail.com"; //회원 아이디
		var jNo = "${dto.JNo}"; //글번호
		var reContent = $("#reContent").val(); //댓글 내용
		
		$.ajax({
			type : "POST",
			url : "/reply/replyinsert",
			data : {reContent : reContent,
					jNo : jNo,
					mEmail : mEmail},
			dataType : "json",
			success :
				function(data){
				var msg;
				var result= result;
				
				switch(result){
				case 1 : //성공
					msg = "댓글 등록 성공";
					//작성한 textarea를 지워줌
					$("#reContent").val("");
					selectRlist();
					break;
					
				case 0 : //등록 실패
					msg = "댓글 등록 실패";
					break;
				
				case 2 :
					msg = "댓글 등록 오류 발생";
					break;
				}
				alert(msg);
				},
				error : function(){
					console.log("ajax 댓글 실패");
				}
		});
	});
	
	//댓글 목록 조회
	function selectRlist(){
		var jNo = "${dto.JNo}";
		
		$.ajax({
			url : "reply/replylist",
			type : "POST",
			data : {"jNo" : jNo},
			dataType : "json",
			success : function(rList){
				var $rArea = $("#reListArea");
				//console.log(rList);
				
				if(rList = ""){ //조회할 댓글이 없는 경우
					$rArea.html("<li>등록된 댓글이 없습니다</li>")
				}else{
					$rArea.html(""); //기존 댓글 목록 삭제
					
					$.each(rList : function(i){
						var $li = $("<li>");
						var $rWriter = $("<span>").prop(
										"class", "rWriter").html(rList[i].mEmail);
						var $rDate = $("<span>").prop(
									"class", "wDate").html(rList[i].reDate);
						var $rContent = $("<p>").prop("class", "reContent").html(rList[i].reContent);
						var $hr = $("<hr>");
						
						//메소드 체이닝
						$li.append($rWriter).append($rDate).append("$rContent");
						
						$rArea.append($li).append($hr);
					});
				}
				
			},
			error : function(){
				console.log("댓글 목록 조회 ajax 실패");
			}
		});
	}
	
	$(function(){
		selectRlist();
	});


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


<!-- 좋아요 버튼 -->
<script>
/*
	$(document).ready(function() {

		var heartval = ${heart};

		if (heartval > 0) {
			console.log(heartval);
			$("#heart").prop("src", "/resources/imgs/heart2.svg");
			$(".heart").prop('name', heartval)
		} else {
			console.log(heartval);
			$("#heart").prop("src", "/resources/imgs/heart1.svg");
			$(".heart").prop('name', heartval)
		}

		$(".heart").on("click", function() {

			var that = $(".heart");

			var sendData = {
				'mEmail' : '${dto.MEmail}',
				'heart' : that.prop('name')
			};
			$.ajax({
				url : '/journal/heart',
				type : 'POST',
				data : sendData,
				success : function(data) {
					that.prop('name', data);
					if (data == 1) {
						$('#heart').prop("src", "/resources/imgs/heart2.svg");
					} else {
						$('#heart').prop("src", "/resources/imgs/heart1.svg");
					}

				}
			});
		});
	});
	*/
</script>
<!-- 좋아요 버튼 끝 -->

<%@ include file="../include/footer.jsp"%>
