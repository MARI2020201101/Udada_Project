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

	<!-- Page Heading -->
	<!-- h1 class="h3 mb-4 text-gray-800">Food List Page</h1> -->
	
		<!-- <a href="/recipe/register" class="btn btn-primary">
            <span class="text">Register</span>
        </a> -->
        
        <div class="card-body">
        
        	<h1 class="h3 mb-4 text-gray-800">
				<a href="/food/list"> Food MjList Page</a>
			</h1>
        
        	<%-- --%>
        	<form action="/food/list" method="GET" id="searchForm" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
				
				<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageResultDTO.pageRequestDTO.pageNum }>

				<div class="input-group">
						
					<input type="text" class="form-control bg-light border- small" name="keyword" value="${pageRequestDTO.keyword }"
						placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
						
					<div class="input-group-append">
						<button class="btn btn-primary searchBtn" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
						
				</div>
				
			</form> 
        
            <c:forEach items="${list}" var="dto">
            
            	<div class="card border-left-primary shadow h-100 py-2 px-2">
								
					<div class="row g-0">
									
						<div class="col">
									
							<div class="card-body">
										
								<h5 class="card-title">
									<a href='/food/MinClassPage?fMjclass=<c:out value="${dto.FMjclass}"/>'><c:out value="${dto.FMjclass}"/></a>
								</h5>
											
							</div>
									
						</div>
						
					</div>
							
				</div>
            
            </c:forEach>
            
        </div>

	 <nav>			
		
		<ul class="pagination">
						 	
			<li class="page-item ${pageResultDTO.prev ? "":'disabled' }">
				<a class="page-link" href="/food/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum-1}&keyword=${pageResultDTO.pageRequestDTO.keyword}" tabindex="-1" aria-disabled="true">Prev</a>
			</li>
						    
			<c:forEach var="page" begin="${pageResultDTO.start}" end="${pageResultDTO.end }">
				<li class="page-item ${page==pageResultDTO.pageRequestDTO.pageNum? 'active' : '' }">
					<a class="page-link" href="/food/list?pageNum=${page}&keyword=${pageResultDTO.pageRequestDTO.keyword}">
						<c:out value="${page}"/>
					</a>
				</li>
			</c:forEach>
						   
			<li class="page-item ${pageResultDTO.next ? "":'disabled' }">
				<a class="page-link" href="/food/list?pageNum=${pageResultDTO.pageRequestDTO.pageNum+1}&keyword=${pageResultDTO.pageRequestDTO.keyword}">Next</a>
			</li>
							    
		</ul> 
		 
		<%--
		<ul class="pagination">		
			
			<li class="page-item">
				
				<c:if test="${paging.startPage != 1 }">
					<a href="/food/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
			
			</li>

			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
				<c:choose>
				
					<c:when test="${p == paging.nowPage }">
						<b>${p}</b>
					</c:when>
		
					<c:when test="${p != paging.nowPage }">
						<a href="/food/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p}</a>
					</c:when>
					
				</c:choose>
			</c:forEach>
	
			<li class="page-item">
			
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="/food/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			
			</li>
	
		</ul>
		
		
		<div>
			
		  	<ul>
		    	<c:if test="${pageMaker.prev}">
		    		<li><a href="/food/list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			    </c:if> 
		
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    	<li><a href="/food/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
			    </c:forEach>
			
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    	<li><a href="/food/list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			    </c:if> 
			 </ul>
			 
		</div>
		--%>
						  	
	</nav>

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
