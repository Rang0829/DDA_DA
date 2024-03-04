package dao;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import vo.*;

import static db.JdbcUtil.*;



public class AdminDAO {
	private Connection con;
	private static AdminDAO instance;
	
	private AdminDAO() {}

	
	public static AdminDAO getInstance() {
		if(instance==null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<AdminBean> selectAdminList() {
		ArrayList<AdminBean> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from admin order by aGrade";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<AdminBean>();
				do {
					AdminBean admin = new AdminBean();
					admin.setaID(rs.getString("aID"));
					admin.setaPW(rs.getString("aPW"));
					admin.setaGrade(rs.getInt("aGrade"));
					admin.setaName(rs.getString("aName"));
					admin.setaTel(rs.getString("aTel"));
					admin.setaBirth(rs.getDate("aBirth"));
					admin.setaEmail(rs.getString("aEmail"));
					list.add(admin);
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectAdminList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	public ArrayList<PayBean> selectPayList() {
		ArrayList<PayBean> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from pay order by idx desc";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<PayBean>();
				do {
					PayBean pay = new PayBean();
					pay.setIdx(rs.getInt("idx"));
					pay.setuID(rs.getString("uID"));
					pay.setSubType(rs.getInt("subType"));
					pay.setReqDate(rs.getDate("reqDate"));
					pay.setPerDate(rs.getDate("perDate"));
					pay.setPayWay(rs.getString("payWay"));
					pay.setPayState(rs.getString("payState"));
					pay.setExpDate(rs.getDate("expDate"));
					list.add(pay);
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectPayList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<UserBean> selectUserList() {
		ArrayList<UserBean> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from user";
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<UserBean>();
				do {
					UserBean user = new UserBean();
					user.setuID(rs.getString("uID"));
					user.setuPW(rs.getString("uPW"));
					user.setuName(rs.getString("uName"));
					user.setuNick(rs.getString("uNick"));
					user.setuEmail(rs.getString("uEmail"));
					list.add(user);
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectUserList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int insertAdmin(AdminBean adminBean) {
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into admin values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, adminBean.getaID());
			pstmt.setString(2, adminBean.getaPW());
			pstmt.setString(3, adminBean.getaName());
			pstmt.setDate(4, adminBean.getaBirth());
			pstmt.setString(5, adminBean.getaTel());
			pstmt.setString(6, adminBean.getaEmail());
			pstmt.setInt(7, adminBean.getaGrade());
			
			insertCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertAdmin 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return insertCnt;
	}


	public ArrayList<PayBean> selectPayCheckList() {
		ArrayList<PayBean> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from pay where perDate is null";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<PayBean>();
				do {
					PayBean pay = new PayBean();
					pay.setIdx(rs.getInt("idx"));
					pay.setuID(rs.getString("uID"));
					pay.setSubType(rs.getInt("subType"));
					pay.setReqDate(rs.getDate("reqDate"));
					pay.setPerDate(rs.getDate("perDate"));
					pay.setPayWay(rs.getString("payWay"));
					pay.setPayState(rs.getString("payState"));
					list.add(pay);
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectPayCheckList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int updatePayPermission(String id, String subType, Date expDate) {
		int updateCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "update pay set perDate = curdate(), payState = 'On', expDate = date_add(?, interval ";
		
		if(Integer.parseInt(subType) == 1) {
			sql += "30 day)";
		} else if(Integer.parseInt(subType) == 2) {
			sql += "90 day)";
		} else {
			sql += "180 day)";
		}
		sql += " where uID = ?";
		
		Date exDate = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			if(expDate == null) {
				exDate = Date.valueOf(LocalDate.now());
			} else {
				exDate = expDate;
			}
			pstmt.setDate(1, exDate);
			pstmt.setString(2, id);
			
			updateCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePayPermission 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return updateCnt;
	}


	public UserBean selectUserInfo(String id) {
		UserBean user = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from user where uID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserBean();
				user.setuID(id);
				user.setuPW(rs.getString("uPW"));
				user.setuName(rs.getString("uName"));
				user.setuNick(rs.getString("uNick"));
				user.setuEmail(rs.getString("uEmail"));
			}
			
		}catch(Exception e){
			System.out.println("selectUserInfo 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return user;
	}


	public Date selectExpDate(String id) {
		Date expDate = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select expDate from pay where uID = ? order by idx desc";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				expDate = rs.getDate("expDate");
			}
			
		}catch(Exception e){
			System.out.println("selectExpDate 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return expDate;
	}


	public int deleteAdmin(String aID) {
		int delCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from admin where aID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aID);
			delCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteAdmin 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return delCnt;
	}


	public int[][] selectCountPayList() {
		int[][] list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select subType, count(subType) from pay group by subType order by subType";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new int[3][2];
				int x = 0;
				do {
					list[x][0] = rs.getInt("subType");
					list[x][1] = rs.getInt("count(subType)");
					x++;
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectCountPayList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}


	public int updatePayState(String uID) {
		int updateCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "update pay set payState = 'Off' where uID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			updateCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updatePayState 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return updateCnt;
	}

}
