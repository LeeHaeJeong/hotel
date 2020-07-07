<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <!-- MDB icon -->
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Google Fonts Roboto -->
 <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link rel="stylesheet" href="../../resources/css/style.css">
<!-- datepicker & jquery stylesheet !! -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
  <!-- Your custom scripts (optional) -->
  <script type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  


</head>
	<body>


	
  
    <!--Main Navigation-->
    <header>

        <!--Navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar" id="zz">
			<div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
            	<div class="container1">
                    <ul class="navbar-nav mr-auto smooth-scroll">
                    <c:if test="${m.equals('index')}">
                      	<li class="nav-item">
                       		<a class="nav-link" href="#" id="za">그린호텔</a>
                       	</li>
                     </c:if>
                     
                     <c:if test="${m.equals('index')||m.equals('intro')}">
                        <li class="nav-item">
                            <a class="nav-link" href="#intro" id="za">호텔 소개</a>
                        </li>
                     </c:if>   
                     
                     <c:if test="${m.equals('index')||m.equals('reservation')}">  	
                            <li class="nav-item">
                            <a class="nav-link" href="#roomtype" id="za">객실 소개 & 예약</a>
                        </li>
                     </c:if>
                     <c:if test="${m.equals('index')||m.equals('facility')}">
                        <li class="nav-item">
                            <a class="nav-link" href="#facility" id="za">호텔 시설</a>
                        </li>
                     </c:if>
                     <c:if test="${m.equals('index')||m.equals('companyintro')}">
                        <li class="nav-item">
                            <a class="nav-link" href="#companyintro" id="za">회사 소개</a>
                        </li>
                     </c:if>   
                     <c:if test="${m.equals('index')||m.equals('list')}">
                        <li class="nav-item">
                            <a class="nav-link" href="#list" id="za">고객 문의</a>
                        </li>
                     </c:if>   
                        
                    </ul>
                    <!-- Links -->
 				</div>
 				
                <!-- Collapsible content -->
            </div>
              <!--/.Navbar-->
        
        		<div class="container2">
                    <!-- Social Icon  -->
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item">
                            <a class="nav-link"><i class="fab fa-facebook"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><i class="fab fa-twitter"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><i class="fab fa-instagram"></i></a>
                        </li>
                    </ul>
      			</div>
        </nav>
    </header>   
