<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">저널 상세보기</h1>
	<input type="hidden" class="form-control form-control-user" name="jNo" value="${dto.JNo}">
	
      <div class="form-group row">
      	<c:if test="${not empty dto.imageDTO && dto.imageDTO.IName!='' }">
      	<a href="/image/show?imagePath=${dto.imageDTO.imagePath }">      	
		<img src="/image/show?imagePath=${dto.imageDTO.thumbnailPath }">
		<p>크게보기</p>
		</a>
	  	</c:if>
	  </div>

	  <div class="form-group row">
        <label>작성자</label>
        <input type="text" class="form-control form-control-user"  value="${dto.MEmail}" readonly>
      </div>
      <div class="form-group row">
        <label>내용</label>
        <textarea rows="5" class="form-control form-control-user" readonly>${dto.JContent}</textarea>
      </div>
      <div class="form-group row">
        <label>좋아요</label>
        <input type="text" class="form-control form-control-user"  value="${dto.LCnt}" readonly>
      </div>
      <div class="form-group row">
        <label>작성일</label>
        <input type="text" class="form-control form-control-user"  value="${dto.JDate}" readonly>
      </div>
      
		<a href="/journal/mylist" class="btn btn-secondary">
            <span class="text">목록보기</span>
        </a>
        <a href='/journal/modify?jNo=${dto.JNo}' class="btn btn-warning">
        	<span class="text">수정하기</span>
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
	console.log("msg>>",msg);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
