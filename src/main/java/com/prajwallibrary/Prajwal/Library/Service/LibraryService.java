package com.prajwallibrary.Prajwal.Library.Service;

import java.util.List;

import com.prajwallibrary.Prajwal.Library.Entity.Author;
import com.prajwallibrary.Prajwal.Library.Entity.Book;
import com.prajwallibrary.Prajwal.Library.Entity.Borrower;
import com.prajwallibrary.Prajwal.Library.Entity.Lent;
import com.prajwallibrary.Prajwal.Library.Entity.Returned;


public interface LibraryService {

	public List<Book> findAllBooks();

	public void saveAuthor(Author author);

	public List<Author> findAllAuthors();

	public Author getAuthor(int updateId);

	public void deleteAuthor(int authorId);

	public List<Borrower> findAllBorrowers();

	public void saveBorrower(Borrower borrower);

	public Borrower getBorrower(int borrowerId);

	public void deleteBorrower(int borrowerId);

	public void saveBook(Book book);

	public void deleteBook(int bookId);

	public Book getBook(int bookId);

	public List<Lent> findAllLent();

	public List<Integer> findBookByAuthor(int authorId);

	public void saveLent(Lent lent);

	public Lent getLent(int transactionId);

	public List<Returned> findAllReturned();

	public void saveReturn(Returned returned);

	public void deleteLent(int transactionid);

	public Returned getReturned(int returnId);

	public void deleteReturned(int returnid);

	public List<Lent> findRequiredLent(int borrowerId);

	public List<Returned> findReturnedByBookId(int bookid);

	public List<Returned> findReturnedByBorrowerId(int borrowerid);

	public List<Book> findBooksByAuthor(int authorId);


	
}
