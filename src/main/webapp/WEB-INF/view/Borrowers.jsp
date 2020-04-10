<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrowers</title>

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

var table;
$(document).ready(function() {

    table = $('#borrowers').DataTable({
    	"language": {
	        "emptyTable": "No Borrowers"
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

function onload(){
	 $('#borrowers tbody').on( 'click', 'tr', function () {
		  data = table.row( this ).data();
		  
		  //console.log(data);
		  
	   //edit_show(table.row( this ).data());
	 } );
}

/* $('#borrowers tbody').on( 'dblclick', 'tr', function () {
	  console.log( table.row( this ).data() );
   //edit_show(table.row( this ).data());
 } );
 */
/*  $(document).ready(function(){	
	$('#borrowers tbody').on( 'dblclick', 'tr', function () {
	  
	data=table.row(this).data());
	
	}); 
}); */

function deleteborrower(){
	//console.log(data[4]);
	$.ajax({
	     type: "POST",
	     url: "/GetLentBooks",
	     datatype: "json",
        success: function(lentbooks) {

   			for(var i=0;i<lentbooks.length;i++){
   				if(lentbooks[i].borrowerid==data[0]){
					alert("Borrower hasn't returned");
					return false;
   				}  				
   			}    	
   			if(confirm('Are you sure you want to delete this borrower?'))
			{
   				$.ajax({
	   			     type: "POST",
	   			     url: "/DeleteBorrower",
	   			     data:{borrowerid : data[0]},
	   			     success: function(){
	   			    	 
	   			     },
	   		      	 /* error: function(){
	   		     	 alert("AJAX Failure Of Delete");
	   		     	 } */
	   			      
	   			  });
			}
			else
			{	
				return false;
			}
   			setTimeout("location.reload(true);",1000);
      },
      error: function(){
     	 alert("AJAX Failure");
      }
	      
	  }); 
	return false;
}


</script>
</head>
<body onload="onload()">

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
  <h2><center>Borrowers</center></h2>
  <right><button onclick="window.location.href = 'AddBorrower' ">Add Borrower</button></right>
  <br></br>
</div>


<table id="borrowers" class="table table-striped table-bordered" style="width:100%"> 
        
      			 <thead>
           			 <tr>
           			 	 <th>Id</th>
               			 <th>Name</th>
                         <th>Action</th>
            		</tr>
       			 </thead>
	  			
	  			<tbody>
	  			
	  			<c:forEach var ="tempBorrower" items="${borrowers}">
	  		
	  			<c:url var="updateLink" value="/BorrowerDetails">
	  				<c:param name="borrowerid" value="${tempBorrower.borrowerid}" />
	  			</c:url>	
	  		
	  			<c:url var="deleteLink" value="/DeleteBorrower">
	  				<c:param name="borrowerid" value="${tempBorrower.borrowerid}" />
	  			</c:url>	
	  		
	  				<tr>
	  					<td> ${tempBorrower.borrowerid} </td>
	  					<td> ${tempBorrower.firstName} ${tempBorrower.lastName} </td>
	  					<td>
	  						<a href = "${updateLink}">Details</a>  
	  						|
	  						<a href = "${deleteLink}" onclick="return deleteborrower()">Delete</a>
	  					</td>
	  					
	  				</tr>	
					  
	  			</c:forEach>
	  			
	  			</tbody>
        
</table>







</body>
</html> 
