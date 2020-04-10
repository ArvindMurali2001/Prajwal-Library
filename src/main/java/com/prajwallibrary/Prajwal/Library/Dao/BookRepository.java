package com.prajwallibrary.Prajwal.Library.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.prajwallibrary.Prajwal.Library.Entity.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

	@Query(value = "SELECT bookid FROM books WHERE authorid = ?1", nativeQuery = true)
	List<Integer> findBookByAuthorId(int authorId);

	@Query(value = "SELECT * FROM books WHERE authorid = ?1", nativeQuery = true)
	List<Book> findBooksByAuthor(int authorId);
	
}
