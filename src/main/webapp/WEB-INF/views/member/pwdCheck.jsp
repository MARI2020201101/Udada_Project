<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">비밀번호 확인</h1>
	<form action="/member/pwdCheck" method="post" id="memfrm">
	<input type="hidden" name="mEmail" id="mEmail" class="form-control form-control-user" value="user01@gmail.com" readonly>
		<div class="form-group row">
			<label>비밀번호</label>
			<input type="password" name="mPw" id="mPw" class="form-control form-control-user" required>
		</div>
		<div class="form-group row">
			<input type="submit" id="update" name="update" class="btn btn-facebook btn-block" value="수정하기">
		</div>
		<div class="form-group row">
			<input type="button" id="cancel" name ="cancel" class="btn btn-google btn-block" value="취소">
		</div>
	</form>

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
	if (!(msg===''||history.state)){
		var modal= $(".modal");
		modal.modal();
	}
});
	
</script>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
