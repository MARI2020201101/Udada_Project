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
	<h1 class="h3 mb-4 text-gray-800">Food List Page</h1>
	
		<!-- <a href="/recipe/register" class="btn btn-primary">
            <span class="text">Register</span>
        </a> -->
        
        <div class="card-body">
        
            <div class="table-responsive">
            
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    
                    <thead>
	                    <tr>
	                    	<th  scope="col">식품 코드</th>
	                        <th  scope="col">대분류</th>
	                        <th  scope="col">소분류</th>
	                        <th  scope="col">식품 명</th>
	                    </tr>
                    </thead>
                    
                    <tbody>

						<c:forEach var="dto" items="${list}">
							<tr>
							
								<th scope="row"><c:out value="${dto.FNo}"></c:out></th>
								<td><c:out value="${dto.FMjclass}" /></td>
								<td><c:out value="${dto.FMinclass}"></c:out></td>
								<td><a href='/food/read?fNo=<c:out value="${dto.FNo}"/>'><c:out value="${dto.FName}"/></a></td>
							
							</tr>
							
						</c:forEach>
						
						<!-- <td class="rightCell">
						
							<div class="rightCellContent">
							
								<div class="quickSearchMiddle">
								
									<table width="100%" cellpadding="0" cellspacing="0">
									
										<tr>
											<td><div class="title">음식 검색</div></td>
										</tr>
										
										<tr style="height:42px">
											<td>
												<div>
													<input type="text" class="searchinput" id="ByFood" value="검색 입력" onclick="SearchOnclick" autocomplete="off" maxlength="50" />
													<img src="/resources/imgs/food/searchInput.png" onmouseover="this.src='/resources/imgs/food/searchInput.png'" onclick="foodSearch()" title="영양정보 검색" />
												</div>
											</td>
										</tr>
									
									</table>
								
								</div>
							
							</div>
						
						</td> -->
						
					</tbody>
					
					<div>
						
				  		<ul>
				    		<c:if test="${pageMaker.prev}">
				    			<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				    		</c:if> 
				
				    		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    			<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
				    		</c:forEach>
				
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						    </c:if> 
				  		</ul>
				  		
					</div>
					
                </table>
                
            </div>
            
        </div>


</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

        
<%@ include file="../include/footer.jsp"%>
