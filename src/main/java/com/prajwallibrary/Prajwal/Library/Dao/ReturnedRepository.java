package com.prajwallibrary.Prajwal.Library.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.prajwallibrary.Prajwal.Library.Entity.Returned;

public interface ReturnedRepository extends JpaRepository<Returned, Integer> {

	@Query(value = "SELECT * FROM returned WHERE bookid = ?1", nativeQuery = true)
	List<Returned> findReturnedByBookId(int bookid);

	@Query(value = "SELECT * FROM returned WHERE borrowerid = ?1", nativeQuery = true)
	List<Returned> findReturnedByBorrowerId(int borrowerid);
	
}

