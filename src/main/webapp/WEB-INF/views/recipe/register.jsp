<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Recipe Register Page</h1>

<form method="POST" action="/recipe/register">
      <div class="form-group row">
        <label>TITLE</label>
        <input type="text" class="form-control form-control-user" name="rTitle">
      </div>
      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user" name="rContent"
                       placeholder="Content"></textarea>
      </div>
      <div class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user" name="mEmail" >
      </div>
		<button class="btn btn-primary">
			<span class="text">Register</span>
		</button>
	</form>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
