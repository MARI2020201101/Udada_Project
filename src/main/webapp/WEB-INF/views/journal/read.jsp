<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">Journal Read Page</h1>

		<div class="form-group row">
       <label>JNO</label>
        <input type="text" class="form-control form-control-user" value="${dto.JNo}" readonly>
      </div>

      <div class="form-group row">
        <label>CONTENT</label>
        <textarea cols="5" class="form-control form-control-user" readonly>${dto.JContent}</textarea>
      </div>
      <div class="form-group row">
        <label>WRITER</label>
        <input type="text" class="form-control form-control-user"  value="${dto.MEmail}" readonly>
      </div>
      <div class="form-group row">
        <label>REGDATE</label>
        <input type="text" class="form-control form-control-user"  value="${dto.JDate}" readonly>
      </div>
      <div class="form-group row">
        <label>LIKE</label>
        <input type="text" class="form-control form-control-user"  value="${dto.LCnt}" readonly>
      </div>
      
		<a href="/journal/list" class="btn btn-secondary">
            <span class="text">LIST</span>
        </a>
        <a href='/journal/modify?jNo=${dto.JNo}' class="btn btn-warning">
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
	console.log("msg>>",msg);
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		console.log(modal);	
		modal.modal();
	}
});
	
</script>
<%@ include file="../include/footer.jsp"%>
