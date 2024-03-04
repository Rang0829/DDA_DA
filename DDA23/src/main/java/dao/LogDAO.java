package dao;

import java.sql.*;

import vo.AdminBean;

import static db.JdbcUtil.*;



public class LogDAO {
	private Connection con;
	private static LogDAO instance;
	
	private LogDAO() {}

	
	public static LogDAO getInstance() {
		if(instance==null) {
			instance = new LogDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public boolean selectAdmin(String id, String pass) {
		boolean isLoginSuccess = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from admin where aID = ? and aPW = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLoginSuccess = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return isLoginSuccess;
	}


	public AdminBean selectAdminInfo(String id) {
		AdminBean adminBean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from admin where aID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				adminBean = new AdminBean();
				adminBean.setaID(id);
				adminBean.setaPW(rs.getString("aPW"));
				adminBean.setaName(rs.getString("aName"));
				adminBean.setaBirth(Date.valueOf(rs.getString("aBirth")));
				adminBean.setaTel(rs.getString("aTel"));
				adminBean.setaEmail(rs.getString("aEmail"));
				adminBean.setaGrade(rs.getInt("aGrade"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return adminBean;
	}


	public boolean selectUser(String id, String pass) {
		boolean isLoginSuccess = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where uID = ? and uPW = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isLoginSuccess = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return isLoginSuccess;
	}


	public String selectUserPayState(String id) {
		String payState = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from pay where uID = ? order by idx desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				payState = rs.getString("payState");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return payState;
	}


	public Date selectUserExpDate(String id) {
		Date expDate = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from pay where uID = ? order by idx desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				try {
					expDate = Date.valueOf(rs.getString("expDate"));
				} catch (Exception e) {}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return expDate;
	}


	public String selectUserNick(String id) {
		String uNick = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from user where uID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uNick = rs.getString("uNick");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return uNick;
	}

}
