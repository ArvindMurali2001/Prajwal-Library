<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
    table = $('#books').DataTable({
    	"language": {
	        "emptyTable": "No Books"
	    },
	    'destroy' : true,
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
		  
		  //console.log(data);
		  
	   //edit_show(table.row( this ).data());
	 } );
}
/*  $(document).ready(function(){	
	$('#authors tbody').on( 'dblclick', 'tr', function () {
	  
	data=table.row(this).data());
	
	}); 
}); */

function deletebook(){
	//console.log(data[4]);
	$.ajax({
	     type: "POST",
	     url: "/GetLentBooks",
	     datatype: "json",
        success: function(lentbooks) {

   			for(var i=0;i<lentbooks.length;i++){
   				if(lentbooks[i].bookid==data[0]){
					alert("Book hasn't been returned");
					return false;
   				}  				
   			}    	
   			if(confirm('Are you sure you want to delete this book?'))
			{
		   				$.ajax({
		   			     type: "POST",
		   			     url: "/DeleteBook",
		   			     data:{bookid : data[0]},
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
   			//$('#books').DataTable().ajax.reload();
   			//$('#books').DataTable().ajax.reload()
   			// location="/Redirect"; 
   			setTimeout("location.reload(true);",1000);
      },
      error: function(){
     	 alert("AJAX Failure");
      }
	      
	  });
	
	return false;
}


function load(){    
	 /* alert("CHECK"); */
 $.ajax({
	   type: "GET",
	   url: "/GetBooks",
	   datatype:"json",
	   success: function (jobject) {
		 // console.log(jobject);
		if(!jobject.length)
			{
			//$('#example').DataTable().ajax.reload();
			//alert("None");
			$('#books').dataTable().fnClearTable();
			}
		else{
			//alert("");
		 for(var i=0;i<jobject.length;i++){
		  table.row.add( [
			    jobject[i].bookid,
	            jobject[i].name,
	            jobject[i].authorFullName,
	            jobject[i].status
	        ] ).draw( false );
		 }
		}
			},
       error: function(){
  	   alert("AJAX Failure");
       }
   });  
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
  <h2><center>Books</center></h2>
  <right><button onclick="window.location.href = 'AddBook' ">Add Book</button></right>
  <br></br>
</div>



<table id="books" class="table table-striped table-bordered" style="width:100%"> 
        
      			 <thead>
           			 <tr>
           			 	 <th>Id</th>
               			 <th>Name</th>
                		 <th>Author</th>
                         <th>Physical/E-Book</th>
                         <th>Availability</th>
                         <th>Action</th>
            		</tr>
       			 </thead>
	  			
	  			<tbody>
	  			
	  			<c:forEach var ="tempBook" items="${books}">
	  		
	  			<c:url var="updateLink" value="/BookDetails">
	  				<c:param name="bookid" value="${tempBook.bookid}" />
	  			</c:url>	
	  		
	  			<c:url var="deleteLink" value="/DeleteBook">
	  				<c:param name="bookid" value="${tempBook.bookid}" />
	  				<c:param name="bookstatus" value="${tempBook.status}" />
	  			</c:url>	
	  		
	  				<tr>
	  					<td> ${tempBook.bookid} </td>
	  					<td> ${tempBook.name}</td>
	  					<td> ${tempBook.authorFullName}</td>
	  					<td> ${tempBook.booktype} </td>
	  					<td> ${tempBook.status} </td>
	  					<td>
	  						<a href = "${updateLink}">Details</a>  
	  						|
	  						<a href = "${deleteLink}" onclick="return deletebook()">Delete</a>
	  					</td>
	  					
	  				</tr>	
					  
	  			</c:forEach>
	  			
	  			</tbody>
        
</table>

        
</table>

</body>
</html> 