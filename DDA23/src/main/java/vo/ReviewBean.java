package vo;

import java.sql.Date;

public class ReviewBean {
	private String uID, bID, review;
	private int score;
	private Date wDate;
	
	public Date getwDate() {
		return wDate;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}
	public String getuID() {
		return uID;
	}
	public void setuID(String uID) {
		this.uID = uID;
	}
	public String getbID() {
		return bID;
	}
	public void setbID(String bID) {
		this.bID = bID;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
