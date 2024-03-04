package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import vo.*;

import static db.JdbcUtil.*;



public class UserDAO {
	private Connection con;
	private static UserDAO instance;
	
	private UserDAO() {}

	
	public static UserDAO getInstance() {
		if(instance==null) {
			instance = new UserDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int insertUser(UserBean userBean) {
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into user values(?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userBean.getuID());
			pstmt.setString(2, userBean.getuPW());
			pstmt.setString(3, userBean.getuName());
			pstmt.setString(4, userBean.getuNick());
			pstmt.setString(5, userBean.getuEmail());
			
			insertCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertUser 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return insertCnt;
	}

	public int insertReqPay(String uID, int subType, Date reqDate, String payWay, Date expDate) {
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into pay values(default, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
			if(payWay.equals("즉시결제")) {
				Date exDate = null;
				
				if(expDate == null || expDate.before(Date.valueOf(LocalDate.now()))) {
					exDate = Date.valueOf(LocalDate.now());
				} else {
					exDate = expDate;
				}
				
				sql = sql.substring(0, sql.length() - 2);
				sql += "date_add(?, interval ";
				
				if(subType == 1) {
					sql += "30 day))";
				} else if(subType == 2) {
					sql += "90 day))";
				} else {
					sql += "180 day))";
				}
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setDate(4, Date.valueOf(LocalDate.now()));
				pstmt.setString(6, "On");
				pstmt.setDate(7, exDate);
				
			} else {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(4, null);
				
				if(expDate == null) {
					pstmt.setString(6, "Off");
					pstmt.setString(7, null);
				} else {
					pstmt.setString(6, "On");
					pstmt.setDate(7, expDate);
				}
			}
			
			pstmt.setString(1, uID);
			pstmt.setInt(2, subType);
			pstmt.setDate(3, reqDate);
			pstmt.setString(5, payWay);
			
			insertCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertReqPay 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return insertCnt;
	}


	public int updateInfo(String uID, String uPW, String uEmail) {
		int updateCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "update user set uPW = ?, uEmail = ? where uID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uPW);
			pstmt.setString(2, uEmail);
			pstmt.setString(3, uID);
			
			updateCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateInfo 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return updateCnt;
	}


	public int deleteUser(String uID) {
		int delCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from user where uID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			delCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteUser 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return delCnt;
	}


	public ArrayList<ReviewBean> selectReviewList() {
		ArrayList<ReviewBean> reviewList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from review order by wDate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewList = new ArrayList<ReviewBean>();
				do {
					ReviewBean review = new ReviewBean();
					review.setuID(rs.getString("uID"));
					review.setbID(rs.getString("bID"));
					review.setReview(rs.getString("review"));
					review.setScore(rs.getInt("score"));
					
					reviewList.add(review);
				} while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("selectReviewList 에러 : " + e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return reviewList;
	}


	public ArrayList<String[]> selectAttachList() {
		ArrayList<String[]> list = new ArrayList<String[]>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select b.author, u.uNick, r.uID, r.bID, r.wDate from book b join review r on b.bID = r.bID "
				+ "join user u on r.uID = u.uID order by wDate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				do {
					String[] attach = new String[5];
					attach[0] = rs.getString("author");
					attach[1] = rs.getString("uNick");
					attach[2] = rs.getString("uID");
					attach[3] = rs.getString("bID");
					attach[4] = rs.getString("wDate");
					list.add(attach);
				} while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("selectAttachList 에러 : " + e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}


	public int deleteReview(String uID, String bID) {
		int delCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from review where uID = ? and bID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			pstmt.setString(2, bID);
			
			delCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteReview 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return delCnt;
	}


	public int insertReview(ReviewBean review) {
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into review values(?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, review.getuID());
			pstmt.setString(2, review.getbID());
			pstmt.setInt(4, review.getScore());
			pstmt.setString(3, review.getReview());
			pstmt.setDate(5, review.getwDate());
			
			insertCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertReview 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return insertCnt;
	}


	public int deleteAllReview(String uID) {
		int delCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from review where uID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			
			delCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteAllReview 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return delCnt;
	}


	public int deleteAllLibrary(String uID) {
		int delCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from lib where uID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			
			delCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteAllLibrary 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return delCnt;
	}

}
