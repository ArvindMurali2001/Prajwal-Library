<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrower Details</title>

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

<script>
var data;

/* $('#books tbody').on( 'click', 'tr', function () {
	 data = table.row( this ).data();
	 console.log(data);
	} ); */


var table;
	
$(document).ready(function() {
    table = $('#outstandingBooks').DataTable({
    	"language": {
	        "emptyTable": "No Borrowed Books"
	    },
    	"columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [ 1 ],
                "visible": false,
                "searchable": false
            }
        ]
    	
    });
} );
//alert("CHECK");

function loadtable(){
	 $('#outstandingBooks tbody').on( 'click', 'tr', function () {
		  data = table.row( this ).data();
		  
		  console.log(data); 
	   //edit_show(table.row( this ).data());
	 } );
	 
/* 	 $('#outstandingBooks tbody').on( 'dblclick', 'tr', function () {
		  data = table.row( this ).data();
		  console.log(data);
		  //bookdetails();
	 }); 
	  */
	 //var books = "${lentbooks}";
		
		//console.log(books);
	 
	 var borrowerId = Number(document.getElementById("borrowerid").value);
	 
	 
	 $.ajax({
	     type: "POST",
	     url: "/Home/GetLentBooksByBorrowerId",
	     data: {borrowerId : borrowerId},
	     datatype: "json",
        success: function(lentbooks) {

   			if(lentbooks.length==0){
   				$('#outstandingBooks').dataTable().fnClearTable();
   			}
   			else{
   				for(var i=0;i<lentbooks.length;i++){
   		 		  table.row.add( [
   		 			    lentbooks[i].bookid,
   		 	            lentbooks[i].transactionid,
   		 	        	lentbooks[i].bookName,
						"Borrowed"
   		 	        	//"Details"
   		 	        	//"<a href='/Home/BookDetails' onclick='return bookdetails()'>Details</a>"  */
   		 	        ] ).draw( false );
   			}
      }
     },
      error: function(){
     	 alert("AJAX Failure");
      }
	      
	  }); 

}
/*  $(document).ready(function(){	
	$('#authors tbody').on( 'dblclick', 'tr', function () {
	  
	data=table.row(this).data());
	
	}); 
}); */

function deletebook(){
	//console.log(data[4]);
/* 	$.ajax({
	     type: "POST",
	     url: "/Home/GetLentBooks",
	     datatype: "json",
        success: function(lentbooks) {

   			for(var i=0;i<lentbooks.length;i++){
   				if(lentbooks[i].bookid==data[0]){ */
					alert("Book hasn't been returned");
					return false;
/*    				}  				
   			}    	
   			if(confirm('Are you sure you want to delete this book?'))
			{
				return true;
			}
			else
			{	
				return false;
			}
      },
      error: function(){
     	 alert("AJAX Failure");
      }
	      
	  }); 
	return false; */
}

function bookdetails(){
	
	$.ajax({
	     type: "POST",
	     url: "/Home/BookDetails",
	     data: {bookid : data[0]},
       	 success: function(lentbooks) {

     },
     	error: function(){
    	 alert("AJAX Failure");
    	 }
	      
	  }); 
	return false;
	
}


</script>


</head>
<body>

<div id='cssmenu'>

	<ul>
   		<li><a href='/Home/'><span>Home</span></a></li>
   		
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

   <form:form action="saveBorrower" modelAttribute="borrower" method="POST">  

	<form:hidden path="borrowerid"/>

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
        <form:input path="mobileNumber" />
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

<div>
<br>
<h3><center>Outstanding Books</center></h3>
</div>

<table id="outstandingBooks" class="table table-striped table-bordered" style="width:100%">
<br>
				<thead>
           			 <tr>
           			 	 <th>BookId</th>
               			 <th>TransactionId</th>
               			 <th>Name</th>                		 
                         <th>Availability</th>
                         <th>Action</th>
            		</tr>
       			 </thead>
	  			
	  			<tbody>
	  			
	  			<c:forEach var ="tempBook" items="${books}">
	  		
	  			<c:url var="updateLink" value="/Home/BookDetails">
	  				<c:param name="bookid" value="${tempBook.bookid}" />
	  			</c:url>	
	  		
	  				<tr>
	  					<td> ${tempBook.bookid} </td>
	  					<td> ${tempBook.transactionid}</td>
	  					<td> ${tempBook.bookName}</td>
	  					<td> Borrowed</td>
	  					<td>
	  						<a href = "${updateLink}">Details</a>  
	  					</td>
	  					
	  				</tr>	
					  
	  			</c:forEach>
	  			
	  			</tbody>
	
</table>
<div>
<c:url var="Link" value="/Home/BorrowerTransactions">
	  				<c:param name="borrowerid" value="${borrower.borrowerid}" />
</c:url>

<p><center><a href = "${Link}">View Transactions</a></center></p>
</div>



</body>
</html> 