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
        <input type="text" class="form-control form-control-user" name="rTitle" >
      </div>
      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user" name="rContent" 
                       placeholder="Content"></textarea>
      </div>
      <div class="form-group row">
        <button class="btn btn-secondary addIngreBtn"><span class="text">ADD INGREDINT</span></button>
      </div>
      <div class="ingreBox"></div>
      <br>
      <div class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user" name="mEmail" >
      </div>
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
	
	$(".searchResult ul").on("click","button",function(e){

		var selected = $(this).closest("li").clone();
		$(".searchResult ul").empty();
		$(".searchResult ul").html(selected);
		console.log("selected>>>",selected);
		$(".addBtn").hide();
		amountDiv.show();
		amountBtn.show();
		fnoInselected = selected.data('fno');
		fnameInselected = selected.data('fname');

	});	


	amountBtn.click(function(e){		
			e.preventDefault();
			amount = amountInput.val();			
			console.log("amount>>" ,amount);
		 	str2 = "<li data-amount='"+ amount +"' data-fno='"+ fnoInselected +"'><div class='card w-80'>"
				+ "<div class='card-body'><b class='card-title'>" + fnameInselected + "</b>"
		    	+ "<p class='card-text' >selected amount : "+amount +" </p>"
		    	+ "<button type='button' class='btn btn-danger btn-sm cancelIngre' >&times;</button>"
		  		+ "</div></div></li>" 
 
			ingreBox.append(str2);
			modal.modal('hide');
		
			});

	
   ingreBox.on("click",".cancelIngre", function(e){
		console.log($(this));
		$(this).closest('li').remove();

		}); 
	
	$(".addIngreBtn").on("click", function(e){
		e.preventDefault();
		searchInput.val('');
		amountInput.val(1.0);
		$(".searchResult ul").empty();
		searchBtn.show();
		modal.find(".amountBtn").hide();
		modal.find(".amountDiv").hide();
		modal.modal();

		searchBtn.click(function(e){
			e.preventDefault();			
			var keyword = searchInput.val();
			var str = "";
 			$.getJSON("/searchForIngredient?keyword="+keyword, function(array){
 					
					searchBtn.hide();				
					
						$.each(array, function(idx,obj){
						//console.log(obj);
						str+="<li data-fno='"+ obj.fno +"' data-fname='" + obj.fname+ "'>"
						  + "<div class='card w-80'><div class='card-body'><b class='card-title'>"+obj.fname+"</b>"
						  +  "<p class='card-text'><span>carbo : "+ obj.fcarbo +"</span>&nbsp;"
						  + "<span>protein : "+ obj.fprotein +"</span>&nbsp;"
					      + "<span>fat : "+ obj.ffat +"</span>&nbsp;"
					      +   "<span>kcal : "+ obj.fkcal +"</span></p>"
						  + "<button type='button' class='btn btn-success btn-sm addBtn'>ADD INGREDINET</button>"
						  + "</div></div></li><br>"
						
						});
				
						$(".searchResult ul").append(str);
						
				}); 
 			
			});
		
		});
});
	

</script>
<%@ include file="../include/footer.jsp"%>
