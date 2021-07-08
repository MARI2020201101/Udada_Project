<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->

<div class="centerContent">

	<div class="centerInnerContent">
	
		<div id="content" class="mem">
		
			<style type="text/css">
				.linkHolder{
					float:left;
					width:200px;
				}
				.linkHolder Table.greybox{
					background-color: #EBF9FC;
				}
				.common{
					margin:10px;
				}
				.secHolder{
					float:left;
					width:440px;
					margin-left:20px;
				
				}
			</style>
			
			<table class="generic">
			
				<tbody>
				
					<tr valign="top">
					
						<td class="leftCell">
						
							<div class="leftCellContent">
							
								<div class="linkHolder">
								
								 	<table class="greybox">
									
										<tbody>
										
											<tr>
											
												<td class="content">
												
													<h2><img src="/resources/imgs/food/recipesicon_trans.gif" style="vertical-align:middle">소분류</h2>
													
													<c:forEach var="dto" items="${Minlist}">
														
														<table class="common">
														
															<tbody>
														
																<tr>
																	<a href="#" data-f-minclass="${dto.FMinclass}" class="search_FoodDetail"><b><c:out value="${dto.FMinclass}"></c:out></b></a>
																</tr>		
														
															</tbody>
															
														</table>
														
													</c:forEach>
												
												</td>
											
											</tr>
										
										</tbody>
									
									</table>
								
								</div>
								
								<div class="secHolder">
								
									

								</div>
							
							</div>
						
						</td>
					
					</tr>
				
				</tbody>
				
			</table>
		
		</div>
	
	</div>
	
	<!-- <div class="secHolder">
	
		<h2></h2>
	
	</div> -->

</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

<script>

	$(".search_FoodDetail").on("click", function(){
		
		$(".secHolder").empty();
		var fMinclass = $(this).data("fMinclass");
		var str = "";	

		$.ajax({
				
			url:"/food/foodname",
			type:"GET",
			data: {fMinclass:fMinclass},
			astnc:false,
			dataType:"json",
				
			success:function(data){
				console.log(data);
					
				$.each(data, function (index, list){
					str += /* "<h4>"+
						   "<a href='/food/FoodInfo?fName="+list.fname+"'>"+list.fname+"</a>"+
					       "</h4>"; */
					       
					       "<div class=food_links>" + 
					       "	<a href='/food/FoodInfo?fNo=" + list.fno + "'> <b>" + list.fname + "</b></a>" + 
					       "</div>";
				});
					
				$(".secHolder").append(str);		
					
			},
			error:function(xhr,status,errorThrown){
					
				console.log("xhr >>",xhr);
					
			}
			
		});
		
	});
	
</script>
        
<%@ include file="../include/footer.jsp"%>
