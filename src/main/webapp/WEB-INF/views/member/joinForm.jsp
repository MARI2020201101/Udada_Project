<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">회원가입</h1>

	<form action="/member/emailCheckProc" method="post" id="memfrm">
		<div class="form-group row">
			<label>이메일</label>
			<input type="text" name="mEmail" id="mEmail" class="form-control form-control-user">
			<button type="button" value="N" id="emailCheckBtn" name="emailCheckBtn" class="btn btn-facebook btn-block" onclick="emailCheck()">이메일중복확인</button>
		</div>
		<div class="form-group row">
			<label>이름</label>
			<input type="text" name="mName" id="mName" class="form-control form-control-user" required>
		</div>
		<div class="form-group row">
			<label>비밀번호</label>
			<input type="password" name="mPw" id="mPw" class="form-control form-control-user" required>
		</div>
		<div class="form-group row">
			<label>비밀번호 확인</label>
			<input type="password" name="mPw2" id="mPw2" class="form-control form-control-user" required>
		</div>
		<div class="form-group row">
			<label>생년월일</label>
			<input type="text" name="mBirthStr" id="mBirthStr" class="form-control form-control-user selector" required>
		</div>
		<div class="form-group row">
			<label>성별</label>
		</div>
		
		<div class="form-group row">
			<input type="radio" name="mGender" id="mGender" value="M">남자&emsp;&emsp;
			<input type="radio" name="mGender" id="mGender" value="F">여자
		</div>
			<input type="hidden" name="mGrade" id="mGrade" value="USER">
		<div class="form-group row">
			<input type="submit" id="submit" name="submit" class="btn btn-facebook btn-block" value="다음단계">
		</div>
		<div class="form-group row">
			<input type="button" id="cancel" name ="cancel" class="btn btn-google btn-block" value="취소">
		</div>
	</form>
<!-- /.container-fluid -->
</div>
<script>

	$(".selector").flatpickr(
		{
			   dateFormat: "Y-m-d",
		}
	);

	$(document).ready(function(){
		$("#cancel").on("click", function(){
			location.href="/member/login";
		})
		
		$("#submit").on("click", function(){
			if($("#mEmail").val() == ""){
				alert("이메일을 입력해주세요.");
				$("#mEmail").focus();
				return false;
			}
			
			if($("#mName").val() == ""){
				alert("이름을 입력해주세요.")
				$("#mName").focus();
				return false;
			}
			
			if($("#mPw").val() == ""){
				alert("비밀번호를 입력해주세요.")
				$("#mPw").focus();
				return false;
			}
			if($("#mPw2").val() == ""){
				alert("비밀번호를 입력해주세요.")
				$("#mPw2").focus();
				return false;
			}
			
			if($("#mPw").val() != $("#mPw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#mPw2").focus();
				return false;
			}
			
			if($("#mBirth").val() == ""){
				alert("생년월일을 입력해주세요.")
				$("#mBirth").focus();
				return false;
			}
			
			var emailChkVal = $("#emailCheckBtn").val();
			if(emailChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.")
				return false;
			}else if(emailChkVal == "Y"){
				$("#memfrm").submit();
			}
		})
	})
	
	function ECheck(email){
		var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		return (email != '' && email != 'undefined' && regex.test(email));
	}//ECheck() end

	function emailCheck(){
		
		if(! (ECheck($("#mEmail").val()))){
			alert("올바른 이메일을 입력해주세요.");
			return false;
		}
		
		$.ajax({
			url : "/member/emailChk",
			type : "post",
			data : {"mEmail" : $("#mEmail").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디 입니다.")
				}else if(data == 0){
					$("#emailCheckBtn").attr("value", "Y");
					alert("사용 가능한 아이디 입니다.");
				}
			}
		})
	}
</script>
<!-- End of Main Content -->
<%@ include file="../include/footer.jsp"%>