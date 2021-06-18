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
        <button class="btn btn-secondary addIngreBtn"><span class="text">ADD INGREDINT</span></button>
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
              			<input class="form-control amountInput"type="text" placeholder="Add Amount...">
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
	var cloneModal = modal.clone();


	//여기부터 다시
	$(".searchResult ul").on("click","button",function(e){

		console.log(this);
		
		});//
	
	$(".addIngreBtn").on("click", function(e){
		e.preventDefault();
		modal.find(".amountBtn").hide();
		modal.find(".amountDiv").hide();
		modal.modal();

		$(".searchBtn").click(function(e){
			e.preventDefault();
			console.log(this);
			
			var keyword = $(".searchInput").val();
			console.log(keyword);
			
 			$.getJSON("/searchForIngredient?keyword="+keyword, function(array){
					var str = "";
					
					if(array.length<1){
						str +="<p>검색결과가 없습니다.</p>";
						$(".searchResult ul").append(str);
						return;
						}
					
					$.each(array, function(idx,obj){
						str+="<li data-fno='"+ obj.fno +"'><b>" + obj.fname +"</b><div>"
				        +"<span>carbo : "+ obj.fcarbo +"</span>&nbsp;"
				        +"<span>protein : "+ obj.fprotein +"</span>&nbsp;"
				        +"<span>fat : "+ obj.ffat +"</span>&nbsp;"
				        +"<span>kcal : "+ obj.fkcal +"</span></div><div>"
						+"<button type='button' class='btn btn-success btn-sm my-1 addIngreBtn'>"
						+"ADD INGREDINET</button></div></li><br>"
						console.log(obj);
						});
				$(".searchResult ul").append(str);
				
				}); 
			
			
			});
		
		});
});
	

</script>
<%@ include file="../include/footer.jsp"%>
