<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lent Books</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css'>
<link rel='stylesheet' href='https://cdn.datatables.net/select/1.3.1/css/select.bootstrap4.min.css'> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js'></script>
<script type='text/javascript' src='https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js'></script>

<link rel="stylesheet" type="text/css" href="/css/styles.css">

<link rel="stylesheet" type="text/css" href="/css/AllPages.css">

<script>
var data;

var table;
$(document).ready(function() {
    table = $('#lentbooks').DataTable({
    	"language": {
	        "emptyTable":     "No Books Lent"
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
  <h2><center>Lent Books</center></h2>
  <right><button onclick="window.location.href = 'LendABook' ">Lend A Book</button></right>
  <br></br>
</div>



<table id="lentbooks" class="table table-striped table-bordered" style="width:100%"> 
        
      			 <thead>
           			 <tr>
           			 	 <th>Id</th>
               			 <th>Book</th>
                		 <th>Author</th>
                         <th>Borrower</th>	
                         <th>Date And Time Of Lending</th>
                         <th>Action</th>
            		</tr>
       			 </thead>
	  			
	  			<tbody>
	  			
	  			<c:forEach var ="tempLentBooks" items="${lentBooks}">
	  		
	  			<c:url var="updateLink" value="/LentBookDetails">
	  				<c:param name="transactionid" value="${tempLentBooks.transactionid}" />
	  			</c:url>	
	  		
	  				<tr>
	  					<td> ${tempLentBooks.transactionid} </td>
	  					<td> ${tempLentBooks.bookName}</td>
	  					<td> ${tempLentBooks.authorFullName}</td>
	  					<td> ${tempLentBooks.borrowerFullName} </td>
	  					<td> ${tempLentBooks.dateoflending} ${tempLentBooks.timeoflending}</td>
	  					<td>
	  						<a href = "${updateLink}">Details</a>  
	  					</td>
	  					
	  				</tr>	
					  
	  			</c:forEach>
	  			
	  			</tbody>
        
</table>


</body>
</html> 