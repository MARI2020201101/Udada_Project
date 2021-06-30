<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">운동 종류</h1>
	
	    
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th  scope="col">번호</th>
                        <th  scope="col">운동 이름</th>
                        <th  scope="col">운동 강도</th>
                        <th  scope="col">소모 칼로리(5분)</th>
                    </tr>
                    </thead>
                    <tbody>

					<c:forEach var="dto" items="${list}">
						<tr>
							<th scope="row"><c:out value="${dto.ENo}"/></th>
							<td><a href='/exercise/read?eNo=<c:out value="${dto.ENo}"/>'><c:out value="${dto.EName}" /></a></td>
							<td><c:out value="${dto.EStr}"/></td>
							<td><c:out value="${dto.EKcal}" /></td>
						</tr>
					</c:forEach>
				</tbody>
                </table>
            </div>
            </div>
            

<%@ include file="../include/footer.jsp"%>
