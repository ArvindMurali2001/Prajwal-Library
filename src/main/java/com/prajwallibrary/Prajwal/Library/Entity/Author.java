package com.prajwallibrary.Prajwal.Library.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="author")
public class Author {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="authorid")
	private int authorid;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="country")
	private String country;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="author_full_name")
	private String authorFullName;
	
	public Author() {
		
	}

	public Author(String firstName, String lastName, String country, String notes, String authorFullName) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.country = country;
		this.notes = notes;
		this.authorFullName = authorFullName;
	}

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public String getAuthorFullName() {
		return authorFullName;
	}

	public void setAuthorFullName(String authorFullName) {
		this.authorFullName = authorFullName;
	}

	@Override
	public String toString() {
		return "Author [authorid=" + authorid + ", firstName=" + firstName + ", lastName=" + lastName + ", country="
				+ country + ", notes=" + notes + ", authorFullName=" + authorFullName + "]";
	}

	
	
	
	
}
