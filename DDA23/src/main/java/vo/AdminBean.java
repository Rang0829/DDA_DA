package vo;

import java.sql.Date;

public class AdminBean {
	
	private String aID, aPW, aName, aTel, aEmail;
	private Date aBirth;
	private int aGrade;
	
	public AdminBean() {}

	public String getaID() {
		return aID;
	}

	public void setaID(String aID) {
		this.aID = aID;
	}

	public String getaPW() {
		return aPW;
	}

	public void setaPW(String aPW) {
		this.aPW = aPW;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaTel() {
		return aTel;
	}

	public void setaTel(String aTel) {
		this.aTel = aTel;
	}

	public String getaEmail() {
		return aEmail;
	}

	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}

	public Date getaBirth() {
		return aBirth;
	}

	public void setaBirth(Date aBirth) {
		this.aBirth = aBirth;
	}

	public int getaGrade() {
		return aGrade;
	}

	public void setaGrade(int aGrade) {
		this.aGrade = aGrade;
	}
	
}