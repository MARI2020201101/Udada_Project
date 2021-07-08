<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Begin Page Content -->

<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}
</style>

<div class="container-fluid">
        
    <div class="row">
        	 
        <!-- <h1 class="h3 mb-4 text-gray-800">
			<a href="/food/FoodInfo"> Food Information Page</a>
			<h1 class="h3 mb-0 text-gray-800"><c:out value="${dto.FName}"></c:out></h1>
		</h1> -->
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-primary shadow h-100 py-2">
			
				<div class="card-body">
				
					<div class="row no-gutters align-items-center">
					
						<div class="col mr-2">
						
							<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 칼로리 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FKcal}"/></div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-success shadow h-100 py-2">
		
				<div class="card-body">
				
					<div class="row no-gutters align-items-center">
					
						<div class="col mr-2">
						
							<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 탄수화물 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FCarbo}"/></div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-success shadow h-100 py-2">
		
				<div class="card-body">
				
					<div class="row no-gutters align-items-center">
					
						<div class="col mr-2">
						
							<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 단백질 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FProtein}"/></div>
						
						</div>
					
					</div>
				
				</div>
			
			</div>	
		
		</div>
		
		<div class="col-xl-3 col-md-6 mb-4">
		
			<div class="card border-left-success shadow h-100 py-2">
		
			<div class="card-body">
			
				<div class="row no-gutters align-items-center">
				
					<div class="col mr-2">
					
						<div class="text-xs" font-weight-bold text-primary text-uppercase mb-1"> 식품 지방 </div>
						<div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${dto.FFat}"/></div>
					
					</div>
				
				</div>
			
			</div>
		
		</div>	
		
		</div>	
            
    </div>

</div>
        
<%@ include file="../include/footer.jsp"%>
