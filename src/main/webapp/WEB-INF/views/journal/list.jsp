<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container-fluid">

<sec:authorize access="isAuthenticated()">

<sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/>
<sec:authentication property="principal.memberDTO.mEmail" var="loginUser"/>

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
			
			<!-- 좋아요 -->

			
				<div class="heart">
					<input type="hidden" class="mEmail" value="${loginUser}"/>
	                <input type="hidden" class="heartJno" name="jNo" value="${dto.JNo}"/>
	                <input type="hidden" class="heartval" value="${dto.likeCount}"/>
	                <c:choose>
	                	<c:when test="${dto.likeCount>0}">
						<a class="btn heartbtn" data-jno="${dto.JNo}">
	           			<img class="heartimg" src="/resources/imgs/heart1.svg" width="30px"></a>${dto.LCnt}
	           			</c:when>
	           			<c:otherwise>
	           			<a class="btn heartbtn" data-jno="${dto.JNo}">
	           			<img class="heartimg" src="/resources/imgs/heart2.svg" width="30px"></a>${dto.LCnt}
	           			</c:otherwise>
	           		
	           		</c:choose>
	           		<a class="btn">
	           		<img class="comment" src="/resources/imgs/comment.svg" width="30px"></a>
				</div>
			
			<!-- 댓글 -->
			    <div class="row height d-flex justify-content-center align-items-center">
			        <div class="col-md-12">
			            <div class="replycard">
			                <div class="p-3">
			                    <h6>Comments</h6>
			                    <input type="hidden" name="mEmail" value="${dto.MEmail }"/>
			                    <input type="hidden" id="reJno" name="jNo" value="${dto.JNo }"/>
			   
			
			                </div>
			                <div class="mt-3 d-flex flex-row align-items-center p-3 form-color"> <textarea type="text" id="reContent" class="form-control" placeholder="Enter your comment..."></textarea>
			                &nbsp;<input type="button" class="btn btn-primary replybtn" value="등록"></input></div>
			                
			                <div class="mt-2">
							<c:forEach var="reply" items="${dto.replyList}">
			                    <div class="d-flex flex-row p-3"> 
			                        <div class="w-100">
			                            <div class="d-flex justify-content-between align-items-center">
			                                <div class="d-flex flex-row align-items-center"> <span class="mr-2">${reply.MEmail}</span></div> <small>${reply.reDate }</small>
			                            </div>
			                            <p>${reply.reContent}</p>
			                            <div class="d-flex flex-row user-feed"><a class="comment" data-reno="${reply.reNo }"><small>답글작성</small></a>
			                            &nbsp;&nbsp;&nbsp;<span><a class="replymodify" data-reno="${reply.reNo }"><small>수정</small></a></span>
			                            &nbsp;&nbsp;&nbsp;<span><a class="commentdel" data-reno="${reply.reNo }"><small>삭제</small></a></span></div>
			                        </div>
			                    </div>
							</c:forEach>
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
</sec:authorize>
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

	
	
	
	$(".replybtn").on("click", function(e) {
		
		
		
		var mEmail = '${loginUser}'; //회원 아이디
		var reContent = $(this).closest(".replycard").find("#reContent").val(); //댓글 내용
		//var oriNo = $("#reJno").val();
		var oriNo = $(this).closest(".replycard").find("#reJno").val();
		var result= "";
		$.ajax({
			type : "POST",
			url : "/reply/replyinsert",
			data : {reContent : reContent,
					oriNo : oriNo,
					mEmail : mEmail,
					reDiv : "JRN"},
			dataType : "json",
			success :
				function(data){
				result= data;
				if(reContent=="" || reContent==null){
					alert("작성안됨");
				} else if(result==1){
					alert("등록되었습니다");
					location.reload(); //새로고침
				}
				},
				error : function(){
					console.log("ajax 댓글 실패");
				}
		});
	});
	
	

	$(".heartbtn").on("click", function(e) {
		
		var target = $(this);
		var targetJno = $(this).data('jno');
		console.log("targetJno>>",targetJno);
		var heartval = $(".heartval").val;
		var mEmail = '${loginUser}';
		var result = "";
		/*
		if (heartval > 0) {
			console.log(heartval);
			$(".heartimg").prop("src", "/resources/imgs/heart2.svg");
		} else {
			console.log(heartval);
			$(".heartimg").prop("src", "/resources/imgs/heart1.svg");
		}
		*/
		//alert($(this).closest(".heart").find(".heartval").val());
		
		$.ajax({
			type : "POST",
			url : "/likeyou/insertLike",
			data : {jNo : targetJno,
					mEmail : mEmail},
			dataType : "json",
			success :
				function(data){
				var data = data;
				//console.log(typeof data);
				if(data >= 1){
					$(".heartimg").prop("src", "/resources/imgs/heart2.svg");

					
				}else{
					$(".heartimg").prop("src", "/resources/imgs/heart1.svg");

				}
				location.reload();
				
			}
			
		});
		
	});
	
	
	
	$(".comment").on("click", function(e) {
		
		var targetreNo = $(this).data('reno');
		var comment = "";
		var mEmail = '${loginUser}';
		
		$.ajax({
			type : "POST",
			url : "/reply/commentInsert",
			data : {reNo : targetreNo,
					mEmail : mEmail},
			dataType : "json",
			success :
				function(data){
				var data = data;
				//console.log(typeof data);
				if(data >= 1){
					alert("삭제되었습니다.")

					
				}else{
					alert("본인이 작성한 댓글만 삭제 할 수 있습니다.")

				}
				location.reload();
				
			}
			
		});
		
		
	});
	
	
	
	$(".commentdel").on("click", function(e) {
	
		var targetreNo = $(this).data('reno');
		console.log("댓글번호 :"+targetreNo);
		var mEmail = '${loginUser}';
		
		$.ajax({
			type : "POST",
			url : "/reply/replyDelete",
			data : {reNo : targetreNo,
					mEmail : mEmail},
			dataType : "json",
			success :
				function(data){
				var data = data;
				//console.log(typeof data);
				if(data >= 1){
					alert("삭제되었습니다.")

					
				}else{
					alert("본인이 작성한 댓글만 삭제 할 수 있습니다.")

				}
				location.reload();
				
			}
			
		});
		
		
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
