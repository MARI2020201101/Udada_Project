<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UDADA - OUR DIET DIARY</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
    
    <!-- cdn chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
    
    
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                <div class="sidebar-brand-icon rotate-n-15">
                    <img src="/resources/imgs/logo.png" alt="logo2" width="40">
                </div>
                <div class="sidebar-brand-text mx-3">UDADA</div>
            </a>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-user"></i>
                    <span>MY PAGE</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/member/calendar">Calendar</a>
                        <a class="collapse-item" href="#">MyFood</a>
                        <a class="collapse-item" href="#">MyExercise</a>
                        <a class="collapse-item" href="/challenge/mychallenge">Mychallenge</a>
                        <a class="collapse-item" href="#">MyFitness</a>
                    </div>
                </div>
            </li>
            <!-- Nav Item - Food -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-hamburger"></i>
                    <span>FOOD</span></a>
            </li>
            <!-- Nav Item - Recipe -->
            <li class="nav-item">
                <a class="nav-link" href="/recipe/list">
                    <i class="fas fa-utensils"></i>
                    <span>RECIPE</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-dumbbell"></i>
                    <span>EXERCISE</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/challenge/list">
                    <i class="fas fa-users"></i>
                    <span>CHALLENGE</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-newspaper"></i>
                    <span>JOURNAL</span></a>
            </li>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<sec:authorize access="isAnonymous()">
							<li><a href="/member/login" class="btn btn-secondary mx-1">
									<span class="text">Login</span>
							</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li><a href="/member/logout" class="btn btn-secondary mx-1">
									<span class="text">Logout</span>
							</a></li>
						</sec:authorize>
					</ul>
				</nav>

				<!-- End of Topbar -->
				
				
				
	<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberDTO.mGrade" var="loginUserRole"/> 
   	<sec:authentication property="principal.memberDTO.mEmail" var="loginUser"/> 

    </sec:authorize>
    