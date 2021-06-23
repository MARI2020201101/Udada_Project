<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Recipe Read Page</h1>
	<input type="hidden" class="form-control form-control-user" name="pageNum" value=${pageRequestDTO.pageNum }>
	<input type="hidden" class="form-control form-control-user" name="keyword" value=${pageRequestDTO.keyword }>
	<input type="hidden" class="form-control form-control-user" name="rNo" value="${dto.RNo}">
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
	var msg = '${msg}';
	var ingreName = $(".ingreName");
	var ingreBox = $(".ingreBox");

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
