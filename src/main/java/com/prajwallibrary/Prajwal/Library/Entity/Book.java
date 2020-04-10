package com.prajwallibrary.Prajwal.Library.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="books")
public class Book {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bookid")
	private int bookid;
	
	@Column(name="name")
	private String name;
	
	@Column(name="price")
	private int price;
	
	@Column(name="dateofpurchase")
	private String date;
	
	@Column(name="boughtfrom")
	private String boughtfrom;
	
	@Column(name="status")
	private String status;
	
	@Column(name="booktype")
	private String booktype;
	
	@Column(name="notes")
	private String notes;
	
	@Column(name="authorid")
	private int authorid;
	
	@Column(name="author_full_name")
	private String authorFullName;
	
	public Book() {
		
	}

	public Book(String name, int price, String date, String boughtfrom, String status, String booktype, String notes,
			int authorid, String authorFullName) {
		this.name = name;
		this.price = price;
		this.date = date;
		this.boughtfrom = boughtfrom;
		this.status = status;
		this.booktype = booktype;
		this.notes = notes;
		this.authorid = authorid;
		this.authorFullName = authorFullName;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getBoughtfrom() {
		return boughtfrom;
	}

	public void setBoughtfrom(String boughtfrom) {
		this.boughtfrom = boughtfrom;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBooktype() {
		return booktype;
	}

	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public String getAuthorFullName() {
		return authorFullName;
	}

	public void setAuthorFullName(String authorFullName) {
		this.authorFullName = authorFullName;
	}

	@Override
	public String toString() {
		return " [bookid=" + bookid + ", name=" + name + ", price=" + price + ", date=" + date + ", boughtfrom="
				+ boughtfrom + ", status=" + status + ", booktype=" + booktype + ", notes=" + notes + ", authorid="
				+ authorid + ", authorFullName=" + authorFullName + "]";
	}

	

	
	
	
}
