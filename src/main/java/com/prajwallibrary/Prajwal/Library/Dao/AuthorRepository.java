package com.prajwallibrary.Prajwal.Library.Dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prajwallibrary.Prajwal.Library.Entity.Author;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

}
