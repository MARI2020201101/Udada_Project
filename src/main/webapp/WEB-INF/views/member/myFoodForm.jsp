<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->

<div class="MyFood_Header">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">My Food Diary</h1>
	<div style="clear:both; height:24px;">
		<div class="subtitle">오늘 날짜</div>
	</div>
	<div class="footer">&nbsp;</div>
	
	<div class="MyFoodDetailData">
		
		<table class="foodInfoTbl" cellspacing="0">
		
			<tbody>
			
				<tr>
					<td class="main">지방</td>
					<td class="main">탄수화물</td>
					<td class="main">단백질</td>
					<td class="main">칼로리</td>
				</tr>
				
				<tr style="height:2px">
					<td></td>
				</tr>
				
				<tr>
					<td class="sub"></td>
					<td class="sub"></td>
					<td class="sub"></td>
					<td class="sub"></td>
					<!-- 아침 식사 칼로리 계산 폼 -->
				</tr>
				
				<tr class="row">
					<td class="" style="width:100%; padding:0px">
					
					<div id="addFoodName" class="" style="paddnig-left:16px" onclick="showAddPanel('addFoodName', 'searchFood', 1); return false;">
					
						<img src="/resources/imgs/food/FA_add.png">
						<span>항목 추가하기</span>
					
					</div>
					<div id="searchFood" style="display:none; backgroud-color: rgb(247, 247, 247);">
						
						<table cellpadding="0" cellspacing="0" width="100%">
							
							<tbody>
							
								<tr style="height:53px">
								
									<td colspan="2" class="food_add_menu">
										
										<a class="food_main_link close" href="#" onclick="closeAddPanel(); return false;">
											<span>항목 추가하기</span>
										</a>
										
										<div style="float:right; padding-right:12px">
										
											<a href="#" onclick="closeAddPanel(); return false;" style="line-height:38px" class="smallText">
												<b>취소</b>
												<img src="/resources/imgs/food/FA_cancel.png" width="20px" height="20px" style="vertical-align:middle" >
											</a>
											
										</div>
								
									</td>
								</tr>
								
								<tr style="height:38px">
								
									<td class="food_add_menu"></td>
									<td align="right" class="food_add_content" valign="top">
									
										<table cellpadding="0" cellspacing="0" width="100%">
											<tbody>
												<tr>
													<td>
														<div id="foodSearch" class="foodSearch" onmouseover="on">
														
															<input id="searchExp" type="text" class="fasift" onclick="showSearch()" maxlength="50">
															<input id="searchExpAugment type="text" class="fasisn">
														
														</div>
													</td>
													<td width="10px">&nbsp;</td>
													
													<td align="rigth" width="60px">
													
														<a id="searchFoodButton" class="button" href="#" onclick="onSearchClick(); return false;">
														
															<span class="left">&nbsp;</span>
															<span class="middle" style="width:52px">
															
																"&nbsp;"
																<img src="/resources/imgs/food/searchInput.png" width="20px" height="20px">
																"&nbsp;"
															
															</span>
															
															<span class="right">&nbsp;</span>
														
														</a>
													
													</td>
												</tr>
											</tbody>
										</table>
										
										
									
									</td>
								
								</tr>
							
							</tbody>
							
						</table>
					
					</div>
				</tr>
			
			</tbody>
		
		</table>
		
	</div>
        
    <div class="card-body">
    	
        <div class="table-responsive">
            
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    
                <thead>
	                
                </thead>
                    
                <tbody>

					
						
				</tbody>
					
            </table>
                
        </div>
            
	</div>


</div>
<!-- /.container-fluid -->
<!-- End of Main Content -->

        
<%@ include file="../include/footer.jsp"%>
