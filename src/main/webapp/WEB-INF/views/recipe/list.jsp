<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Recipe list Page</h1>
	
		<a href="/recipe/register" class="btn btn-primary">
            <span class="text">Register</span>
        </a>
        
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th  scope="col">#</th>
                        <th  scope="col">Title</th>
                        <th  scope="col">Email</th>
                        <th  scope="col">RegDate</th>
                    </tr>
                    </thead>
                    <tbody>

					<c:forEach var="dto" items="${list}">
						<tr>
							<th scope="row"><c:out value="${dto.RNo}"></c:out></th>
							<td><a href='/recipe/read?rNo=<c:out value="${dto.RNo}"/>'><c:out value="${dto.RTitle}" /></a></td>
							<td><c:out value="${dto.MEmail}"></c:out></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.RDate}" /></td>
						</tr>

					</c:forEach>
				</tbody>
                </table>
            </div>
        </div>


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
	var msg = '${msg}';
	console.log("msg>>",msg);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
