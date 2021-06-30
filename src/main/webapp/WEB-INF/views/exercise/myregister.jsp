<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Recipe Register Page</h1>

<form method="POST" action="/exercise/register">
      
		<button class="btn btn-primary registerBtn">
			<span class="text">Register</span>
		</button>
	</form>
	

</div>
<!-- /.container-fluid -->
</div>

<!-- End of Main Content -->
<div class="modal" tabindex="-1" role="dialog" id="addIngreModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Ingredient</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                 
                    <div class="form-group">
              			<input class="form-control searchInput" type="text" placeholder="Search Food...">
           			 </div>
           			<div class="form-group amountDiv">
              			<input class="form-control amountInput" type="text" value=1.0 placeholder="Add Amount...">
           			 </div>
           			 <div class="searchResult">
           			 	<ul></ul>
           			 </div>
					</div>
                    <div class="modal-footer">
                    	<button type="button" class="btn btn-success searchBtn">SEARCH</button>
                     	<button type="button" class="btn btn-success amountBtn">ADD AMOUNT</button>         
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
<script>

$(document).ready(function(){
	var modal = $("#addIngreModal");
	var searchBtn = $(".searchBtn");
	var amountBtn = $(".amountBtn");
	var amountDiv = $(".amountDiv");
	var searchInput = $(".searchInput");
	var amountInput = $(".amountInput");	
	var ingreBox = $(".ingreBox");	
	
	var cloneModal = modal.clone();
	var str2="";	
	var amount = 0;
	var fnoInselected="";
	var fnameInselected="";
	
	$(".registerBtn").click(function(e){
		e.preventDefault();
		console.log(this);
		var str="";
		 $(".ingreBox li").each(function (i , obj){
			 var target =$(obj);
			console.log(target);
			console.log(target.data('fno'));
			str +="<input type='hidden' type='text' name='ingredientList["+ i +"].fNo' value='"+ target.data('fno') +"'>"
			str +="<input type='hidden' type='text' name='ingredientList["+ i +"].riAmount' value='"+ target.data('amount') +"'>"

			 });
		 $("form").append(str);
		 $("form").submit();
		
		
	});
	
	
});
	

</script>
<%@ include file="../include/footer.jsp"%>
