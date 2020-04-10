package com.prajwallibrary.Prajwal.Library.Entity;

import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lent")
public class Lent {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="transactionid")
	private int transactionid;
	
	@Column(name="bookid")
	private int bookid;
	
	@Column(name="authorid")
	private int authorid;
	
	@Column(name="borrowerid")
	private int borrowerid;
	
	@Column(name="dateoflending")
	private String dateoflending;
	
	@Column(name="timeoflending")
	private LocalTime timeoflending;
	
	@Column(name="lendingcondition")
	private String lendingcondition;
	
	@Column(name="book_name")
	private String bookName;
	
	@Column(name="booktype")
	private String booktype;
	
	@Column(name="author_full_name")
	private String authorFullName;
	
	@Column(name="borrower_full_name")
	private String borrowerFullName;
	
	@Column(name="dateofreturn")
	private String dateofreturn;
	
	@Column(name="returnedcondition")
	private String returnedcondition;
	
	public Lent() {
		
	}

	public Lent(int bookid, int authorid, int borrowerid, String dateoflending, LocalTime timeoflending,
			String lendingcondition, String bookName, String booktype, String authorFullName, String borrowerFullName,
			String dateofreturn, String returnedcondition) {
		this.bookid = bookid;
		this.authorid = authorid;
		this.borrowerid = borrowerid;
		this.dateoflending = dateoflending;
		this.timeoflending = timeoflending;
		this.lendingcondition = lendingcondition;
		this.bookName = bookName;
		this.booktype = booktype;
		this.authorFullName = authorFullName;
		this.borrowerFullName = borrowerFullName;
		this.dateofreturn = dateofreturn;
		this.returnedcondition = returnedcondition;
	}

	public int getTransactionid() {
		return transactionid;
	}

	public void setTransactionid(int transactionid) {
		this.transactionid = transactionid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public int getBorrowerid() {
		return borrowerid;
	}

	public void setBorrowerid(int borrowerid) {
		this.borrowerid = borrowerid;
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

	public String getLendingcondition() {
		return lendingcondition;
	}

	public void setLendingcondition(String lendingcondition) {
		this.lendingcondition = lendingcondition;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBooktype() {
		return booktype;
	}

	public void setBooktype(String booktype) {
		this.booktype = booktype;
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

	public String getDateofreturn() {
		return dateofreturn;
	}

	public void setDateofreturn(String dateofreturn) {
		this.dateofreturn = dateofreturn;
	}

	public String getReturnedcondition() {
		return returnedcondition;
	}

	public void setReturnedcondition(String returnedcondition) {
		this.returnedcondition = returnedcondition;
	}

	@Override
	public String toString() {
		return "Lent [transactionid=" + transactionid + ", bookid=" + bookid + ", authorid=" + authorid
				+ ", borrowerid=" + borrowerid + ", dateoflending=" + dateoflending + ", timeoflending=" + timeoflending
				+ ", lendingcondition=" + lendingcondition + ", bookName=" + bookName + ", booktype=" + booktype
				+ ", authorFullName=" + authorFullName + ", borrowerFullName=" + borrowerFullName + ", dateofreturn="
				+ dateofreturn + ", returnedcondition=" + returnedcondition + "]";
	}

	
	
	
		
}
