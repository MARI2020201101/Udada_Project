<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Journal Register Page</h1>

<form method="POST" action="/journal/register" enctype="multipart/form-data">

      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user" name="jContent"
                       placeholder="Content"></textarea>
      </div>
      <div class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user" name="mEmail" >
      </div>
      <div class="form-group row">
      	<label>IMAGE</label>
       	<input type="file" class="form-control form-control-user imageInput" name="image" >
      </div>
		<button class="btn btn-primary">
			<span class="text">Register</span>
		</button>
		
	</form>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<script>

$(document).ready(function(){
	var imageInput = $(".imageInput");	
	
	var amount = 0;
	var fnoInselected="";
	var fnameInselected="";

	var amountDiv = $(".amountDiv");
	var regEx = new RegExp("\\.(bmp|gif|jpg|jpeg|png)$");
    var maxSize = 1024*1024*10;
    var appended = true;
    
    imageInput.change(function(e){

		
		var image = imageInput[0].files;
		console.log(image);
		var imageSize = image[0].size;
		var imageName = image[0].name;
		
		if(!(isSafeImage(imageSize, imageName))){
			appended = false;		
			}
		else{
			appended = true;			
			}	
			return appended;
		});

	function isSafeImage(imageSize, imageName){
        if(imageSize > maxSize){
            alert("10MB 이하의 이미지만 업로드 가능합니다.");
            return false;
        }
        if(!(regEx.test(imageName))){
            alert("이미지 파일만 업로드 가능합니다.");
            return false;
        }
        return true;
    };

});

</script>

<%@ include file="../include/footer.jsp"%>