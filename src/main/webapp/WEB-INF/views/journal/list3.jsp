<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">journal list Page</h1>

	<a href="/journal/register" class="btn btn-primary"> <span
		class="text">저널등록</span>
	</a>

	<div class="card" style="width: 50%;">
		<img src="/resources/imgs/heart2.svg" class="card-img-top" alt="...">
		<hr>
		<div class="card-body">
			<p class="card-text">내용</p>
		</div>
		<div>
			<button>좋아요</button><button>댓글</button>
		</div>
	</div>


</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<div class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Result</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
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
	$(document).ready(function() {
		var msg = '${msg}';
		console.log("msg>>", msg);
		if (!(msg === '' || history.state)) {
			var modal = $(".modal");
			console.log(modal);
			modal.modal();
		}
	});
</script>


<!-- 좋아요 버튼 -->
<script>
	$(document).ready(function() {

		var heartval = $
		{
			heart
		}
		;

		if (heartval > 0) {
			console.log(heartval);
			$("#heart").prop("src", "/resources/imgs/heart2.svg");
			$(".heart").prop('name', heartval)
		} else {
			console.log(heartval);
			$("#heart").prop("src", "/resources/imgs/heart1.svg");
			$(".heart").prop('name', heartval)
		}

		$(".heart").on("click", function() {

			var that = $(".heart");

			var sendData = {
				'mEmail' : '${dto.MEmail}',
				'heart' : that.prop('name')
			};
			$.ajax({
				url : '/journal/heart',
				type : 'POST',
				data : sendData,
				success : function(data) {
					that.prop('name', data);
					if (data == 1) {
						$('#heart').prop("src", "/resources/imgs/heart2.svg");
					} else {
						$('#heart').prop("src", "/resources/imgs/heart1.svg");
					}

				}
			});
		});
	});
</script>
<!-- 좋아요 버튼 끝 -->

<%@ include file="../include/footer.jsp"%>
