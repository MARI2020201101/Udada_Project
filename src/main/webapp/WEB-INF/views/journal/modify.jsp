<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Journal Modify Page</h1>
	
	<form method="POST" action="/journal/modify">
		<div class="form-group row">
       <label>JNO</label>
        <input type="text" class="form-control form-control-user" name="jNo" value="${dto.JNo}" readonly>
      </div>

      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user"  name="jContent">${dto.JContent}</textarea>
      </div>
      <div class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user"  name="mEmail" value="${dto.MEmail}" readonly>
      </div>
      <a class="btn btn-secondary listBtn">
            <span class="text">LIST</span>
        </a>
        <a class="btn btn-warning modBtn">
        	<span class="text">MODIFY</span>
        </a>
        <a class="btn btn-danger removeBtn">
        	<span class="text">REMOVE</span>
        </a>
	</form>      
		
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<script>
$(document).ready(function(){
	var form = $("form");
	
	$(".modBtn").on("click",function(e){
		e.preventDefault();
		console.log($(this));
		form.submit();
		});
	$(".listBtn").on("click",function(e){
		e.preventDefault();
		console.log($(this));
		form.empty();
		form.attr("method","GET");
		form.attr("action","/journal/list");
		console.log(form);
		form.submit();
		});
	$(".removeBtn").on("click",function(e){
		e.preventDefault();
	if(confirm("삭제하시겠습니까? ")){
		form.attr("action","/journal/remove");
		console.log(form);
		form.submit();
		}
		});
});
	
</script>
<%@ include file="../include/footer.jsp"%>
