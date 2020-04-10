<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Borrower</title>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css'> 
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/select/1.3.1/css/select.bootstrap4.min.css'> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/css/styles.css">

<link rel="stylesheet" type="text/css" href="/css/AllPages.css">


</head>
<body>

<div id='cssmenu'>

	<ul>
   		<li><a href='/'><span>Home</span></a></li>
   		
   		<li class='active has-sub'><a href='#'><span>Masters</span></a>
      		<ul>
         		<li><a href='Books'><span>Books</span></a></li>
         		<li><a href='Authors'><span>Authors</span></a></li>
         		<li><a href='Borrowers'><span>Borrowers</span></a></li>
      		</ul>
   		</li>
   
   		<li class='active has-sub'><a href='#'><span>Transactions</span></a>
      		<ul>
         		<li><a href='Lent'><span>Lent</span></a></li>
         		<li><a href='Returned'><span>Returned</span></a></li>
      		</ul>
   		</li>
   
	</ul>
   </div>


<div>
	<br>
  <h2><center>Borrower Details</center></h2>
	<br>
</div>

<div class="container">

	<form:form name="form" action="saveBorrower" modelAttribute="borrower" method="POST">  

    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="fname">First Name</label>
      </div>
      </div>
      <div class="col-75">
        <form:input path="firstName" />
      </div>
    </div>
   
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Last Name</label>
      </div>
      </div>
      <div class="col-75">
        <form:input path="lastName" />
      </div>
    </div>
  
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Mobile Number</label>
      </div>
      </div>
      <div class="col-75">
        <form:input id="mobileNumber" name="mobileNumber" path="mobileNumber" />
      </div>
    </div>
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Email</label>
      </div>
      </div>
      <div class="col-75">
        <form:input path="email" />
      </div>
    </div>
    
    <div class="row">
      <input type="submit" value="Save">
    </div>

  </form:form>
</div>

<!-- <div class="place1">
<h3>Outstanding Books</a></h3>
</div> -->

<!-- <div class="place">
<p><a href="www.google.co.in">View All Transactions</a></p>
</div> -->


</body>
</html> 