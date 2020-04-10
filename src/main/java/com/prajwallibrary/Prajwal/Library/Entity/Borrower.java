package com.prajwallibrary.Prajwal.Library.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="borrowers")
public class Borrower {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="borrowerid")
	private int borrowerid;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="mobilenumber")
	private String mobileNumber;
	
	@Column(name="email")
	private String email;
	
	@Column(name="borrower_full_name")
	private String borrowerFullName;
	
	public Borrower() {
		
	}

	public Borrower(String firstName, String lastName, String mobileNumber, String email, String borrowerFullName) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNumber = mobileNumber;
		this.email = email;
		this.borrowerFullName = borrowerFullName;
	}

	public int getBorrowerid() {
		return borrowerid;
	}

	public void setBorrowerid(int borrowerid) {
		this.borrowerid = borrowerid;
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

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBorrowerFullName() {
		return borrowerFullName;
	}

	public void setBorrowerFullName(String borrowerFullName) {
		this.borrowerFullName = borrowerFullName;
	}

	@Override
	public String toString() {
		return "Borrower [borrowerid=" + borrowerid + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", mobileNumber=" + mobileNumber + ", email=" + email + ", borrowerFullName=" + borrowerFullName
				+ "]";
	}

	
	
	
	
}
