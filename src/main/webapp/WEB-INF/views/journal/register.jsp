<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Journal Register Page</h1>

<form method="POST" action="/journal/register">

      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user" name="jContent"
                       placeholder="Content"></textarea>
      </div>
      <div style="display:none;" class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user" name="mEmail" >
      </div>
      <div class="form-group row">
       	<input type="file" name="filename" size="50">
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
