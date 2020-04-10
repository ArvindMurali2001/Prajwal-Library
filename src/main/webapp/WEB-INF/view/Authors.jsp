<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authors</title>

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
    table = $('#authors').DataTable({
    	"language": {
	        "emptyTable": "No Authors"
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
	 $('#authors tbody').on( 'click', 'tr', function () {
		  data = table.row( this ).data();
		  
		  //console.log(data);
		  
	   //edit_show(table.row( this ).data());
	 } );
}



/* $('#authors tbody').on( 'dblclick', 'tr', function () {
	  console.log( table.row( this ).data() );
   //edit_show(table.row( this ).data());
 } );
 */
/*  $(document).ready(function(){	
	$('#authors tbody').on( 'dblclick', 'tr', function () {
	  
	data=table.row(this).data());
	
	}); 
}); */

function deleteauthor(){
	//console.log(data[4]);
	$.ajax({
	     type: "POST",
	     url: "/GetBooks",
	     datatype: "json",
        success: function(books) {

   			for(var i=0;i<books.length;i++){
   				if(books[i].authorid==data[0]){
					alert("Author has a book in the library");
					return false;
   				}  				
   			}    	
   			if(confirm('Are you sure you want to delete this author?'))
			{
   				$.ajax({
	   			     type: "POST",
	   			     url: "/DeleteAuthor",
	   			     data:{authorid : data[0]},
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
  <h2><center>Authors</center></h2>
  <right><button onclick="window.location.href = 'AddAuthor' ">Add Author</button></right>
  <br></br>
</div>



<table id="authors" class="table table-striped table-bordered" style="width:100%"> 
        
      			 <thead>
           			 <tr>
           			 	 <th>Id</th>
               			 <th>Name</th>
                		 <th>Country</th>
                         <th>Notes</th>
                         <th>Action</th>
            		</tr>
       			 </thead>
	  			
	  			<tbody>
	  			
	  			<c:forEach var ="tempAuthor" items="${authors}">
	  		
	  			<c:url var="updateLink" value="/AuthorDetails">
	  				<c:param name="authorid" value="${tempAuthor.authorid}" />
	  			</c:url>	
	  		
	  			<c:url var="deleteLink" value="/DeleteAuthor">
	  				<c:param name="authorid" value="${tempAuthor.authorid}" />
	  			</c:url>	
	  		
	  				<tr>
	  					<td> ${tempAuthor.authorid} </td>
	  					<td> ${tempAuthor.firstName} ${tempAuthor.lastName} </td>
	  					<td> ${tempAuthor.country} </td>
	  					<td> ${tempAuthor.notes} </td>
	  					<td>
	  						<a href = "${updateLink}">Details</a>  
	  						|
	  						<a href = "${deleteLink}" onclick="return deleteauthor()">Delete</a>
	  					</td>
	  					
	  				</tr>	
					  
	  			</c:forEach>
	  			
	  			</tbody>
        
</table>







</body>
</html> 
