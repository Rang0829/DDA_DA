package vo;

import java.sql.Date;

public class BookBean {
	private String bID, author, genre, publisher, company, cAddr, IBSN, outline, contents;
	private int page, price, imgPage;
	private Date pubDate;
	
	public String getbID() {
		return bID;
	}
	
	public void setbID(String bID) {
		this.bID = bID;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getGenre() {
		return genre;
	}
	
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public String getPublisher() {
		return publisher;
	}
	
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	public String getCompany() {
		return company;
	}
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getcAddr() {
		return cAddr;
	}
	
	public void setcAddr(String cAddr) {
		this.cAddr = cAddr;
	}
	
	public String getIBSN() {
		return IBSN;
	}
	
	public void setIBSN(String iBSN) {
		IBSN = iBSN;
	}
	
	public String getOutline() {
		return outline;
	}
	
	public void setOutline(String outline) {
		this.outline = outline;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getImgPage() {
		return imgPage;
	}
	
	public void setImgPage(int imgPage) {
		this.imgPage = imgPage;
	}
	
	public Date getPubDate() {
		return pubDate;
	}
	
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
}
