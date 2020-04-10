<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lend a Book</title>

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

function addBorrowerId(){
	
	//alert("CHECK");
	
	//console.log(document.getElementById("authorname").value);
	
	document.getElementById("borrowerid").value = Number(document.getElementById("borrowername").value);
	
}

function addBookIdAuthorIdAndAuthorName(){
	
	 //alert("CHECK");
	
	//console.log(document.getElementById("authorname").value);
	var bookid = Number(document.getElementById("bookname").value);
	
	var booksout;
	
	var bookOptions = document.getElementById("bookname").options;
	
	
	document.getElementById("bookid").value = Number(document.getElementById("bookname").value);

	 $.ajax({
	     type: "POST",
	     url: "/GetBooks",
	     datatype: "json",
         success: function(books) {
    	  
        	//booksout = books;
        	
        	//console.log(books);
        	
        	 if(bookid!=0){
        	 for(var i=0;i<books.length;i++){
        		 if(books[i].bookid==bookid){
        			 //console.log(document.getElementById("authorname").value);
        			 //document.getElementById("authorid").value = books[i].authorid;
        			
        			 
        			 document.getElementById("authorname").value = books[i].authorid;
        			 document.getElementById("authorid").value = books[i].authorid;
        			 break;
        			 
        		 }
        	 }
            }
        	 else {
        		 document.getElementById("authorname").value = 0;
        		 for(var i=1;i<bookOptions.length;i++){
        			 document.getElementById("bookname").options[i].disabled=false;
        		 }
        		 
        	 }
       },
       error: function(){
      	 alert("AJAX Failure Of Add");
       }
	      
	  }); 
	
	 
	 
	 var bookid = Number(document.getElementById("bookname").value);
	 
	 //console.log(booksout);
	 
	 if(bookid==0)
		 document.getElementById("status").value=null;
	 else{
		 $.ajax({
		     type: "POST",
		     url: "/GetBooks",
		     datatype: "json",
	         success: function(books) {
	    	  
	        	 for(var i=0;i<books.length;i++)
	        		 if(books[i].bookid==bookid){
	        			 document.getElementById("status").value=books[i].status;
	        			 document.getElementById("booktype").value=books[i].booktype;
	        			 break;
	        		 }	 
	        	 
	       },
	       error: function(){
	      	 alert("AJAX Failure");
	       }
		      
		  }); 
	 }
	  bookid = Number(document.getElementById("bookname").value);
	  if(bookid==0)
			 document.getElementById("status").value=null;
	  
	  document.getElementById("bookid").value = Number(document.getElementById("bookname").value);
	  
}

function addBookIdAuthorIdAndBookNames(){
	
	var authorId = Number(document.getElementById("authorname").value);
	
	document.getElementById("authorid").value = authorId;

	var bookOptions = document.getElementById("bookname").options;
	
	if(authorId!=0)
	{
	$.ajax({
	     type: "POST",
	     url: "/GetRequiredBooks",
	     datatype: "json",
	     data: {authorId : authorId},
        success: function(bookids) {
   	  		
        	//console.log(bookids);
        	//console.log(bookOptions);
        	if(bookids.length!=0){
        	  for(var i=1;i<bookOptions.length;i++){
        		for(var j=0;j<bookids.length;j++){  
        		 if(bookids[j]==bookOptions[i].value){
        			//document.getElementById("bookname").options[i].disabled = false;
        			//	alert("CHECK");
        			 document.getElementById("bookname").options[i].disabled=false;
        			//console.log(bookids[j]);
        			 break;
        			}
        		else
        			document.getElementById("bookname").options[i].disabled = true; 
        		}
        	  }	
        	}
        	else{
        		for(var i=1;i<bookOptions.length;i++){
        			document.getElementById("bookname").options[i].disabled = true; 
        		}
        	}
        	  document.getElementById("bookname").value=document.getElementById("bookname").options[0].value; 
        	  document.getElementById("status").value=null;
      },
      error: function(){
     	 alert("AJAX Failure Of Book Ids");
      }
	      
	  });
	
	
	
	
	//for(var i=0;i<bookOptions.length;i++){
		
		
		
	//}

	}
 
	else
	{
		 document.getElementById("bookname").value = 0;
		 for(var i=1;i<bookOptions.length;i++){
			 document.getElementById("bookname").options[i].disabled=false;
		 }
		 document.getElementById("status").value=null;
	 }
	
	
	
	if(Number(document.getElementById("bookname").value)==0)
		 document.getElementById("status").value=null;
	
	if(authorId==0)
		document.getElementById("status").value=null;
	
	var authorId = Number(document.getElementById("authorname").value);
	
	document.getElementById("authorid").value = authorId;
}

function ebook(){
	//console.log(document.getElementById("booktype").value);
	//return false;
	if(document.getElementById("booktype").value=="Ebook"){
		alert("Ebooks cannot be lent");
		document.getElementById("bookname").value=document.getElementById("bookname").options[0].value; 
  	  	document.getElementById("status").value=null;
  	  	document.getElementById("authorname").value=document.getElementById("authorname").options[0].value;
  	  	return false;
	}
	
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
  <h2><center>Lend A Book</center></h2>
  	<br></br>
</div>

<div class="container">

  <form:form id="addform" action="saveLent" modelAttribute="lent" method="POST">
   
   <form:hidden id="bookid" path="bookid"/>
   
    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="book">Book</label>
      </div>
      </div>
      <div class="col-75">
        <form:select onchange="addBookIdAuthorIdAndAuthorName()" id="bookname" path="bookName"  style="height:35px">
         	<form:option value="0">Select Book</form:option>
         	<c:forEach var="tempBook" items="${books}">
          		<form:option id="bookname" value="${tempBook.bookid}">${tempBook.name}</form:option>
         	</c:forEach>
         </form:select>
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
        <form:select onchange="addBookIdAuthorIdAndBookNames()" id="authorname" path="authorFullName"  style="height:35px">
         	<form:option value="0">Select Author</form:option>
         	<c:forEach var="tempAuthor" items="${authors}">
          		<form:option id="authorname" value="${tempAuthor.authorid}">${tempAuthor.authorFullName}</form:option>
         	</c:forEach>
         </form:select>
      </div>
    </div>

	<form:hidden id="borrowerid" path="borrowerid"/>

  <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="borrower">Borrower</label>
      </div>
      </div>
      <div class="col-75">
        <form:select onchange="addBorrowerId()" id="borrowername" path="borrowerFullName"  style="height:35px">
         	<form:option value="0">Select Borrower</form:option>
         	<c:forEach var="tempBorrower" items="${borrowers}">
          		<form:option id="borrowername" value="${tempBorrower.borrowerid}">${tempBorrower.borrowerFullName}</form:option>
         	</c:forEach>
         </form:select>
      </div>
    </div>
 
       <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="dateoflending">Date Of Lending</label>
      </div>
      </div>
      <div class="col-75">
       	<form:input type="text" path="dateoflending" class="date-picker" readonly="true"/>
      </div>
    </div>

    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="bookcondition">Lending Condition</label>
      </div>
        </div>
           <div class="col-75">
        <form:textarea id="bookcondition" path="lendingcondition" style="height:40px"></form:textarea>
      </div>
    </div>


    <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="fname">Status</label>
      </div>
      </div>
      <div class="col-75">
        <input id="status" type="text" readonly="true"/>
      </div>
    </div>
   
   <form:hidden id="booktype" path="booktype"/>
   
       <!-- <div class="row">
      <div class="col-25">
       <div class="placerelative">
        <label for="lname">Date Of Return</label>
      </div>
      </div>
      <div class="col-75">
        <input type="text" id="calendar" name="calendar">
      </div>
    </div>

      <div class="row">
      <div class="col-25">
        <div class="placerelative">
        <label for="subject">Returned Condition</label>
      </div>
        </div>
           <div class="col-75">
        <textarea id="subject" name="subject" style="height:40px"></textarea>
      </div>
    </div> -->
 
<div class="row">
      <input type="submit" onclick="return ebook()" value="Save">
    </div>



  </form:form>
</div>



</body>
</html> 