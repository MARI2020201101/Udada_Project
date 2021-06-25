<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->

	
	<b style="color:#FF46C5"><c:out value="${error }"></c:out></b>
	<b><c:out value="${logout }"></c:out></b>
	
	<sec:authorize access="isAnonymous()">	
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block"><img src="/resources/imgs/login-salad.svg"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
								</div>													
								<form class="user" action="/login" method="post">
									<div class="form-group">
										<input type="email" name="username" class="form-control form-control-user"
											placeholder="Enter Email Address...">
									</div>
									<div class="form-group">
										<input type="password" name="password" class="form-control form-control-user" placeholder="Password">
									</div>
									<button type="submit" class="btn btn-primary btn-lg btn-block btn-user">Login</button>						
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-6 d-none d-lg-block">
							<img src="/resources/imgs/login-salad.svg">
						</div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
								</div>
								<div class="text-center">
								<h3 class="h4 text-gray-900 mb-4">
									How was your today?<b> <sec:authentication property="principal.memberDTO.mName" /></b>
								</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>


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
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		modal.modal();
	}
});
	
</script>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
