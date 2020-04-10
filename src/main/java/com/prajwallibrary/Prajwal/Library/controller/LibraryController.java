package com.prajwallibrary.Prajwal.Library.controller;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prajwallibrary.Prajwal.Library.Entity.Author;
import com.prajwallibrary.Prajwal.Library.Entity.Book;
import com.prajwallibrary.Prajwal.Library.Entity.Borrower;
import com.prajwallibrary.Prajwal.Library.Entity.Lent;
import com.prajwallibrary.Prajwal.Library.Entity.Returned;
import com.prajwallibrary.Prajwal.Library.Service.LibraryService;


@Controller
public class LibraryController {

	private LibraryService libraryService;

	@Autowired
	public LibraryController(LibraryService theLibraryService) {
		libraryService = theLibraryService;
	}
	
	 @RequestMapping("/")
	 public String homePage(Model model) {

	 return "HomePage";
	 }
	 
	 
	 @RequestMapping("/Borrowers")
	 public String borrowers(Model model) {
		 
		 List<Borrower> borrowers = libraryService.findAllBorrowers();
		 
		 model.addAttribute("borrowers", borrowers);
		 
		 return "Borrowers";
	 }
	 
	 @RequestMapping("/Authors")
	 public String authors(Model model) {
	
		 List<Author> authors = libraryService.findAllAuthors();
		 
		 model.addAttribute("authors", authors);
		 
		 //System.out.println(authors);
		 
		 return "Authors";
	 }
	 
	 @RequestMapping("/Lent")
	 public String lent(Model model) {
		 
		 List<Lent> lentBooks = libraryService.findAllLent();
		 
		 model.addAttribute("lentBooks", lentBooks);
		 
		 return "LentBooks";
	 }
	 
	 @RequestMapping("/Returned")
	 public String returned(Model model) {
		 
		 List<Returned> returnedBooks = libraryService.findAllReturned();
		 
		 model.addAttribute("returnedBooks", returnedBooks);
		 
		 return "ReturnedBooks";
	 }
	 
	 @RequestMapping("/BookTransactions")
	 public String booktransactions(@RequestParam("bookid") int bookid, Model model) {
		 
		 List<Returned> returnedBooks = libraryService.findReturnedByBookId(bookid);
		 
		 model.addAttribute("returnedBooks", returnedBooks);
		 
		 return "BookTransactions";
	 }
	 
	 @RequestMapping("/BorrowerTransactions")
	 public String borrowertransactions(@RequestParam("borrowerid") int borrowerid, Model model) {
		 
		 List<Returned> returnedBooks = libraryService.findReturnedByBorrowerId(borrowerid);
		 
		 model.addAttribute("returnedBooks", returnedBooks);
		 
		 return "BookTransactions";
	 }
	
	 @RequestMapping("/AddAuthor")
	 public String addAuthor(Model model) {
		 
		 
		 String[] countryCodes = Locale.getISOCountries();
		 
		 List<String> country = new ArrayList<String>();;

		 country.add("Please Select");
		 
		 for (String countryCode : countryCodes) {

		     Locale obj = new Locale("", countryCode);

		     country.add(obj.getDisplayCountry());
		     
		 }

		 
		 Author author = new Author();
		 
		 model.addAttribute("author",author);
		 
		 model.addAttribute("countries",country);
		 
		 return "AddAuthor";
		 
	 }
	 
	 @RequestMapping("/AddBorrower")
	 public String addBorrower(Model model) {
		 
		 Borrower borrower = new Borrower();
		 
		 model.addAttribute("borrower",borrower);
		 
		 return "AddBorrower";
		 
	 }
	 
	 @RequestMapping("/LendABook")
	 public String LendABook(Model model) {
		 
		 Lent lent = new Lent();
		 
		 model.addAttribute("lent",lent);
		 
		 List<Author> authors = libraryService.findAllAuthors();
		 
		 //System.out.println(authors);
		 
		 model.addAttribute("authors", authors);
		 
		 List<Book> books = libraryService.findAllBooks();
		 
		 model.addAttribute("books", books);
		 
		 List<Borrower> borrowers = libraryService.findAllBorrowers();
		 
		 model.addAttribute("borrowers", borrowers);
		 
		 return "LendABook";
		 
	 }
	 
	 @RequestMapping("/AddBook")
	 public String addBook(Model model) {
		 
		 Book book = new Book();
		 
		 model.addAttribute("book",book);
		 
		 List<Author> authors = libraryService.findAllAuthors();
		 
		 model.addAttribute("authors", authors);
		 
		 return "AddBook";
		 
	 }
	 
	 @RequestMapping("/saveAuthor")
		public String saveAuthor(@ModelAttribute("author") Author author) {
			
		 	author.setAuthorFullName(author.getFirstName()+" "+author.getLastName());
		 
			libraryService.saveAuthor(author);
			
			return "redirect:/Authors"; 
		}
	 
	 @RequestMapping("/saveBook")
		public String saveBook(@ModelAttribute("book") Book book) {
			
		 	book.setStatus("Available");
		 
		 	int theId = book.getAuthorid();
		 	
		 	Author theAuthor = libraryService.getAuthor(theId);
		 	
		 	book.setAuthorFullName(theAuthor.getAuthorFullName());
		 	
			libraryService.saveBook(book);
			
			return "redirect:/Books";
			
	 	}
			
	 @RequestMapping("/saveBorrower")
		public String saveBorrower(@ModelAttribute("borrower") Borrower borrower) {
			
		 	borrower.setBorrowerFullName(borrower.getFirstName()+" "+borrower.getLastName());
		 
			libraryService.saveBorrower(borrower);
			
			return "redirect:/Borrowers"; 
		}
	 
	 @RequestMapping("/saveLent")
		public String saveLent(@ModelAttribute("lent") Lent lent) {
			
		 	lent.setTimeoflending(LocalTime.now());
		 	
		 	int bookId = lent.getBookid();
		 	
		 	Book book = libraryService.getBook(bookId);
		 	
		 	lent.setBookName(book.getName());
		 	
		 	lent.setAuthorFullName(book.getAuthorFullName());
		 	
		 	int borrowerId = lent.getBorrowerid();
		 	
		 	Borrower borrower = libraryService.getBorrower(borrowerId);
		 	
		 	lent.setBorrowerFullName(borrower.getBorrowerFullName());
		 	
			libraryService.saveLent(lent);
			
			book.setStatus("Borrowed");
			
			libraryService.saveBook(book);
			
			return "redirect:/Lent"; 
		}
	 
	 @RequestMapping("/ReturnBorrowedBook")
		public String ReturnBorrowedBook(@ModelAttribute("lent") Lent lent) {
		 
		 	//System.out.println(lent.getTimeoflending());
		 
		 	Returned returned = new Returned();
		 	
		 	returned.setAuthorFullName(lent.getAuthorFullName());
		 	
		 	returned.setAuthorid(lent.getAuthorid());
		 	
		 	returned.setBookid(lent.getBookid());
			
		 	returned.setBookName(lent.getBookName());
		 	
		 	returned.setBorrowerFullName(lent.getBorrowerFullName());
		 	
		 	returned.setBorrowerid(lent.getBorrowerid());
		 	
		 	returned.setDateoflending(lent.getDateoflending());
		 	
		 	returned.setDateofreturn(lent.getDateofreturn());
		 	
		 	returned.setLendingCondition(lent.getLendingcondition());
		 	
		 	returned.setReturnedCondition(lent.getReturnedcondition());
		 	
		 	returned.setTimeoflending(lent.getTimeoflending());
		 	
		 	returned.setTimeofreturn(LocalTime.now());
		 	
		 	int bookId = lent.getBookid();
		 	
		 	Book book = libraryService.getBook(bookId);
		 	
		 	book.setStatus("Returned");
		 	
		 	returned.setBookName(book.getName());
		 	
		 	returned.setAuthorFullName(book.getAuthorFullName());
		 	
		 	int borrowerId = lent.getBorrowerid();
		 	
		 	Borrower borrower = libraryService.getBorrower(borrowerId);
		 	
		 	returned.setBorrowerFullName(borrower.getBorrowerFullName());
		 	
		 	libraryService.saveReturn(returned);
		 	
		 	libraryService.deleteLent(lent.getTransactionid());
		 	
			return "redirect:/Returned"; 
		}
	 
	 @RequestMapping("/UnReturnBook")
		public String UnReturnBook(@ModelAttribute("returned") Returned returned) {
		 
		Lent lent = new Lent();
		 
		lent.setAuthorFullName(returned.getAuthorFullName());
		 	
		lent.setAuthorid(returned.getAuthorid());

		lent.setBookid(returned.getBookid());

		lent.setBookName(returned.getBookName());

		lent.setBorrowerFullName(returned.getBorrowerFullName());

		lent.setBorrowerid(returned.getBorrowerid());

		lent.setDateoflending(returned.getDateoflending());

		lent.setLendingcondition(returned.getLendingCondition());

		//lent.setTimeoflending(returned.getTimeoflending());
		
		lent.setTimeoflending(LocalTime.now());

		int bookId = returned.getBookid();

		Book book = libraryService.getBook(bookId);

		book.setStatus("Borrowed");

		lent.setBookName(book.getName());

		lent.setAuthorFullName(book.getAuthorFullName());

		int borrowerId = returned.getBorrowerid();

		Borrower borrower = libraryService.getBorrower(borrowerId);

		lent.setBorrowerFullName(borrower.getBorrowerFullName());
		 	
		libraryService.saveLent(lent);
		
		libraryService.deleteReturned(returned.getReturnid());
		 
		return "redirect:/Lent";
	 }
	 
	 
	 @RequestMapping("/AuthorDetails")
		public String showFormForAuthorUpdate(@RequestParam("authorid") int authorId, Model model) {
			
		 String[] countryCodes = Locale.getISOCountries();
		 
		 List<String> country = new ArrayList<String>();;

		 country.add("Please Select");
		 
		 for (String countryCode : countryCodes) {

		     Locale obj = new Locale("", countryCode);

		     country.add(obj.getDisplayCountry());
		     
		 }
		 
		 	model.addAttribute("countries",country);
		 
			Author author = libraryService.getAuthor(authorId);
			
			model.addAttribute("author",author);
			
			List<Book> books = libraryService.findBooksByAuthor(authorId);
			
			model.addAttribute("books", books);
			
			return "AuthorDetails";
		}
	 
	 @RequestMapping("/ReturnedBookDetails")
		public String ReturnedBookUpdate(@RequestParam("returnid") int returnId, Model model) {
		 
			Returned returned = libraryService.getReturned(returnId);
			
			model.addAttribute("returned",returned);
			
			List<Author> authors = libraryService.findAllAuthors();
			
			// System.out.println(authors);
	
			model.addAttribute("authors", authors);
	
			List<Book> books = libraryService.findAllBooks();
	
			model.addAttribute("books", books);
	
			List<Borrower> borrowers = libraryService.findAllBorrowers();
	
			model.addAttribute("borrowers", borrowers);
			
			return "ReturnedBookDetails";
		}
	
	 @RequestMapping("/BorrowerDetails")
		public String showFormForBorrowerUpdate(@RequestParam("borrowerid") int borrowerId, Model model) {
		 
			Borrower borrower = libraryService.getBorrower(borrowerId);
			
			model.addAttribute("borrower",borrower);
			
			List<Lent> lentBooks = libraryService.findRequiredLent(borrowerId);
			
			//System.out.println(lentBooks);
			
			model.addAttribute("lentbooks", lentBooks);
			
			List<Author> authors = libraryService.findAllAuthors();
			 
			model.addAttribute("authors", authors);
			
			List<Lent> books = libraryService.findRequiredLent(borrowerId);
			
			//System.out.println(lentBooks);
			
			model.addAttribute("books", books);
			
			return "BorrowerDetails";
		}
	 
	 @RequestMapping("/BookDetails")
		public String showFormForBookUpdate(@RequestParam("bookid") int bookId, Model model) {
		 
			Book book = libraryService.getBook(bookId);
			
			model.addAttribute("book",book);
			
			List<Author> authors = libraryService.findAllAuthors();
			 
			model.addAttribute("authors", authors);
			
			return "BookDetails";
		}
	 
	 @RequestMapping("/LentBookDetails")
		public String LentBookDetails(@RequestParam("transactionid") int transactionId, Model model) {
		 
			List<Author> authors = libraryService.findAllAuthors();
	
			// System.out.println(authors);
	
			model.addAttribute("authors", authors);
	
			List<Book> books = libraryService.findAllBooks();
	
			model.addAttribute("books", books);
	
			List<Borrower> borrowers = libraryService.findAllBorrowers();
	
			model.addAttribute("borrowers", borrowers);
		 
			Lent lent = libraryService.getLent(transactionId);
			
			model.addAttribute("lent",lent);
			
			return "LentBookDetails";
		}
	 
	 
	 @RequestMapping("/DeleteAuthor")
		public String deleteAuthor(@RequestParam("authorid") int authorId, Model model) {
			
		 	libraryService.deleteAuthor(authorId);
		 
			return "redirect:/Authors";
		}
	 
	 @RequestMapping("/DeleteBorrower")
		public String deleteBorrower(@RequestParam("borrowerid") int borrowerId, Model model) {
			
		 	libraryService.deleteBorrower(borrowerId);
		 
			return "redirect:/Borrowers";
		}
	 
	 @RequestMapping("/DeleteBook")
		public String deleteBook(@RequestParam("bookid") int bookId, Model model) {
			
		 	Book book = libraryService.getBook(bookId);
		 
		 	if(book.getStatus().equals("Borrowed")) {
		 		return "redirect:/Books";
		 	}
		 	
		 	libraryService.deleteBook(bookId);
		 
			return "redirect:/Books";
		}
	 
	 
	 @RequestMapping("/Books")
	 public String books(Model model) {
	
		 List<Book> books = libraryService.findAllBooks();
		 
		 model.addAttribute("books", books);
		 
		 return "Books";
	 }
	
	 @RequestMapping("/GetBooks")
	 	@ResponseBody
	 public List<Book> jsonBooks(Model model) {
	
		 List<Book> books = libraryService.findAllBooks();
		 
		 return books;
	 }
	 
	 @RequestMapping("/GetRequiredBooks")
	 	@ResponseBody
	 public List<Integer> BooksbyAuthorId(@RequestParam("authorId") int authorId, Model model) {
	
		 List<Integer> bookids = libraryService.findBookByAuthor(authorId);
		 
		 return bookids;
	 }
	 
	 @RequestMapping("/GetLentBooks")
	 	@ResponseBody
	 public List<Lent> LentBooks(Model model) {
	
		 List<Lent> lentBooks = libraryService.findAllLent();
		 
		 return lentBooks;
	 }
	 
	 @RequestMapping("/GetReturnedBooks")
	 	@ResponseBody
	 public List<Returned> ReturnedBooks(Model model) {
	
		 List<Returned> returnedBooks = libraryService.findAllReturned();
		 
		 return returnedBooks;
	 }
	 
	 @RequestMapping("/GetLentBooksByBorrowerId")
	 	@ResponseBody
	 public List<Lent> LentBooksByBorrowerId(@RequestParam("borrowerId") int borrowerId, Model model) {
	
		 List<Lent> lentBooks = libraryService.findRequiredLent(borrowerId);
		 
		 return lentBooks;
	 }
	 
	 @RequestMapping("/GetBooksByAuthor")
	 	@ResponseBody
	 public List<Book> BooksByAuthorId(@RequestParam("authorid") int authorid, Model model) {
	
		 List<Book> books = libraryService.findBooksByAuthor(authorid);
		 
		 return books;
	 }
	 
	 @RequestMapping("/GetBookById")
	 	@ResponseBody
	 public Book BookById(@RequestParam("bookid") int bookid, Model model) {
	
		 Book book = libraryService.getBook(bookid);
		 
		 return book;
	 }
	 
}