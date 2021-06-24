<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

<style>
	.starBox {font-size:0; letter-spacing:-4px;}
	.starBox span {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#FF46C5;
	    text-decoration:none;
	}
</style>
	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Recipe Read Page</h1>	
	<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageRequestDTO.pageNum }>
	<input type="hidden" class="form-control form-control-user" name="keyword" value=${pageRequestDTO.keyword }>
	<input type="hidden" class="form-control form-control-user" name="rNo" value="${dto.RNo}">
	
<div class="form-group row">
	<p class="starBox"></p>
 	</div>	
	<div class="form-group row">
		
	<select class="form-select form-select-sm selectStarOption" aria-label="이 레시피를 평가해주세요..">
	  <option value=5>5</option>
	  <option value=4>4</option>
	  <option value=3>3</option>
	  <option value=2>2</option>
	  <option value=1>1</option>
	</select>&nbsp;
	<button type="button" class="btn btn-primary btn-sm insertStarBtn" >평가하기</button>
 	</div>
	 <div class="form-group row">
      <c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
      <a href="/image/show?imagePath=${dto.imageDTO.imagePath }">      	
		<img src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
		<p>크게보기</p>
		</a>
	  </c:if>
	  </div>
      <div class="form-group row">
        <label>TITLE</label>
        <input type="text" class="form-control form-control-user" value="${dto.RTitle}" readonly>
      </div>
      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user" readonly>${dto.RContent}</textarea>
      </div>
      <div class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user"  value="${dto.MEmail}" readonly>
      </div>
      <div class="form-group row">
        <label>REGDATE</label>
        <input type="text" class="form-control form-control-user"  value="${dto.RDate}" readonly>
      </div>
 
	<div class="ingreBox">
		<ul>
			<c:if test="${not empty dto.ingredientList && dto.ingredientList.size() gt 0 }">
	
				<c:forEach var="ingredient" items="${dto.ingredientList}" varStatus="status">
					<li>
						<div class='card w-80'>
							<div class='card-body'>
								<b class='card-title ingreName'>${ingredient.FName}</b>
								<p class='card-text'>
									<span>selected amount : </span>${ingredient.riAmount}</p>
							</div>
						</div>
					</li>
				</c:forEach>

			</c:if>
		</ul>
	</div>

	<a href="/recipe/list?pageNum=${pageRequestDTO.pageNum }&keyword=${pageRequestDTO.keyword}" class="btn btn-secondary">
            <span class="text">LIST</span>
        </a>
        <a href='/recipe/modify?rNo=${dto.RNo}&pageNum=${pageRequestDTO.pageNum }&keyword=${pageRequestDTO.keyword}' class="btn btn-warning">
        	<span class="text">MODIFY</span>
        </a>
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

	var rNo = "${dto.RNo}";
	var starBox = $( ".starBox" );
	var msg = '${msg}';
	var ingreName = $(".ingreName");
	var ingreBox = $(".ingreBox");
	var insertStarBtn = $(".insertStarBtn");
	var selectStarOption = $(".selectStarOption");
	
	loadStar();
	
	insertStarBtn.click(function(e){
		var starPoint = selectStarOption.val();

		console.log("rNo>>",rNo);
		console.log("starPoint>>" , starPoint);
	var recipeGradeDTO = {
		"rNo" : rNo,
		"mEmail" : "user04@gmail.com",
		"rgGrade" : starPoint
		} 
		console.log(recipeGradeDTO);
		$.ajax({
			 url:"/recipe/grade",
	            method:"POST",
	            data:JSON.stringify(recipeGradeDTO),
	            contentType:"application/json; charset=utf-8",
	            success:function(result){
		            console.log(result);
		            loadStar();
		            },
		        error: function(xhr,status,errorThrown){
			        console.log("xhr >>",xhr);			
			        }
			});
		});
	function loadStar(){
		starBox.empty();
		
		$.getJSON("/recipe/grade/"+rNo, function(result){
			var avg = result;
			var star = Math.round(result);

			for(var i=1; i<=star ; i++){
				starBox.append("<span>★</span>");
				}
			for(var i=1 ; i<=5-star; i++){
				starBox.append("<span>☆</span>");
				}			
			starBox.append("<span>("+ result +")</span>");
			});
		}


	
	console.log("msg>>",msg);
	console.log("ingreName>>",ingreName);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}


	if(ingreName.text()==''|| ingreName.text()==null){
		console.log("$(this).closest('li')>>",$(this).closest('li'));
		ingreName.closest('li').remove();
		}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
