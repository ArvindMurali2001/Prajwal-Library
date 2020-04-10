<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Book</title>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css'> 
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/select/1.3.1/css/select.bootstrap4.min.css'> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js'></script>


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="/css/styles.css">

<link rel="stylesheet" type="text/css" href="/css/AllPages.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


<script>
$(function() {
    $('.date-picker').datepicker( {
        changeDay:true,
    	changeMonth: true,
        changeYear: true,
        dateFormat: 'dd-mm-yy',
      /*   onClose: function(dateText, inst) { 
        	var day = $("#ui-datepicker-div .ui-datepicker-day :selected").val();
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(day,month,year));
        } */
    });
});

function addauthorid(){
	
	//alert("CHECK");
	
	//console.log(document.getElementById("authorname").value);
	
	document.getElementById("authorid").value = Number(document.getElementById("authorname").value);
	
}

</script>



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
  <h2><center>Book Details</center></h2>
  	<br>
</div>

<div class="container">
  
  <form:form id="addform" action="saveBook" modelAttribute="book" method="POST">
  
    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="bname">Book Name</label>
      </div>
      </div>
      <div class="col-75">
        <form:input path="name" />
      </div>
    </div>
    
    <form:hidden id="authorid" path="authorid"/>
    
    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="author">Author</label>
      </div>
      </div>
      <div class="col-75">
      	 
      	 <form:select onchange="addauthorid()" id="authorname" path="authorFullName"  style="height:35px">
         	<form:option value="0">Select Author</form:option>
         	<c:forEach var="tempAuthor" items="${authors}">
          		<form:option id="authorname" value="${tempAuthor.authorid}">${tempAuthor.authorFullName}</form:option>
         	</c:forEach>
         </form:select>
        
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="price">Price(in Rs.)</label>
      </div>
      </div>
      <div class="col-75">
        <form:input path="price" />
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="dateofpurchase">Date Of Purchase</label>
      </div>
      </div>
      <div class="col-75">
       	<form:input type="text" path="date" class="date-picker" readonly="true"/>
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="store">Bought From</label>
      </div>
      </div>
      <div class="col-75">
        <form:select  id="store" path="boughtfrom"  style="height:35px">
         	<form:option value="None">Select Store</form:option>
         	<form:option value="Amazon">Amazon</form:option>
         	<form:option value="Flipkart">Flipkart</form:option>
         	<form:option value="Snapdeal">Snapdeal</form:option>
         	<form:option value="Other">Other</form:option>
        </form:select>
      </div>
    </div>
    <!-- <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Current Status</label>
      </div>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="lastname" >
      </div>
    </div>
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Last Borrower</label>
      </div>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="lastname" >
      </div>
    </div>
    <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Date Of Lending</label>
      </div>
      </div>
      <div class="col-75">
        <input type="text" id="calendar" name="calendar">
      </div>
    </div> -->
    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="country">Book Type</label>
      </div>
      </div>
      <div class="col-75">
        <form:select id="booktype" path="booktype" style="height:30px">
         	<form:option value="None">Select Book Type</form:option>
         	<form:option value="Physical">Physical</form:option>
         	<form:option value="Ebook">Ebook</form:option>
        </form:select> 	
      </div>
    </div>

    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="subject">Notes</label>
      </div>
        </div>
           <div class="col-75">
        <form:textarea id="notes" path="notes" style="height:100px"></form:textarea>
      </div>
    </div>
    <div class="row">
      <input type="submit" value="Save">
    </div>
 <div class="placerelative">
 
 </div>
  </form:form>
</div>

<div>
<p><center><a href="#">View Transactions</a></center></p>
</div>


</body>
</html> 