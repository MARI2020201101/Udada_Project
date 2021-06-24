<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Food MjClass Page</h1>
	
		<!-- <a href="/recipe/register" class="btn btn-primary">
            <span class="text">Register</span>
        </a> -->
        
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                    	<th  scope="col">소분류</th>
                        <th  scope="col">식품명</th>
                    </tr>
                    </thead>
                    <tbody>

					<c:forEach var="dto" items="${Mn_list}">
						<tr>
							<th scope="row"><c:out value="${dto.FMinclass}"></c:out></th>
							<td><a href='/food/name?fName=<c:out value="${dto.FName}"/>'><c:out value="${dto.FName}" /></a></td>
						</tr>

					</c:forEach>
				</tbody>
                </table>
            </div>
        </div>


</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

        
<%@ include file="../include/footer.jsp"%>
