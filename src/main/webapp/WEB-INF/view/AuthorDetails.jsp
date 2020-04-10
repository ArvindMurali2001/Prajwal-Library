<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Author Details</title>

<link rel="stylesheet" type="text/css" href="/css/styles.css">

<link rel="stylesheet" type="text/css" href="/css/AllPages.css">

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/select/1.3.1/css/select.bootstrap4.min.css'> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js'></script>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/select/1.3.1/css/select.bootstrap4.min.css'> 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>


var data;

/* $('#books tbody').on( 'click', 'tr', function () {
	 data = table.row( this ).data();
	 console.log(data);
	} ); */


var table;
	
$(document).ready(function() {
    table = $('#books').DataTable({
    	"language": {
	        "emptyTable": "No Books By This Author"
	    },
    	"columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }
        ]
    	
    });
} );
//alert("CHECK");

function onload(){
	 $('#books tbody').on( 'click', 'tr', function () {
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
	 
	 var authorId = Number(document.getElementById("authorid").value);
	 
	 
	 $.ajax({
	     type: "POST",
	     url: "/GetBooks",
	     datatype: "json",
        success: function(books) {

   			if(books.length==0){
   				$('#books').dataTable().fnClearTable();
   			}
   			else{
   				for(var i=0;i<books.length;i++){
   		 		  if(books[i].authorid==authorId)
   		 		   {  
   					table.row.add( [
   		 			    books[i].bookid,
   		 	            books[i].name,
   		 	        	books[i].booktype,
   		 	        	books[i].status
						//"Borrowed"
   		 	        	//"Details"
   		 	        	//"<a href='/BookDetails' onclick='return bookdetails()'>Details</a>"  */
   		 	        ] ).draw( false );
   		 		   }
   			}
      }
     },
      error: function(){
     	 alert("AJAX Failure");
      }
	      
	  }); 

}

function load(){
	
	$.ajax({
	     type: "POST",
	     url: "/GetBooksByAuthor",
	     datatype: "json",
       success: function(books) {

    	   if(books.length==0){
    		   $('#books').dataTable().fnClearTable();
    	   }
  			
    	},
     	error: function(){
    	 alert("AJAX Failure");
    	 }
	      
	  	}); 

	
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

<div>
<br>
  <h2><center>Author Details</center></h2>
<br>
</div>

<div class="container">
  
  <form:form action="saveAuthor" modelAttribute="author" method="POST">
  
   <form:hidden path="authorid"/>
  
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
        <label for="country">Country</label>
      </div>
      </div>
      <div class="col-75">
        <form:select id="country" path="country"  style="height:30px">
         <c:forEach var="tempcountry" items="${countries}">
          	<form:option value="${tempcountry}">${tempcountry}</form:option>
         </c:forEach>
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
        <form:textarea id="subject" path="notes" style="height:75px"/></textarea>
      </div>
    </div>

    
    <div class="row">
      <input type="submit" value="Update">
    </div>

  </form:form>
</div>

<div>
<br>
<h3><center>Books</center></h3>
</div>

<table id="books" class="table table-striped table-bordered" style="width:100%">
<br>
				<thead>
           			 <tr>
           			 	 <th>BookId</th>
               			 <th>Book</th>   
               			 <th>Book Type</th>             		 
                         <th>Availability</th>
                         <th>Action</th>
            		</tr>
       			 </thead>
	  			
	  			 <tbody>
	  			
	  			<c:forEach var ="tempBook" items="${books}">
	  		
	  			<c:url var="updateLink" value="/BookDetails">
	  				<c:param name="bookid" value="${tempBook.bookid}" />
	  			</c:url>	
	  		
	  				<tr>
	  					<td> ${tempBook.bookid} </td>
	  					<td> ${tempBook.name}</td>
	  					<td> ${tempBook.booktype}</td>
	  					<td> ${tempBook.status}</td>
	  					<td>
	  						<a href = "${updateLink}">Details</a>  
	  					</td>
	  					
	  				</tr>	
					  
	  			</c:forEach>
	  			
	  			</tbody>
	
</table>



</body>
</html> 