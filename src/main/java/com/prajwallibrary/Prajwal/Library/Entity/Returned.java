package com.prajwallibrary.Prajwal.Library.Entity;

import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="returned")
public class Returned {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="returnid")
	private int returnid;
	
	@Column(name="bookid")
	private int bookid;
	
	@Column(name="borrowerid")
	private int borrowerid;
	
	@Column(name="authorid")
	private int authorid;
	
	@Column(name="dateoflending")
	private String dateoflending;
	
	@Column(name="timeoflending")
	private LocalTime timeoflending;
	
	@Column(name="lendingcondition")
	private String lendingCondition;
	
	@Column(name="dateofreturn")
	private String dateofreturn;
	
	@Column(name="timeofreturn")
	private LocalTime timeofreturn;
	
	@Column(name="returnedcondition")
	private String returnedCondition;
	
	@Column(name="book_name")
	private String bookName;
	
	@Column(name="author_full_name")
	private String authorFullName;
	
	@Column(name="borrower_full_name")
	private String borrowerFullName;
	
	public Returned() {
		
	}

	public Returned(int bookid, int borrowerid, int authorid, String dateoflending,
			LocalTime timeoflending, String lendingCondition, String dateofreturn, LocalTime timeofreturn,
			String returnedCondition, String bookName, String authorFullName, String borrowerFullName) {
		this.bookid = bookid;
		this.borrowerid = borrowerid;
		this.authorid = authorid;
		this.dateoflending = dateoflending;
		this.timeoflending = timeoflending;
		this.lendingCondition = lendingCondition;
		this.dateofreturn = dateofreturn;
		this.timeofreturn = timeofreturn;
		this.returnedCondition = returnedCondition;
		this.bookName = bookName;
		this.authorFullName = authorFullName;
		this.borrowerFullName = borrowerFullName;
	}

	public int getReturnid() {
		return returnid;
	}

	public void setReturnid(int returnid) {
		this.returnid = returnid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getBorrowerid() {
		return borrowerid;
	}

	public void setBorrowerid(int borrowerid) {
		this.borrowerid = borrowerid;
	}

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public String getDateoflending() {
		return dateoflending;
	}

	public void setDateoflending(String dateoflending) {
		this.dateoflending = dateoflending;
	}

	public LocalTime getTimeoflending() {
		return timeoflending;
	}

	public void setTimeoflending(LocalTime timeoflending) {
		this.timeoflending = timeoflending;
	}

	public String getLendingCondition() {
		return lendingCondition;
	}

	public void setLendingCondition(String lendingCondition) {
		this.lendingCondition = lendingCondition;
	}

	public String getDateofreturn() {
		return dateofreturn;
	}

	public void setDateofreturn(String dateofreturn) {
		this.dateofreturn = dateofreturn;
	}

	public LocalTime getTimeofreturn() {
		return timeofreturn;
	}

	public void setTimeofreturn(LocalTime timeofreturn) {
		this.timeofreturn = timeofreturn;
	}

	public String getReturnedCondition() {
		return returnedCondition;
	}

	public void setReturnedCondition(String returnedCondition) {
		this.returnedCondition = returnedCondition;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthorFullName() {
		return authorFullName;
	}

	public void setAuthorFullName(String authorFullName) {
		this.authorFullName = authorFullName;
	}

	public String getBorrowerFullName() {
		return borrowerFullName;
	}

	public void setBorrowerFullName(String borrowerFullName) {
		this.borrowerFullName = borrowerFullName;
	}

	@Override
	public String toString() {
		return "Returned [returnid=" + returnid + ", bookid=" + bookid + ", borrowerid=" + borrowerid + ", authorid="
				+ authorid + ", dateoflending=" + dateoflending + ", timeoflending=" + timeoflending
				+ ", lendingCondition=" + lendingCondition + ", dateofreturn=" + dateofreturn + ", timeofreturn="
				+ timeofreturn + ", returnedCondition=" + returnedCondition + ", bookName=" + bookName
				+ ", authorFullName=" + authorFullName + ", borrowerFullName=" + borrowerFullName + "]";
	}


	
	
}
