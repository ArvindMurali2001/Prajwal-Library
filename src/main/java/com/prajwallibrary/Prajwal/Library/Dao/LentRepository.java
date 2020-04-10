package com.prajwallibrary.Prajwal.Library.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.prajwallibrary.Prajwal.Library.Entity.Lent;

public interface LentRepository extends JpaRepository<Lent, Integer> {

	@Query(value = "SELECT * FROM lent WHERE borrowerid = ?1", nativeQuery = true)
	List<Lent> findRequiredLent(int borrowerId);

}