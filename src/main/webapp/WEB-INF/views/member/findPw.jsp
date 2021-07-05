<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">비밀번호 찾기</h1>

	<form action="/member/findPw" method="post">
		<div class="form-group">
			<label>이메일</label>
			<input type="text" id="mEmail" name="mEmail" class="form-control form-control-user">
			<div id="error" name="error" class="form-group" style="display:none; color:red;">유효하지 않은 이메일주소 입니다.</div>
		</div>
		<div>
			<input type="submit" id="findPwd" name="findPwd" value="비밀번호 찾기" class="btn btn-facebook btn-block" onclick="return checkPwd()">
		</div>
	</form>

<script>
	$(document).ready(function() {
		var msg = '${msg}';
		
		if (!(msg===''||history.state)){
			var modal= $(".modal");
			modal.modal();
		}
	});	
	
	function ECheck(mEmail){
		var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return mEmail != '' && mEmail != 'undefined' && regex.test(mEmail);
	}
	
	function checkPwd(){
		
		var mEmail = $("#mEmail").val();
		mEmail = mEmail.trim();
		
		if(! ECheck(mEmail)){
			$("#error").show();
			$("#mEmail").focus();
			return false;
		}else{
			$("#error").hide();
			return true;
		}
	
}

</script>
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

<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>
