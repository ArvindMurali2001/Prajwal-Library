package com.prajwallibrary.Prajwal.Library.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prajwallibrary.Prajwal.Library.Dao.AuthorRepository;
import com.prajwallibrary.Prajwal.Library.Dao.BookRepository;
import com.prajwallibrary.Prajwal.Library.Dao.BorrowerRepository;
import com.prajwallibrary.Prajwal.Library.Dao.LentRepository;
import com.prajwallibrary.Prajwal.Library.Dao.ReturnedRepository;
import com.prajwallibrary.Prajwal.Library.Entity.Author;
import com.prajwallibrary.Prajwal.Library.Entity.Book;
import com.prajwallibrary.Prajwal.Library.Entity.Borrower;
import com.prajwallibrary.Prajwal.Library.Entity.Lent;
import com.prajwallibrary.Prajwal.Library.Entity.Returned;

@Service
public class LibraryServiceImpl implements LibraryService {

	@Autowired
	public LibraryServiceImpl(AuthorRepository theAuthorRepository, BookRepository theBookRepository, BorrowerRepository theBorrowerRepository, LentRepository theLentRepository, ReturnedRepository theReturnedRepository) {
		authorRepository = theAuthorRepository;
		bookRepository = theBookRepository;
		borrowerRepository = theBorrowerRepository;
		lentRepository = theLentRepository;
		returnedRepository = theReturnedRepository;
	}


	private AuthorRepository authorRepository;
	
	private BookRepository bookRepository;
	
	private BorrowerRepository borrowerRepository;
	
	private LentRepository lentRepository;
	
	private ReturnedRepository returnedRepository;

	
	@Override
	public List<Book> findAllBooks() {
		
		return bookRepository.findAll();
		
	}


	@Override
	public void saveAuthor(Author author) {
		
		authorRepository.save(author);
		
	}


	@Override
	public List<Author> findAllAuthors() {

		return authorRepository.findAll();
		
	}


	@Override
	public Author getAuthor(int updateId) {
		
		Optional<Author> result = authorRepository.findById(updateId);
		
		Author author = null;
		if(result.isPresent())
			author= result.get();
		
		else
			throw new RuntimeException("Did not find author id - " + updateId);
		
		return author;
	}


	@Override
	public void deleteAuthor(int authorId) {
		
		authorRepository.deleteById(authorId);
		
	}


	@Override
	public List<Borrower> findAllBorrowers() {
		
		return borrowerRepository.findAll();
	}


	@Override
	public void saveBorrower(Borrower borrower) {
		
		borrowerRepository.save(borrower);
		
	}


	@Override
	public Borrower getBorrower(int borrowerId) {
		
		Optional<Borrower> result = borrowerRepository.findById(borrowerId);
		
		Borrower borrower = null;
		if(result.isPresent())
			borrower= result.get();
		
		else
			throw new RuntimeException("Did not find borrower id - " + borrowerId);
		
		return borrower;	
		
	}


	@Override
	public void deleteBorrower(int borrowerId) {
		
		borrowerRepository.deleteById(borrowerId);
		
	}


	@Override
	public void saveBook(Book book) {
		
		bookRepository.save(book);
		
	}


	@Override
	public void deleteBook(int bookId) {
		
		bookRepository.deleteById(bookId);
		
	}


	@Override
	public Book getBook(int bookId) {
		
		Optional<Book> result = bookRepository.findById(bookId);
		
		Book book = null;
		if(result.isPresent())
			book= result.get();
		
		else
			throw new RuntimeException("Did not find book id - " + bookId);
		
		return book;
	}


	@Override
	public List<Lent> findAllLent() {
		
		return lentRepository.findAll();
	}


	@Override
	public List<Integer> findBookByAuthor(int authorId) {
		
		return bookRepository.findBookByAuthorId(authorId);
	}


	@Override
	public void saveLent(Lent lent) {

		lentRepository.save(lent);
		
	}


	@Override
	public Lent getLent(int transactionId) {
		
		Optional<Lent> result = lentRepository.findById(transactionId);
		
		Lent lent = null;
		if(result.isPresent())
			lent= result.get();
		
		else
			throw new RuntimeException("Did not find lent id - " + transactionId);
		
		return lent;
	}


	@Override
	public List<Returned> findAllReturned() {
		
		return returnedRepository.findAll();
		
	}


	@Override
	public void saveReturn(Returned returned) {
		
		returnedRepository.save(returned);
		
	}


	@Override
	public void deleteLent(int transactionid) {
		
		lentRepository.deleteById(transactionid);
		
	}


	@Override
	public Returned getReturned(int returnId) {
		
		Optional<Returned> result = returnedRepository.findById(returnId);
		
		Returned returned = null;
		if(result.isPresent())
			returned = result.get();
		
		else
			throw new RuntimeException("Did not find return id - " + returnId);
		
		return returned;
		
	}


	@Override
	public void deleteReturned(int returnid) {
		
		returnedRepository.deleteById(returnid);
		
	}


	@Override
	public List<Lent> findRequiredLent(int borrowerId) {
		
		return(lentRepository.findRequiredLent(borrowerId));
	}


	@Override
	public List<Returned> findReturnedByBookId(int bookid) {
		
		return (returnedRepository.findReturnedByBookId(bookid));
	}


	@Override
	public List<Returned> findReturnedByBorrowerId(int borrowerid) {
		
		return (returnedRepository.findReturnedByBorrowerId(borrowerid));
	}


	@Override
	public List<Book> findBooksByAuthor(int authorId) {
		
		return (bookRepository.findBooksByAuthor(authorId));
		
	}

}
