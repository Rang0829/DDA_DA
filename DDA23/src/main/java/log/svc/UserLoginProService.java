package log.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.Date;

import dao.LogDAO;

public class UserLoginProService {

	public boolean loginUser(String id, String pass) {
		boolean isUserLoginSuccess = false;

		Connection con = null;
		try {
			con = getConnection();
			LogDAO logDAO = LogDAO.getInstance();
			logDAO.setConnection(con);
			isUserLoginSuccess = logDAO.selectUser(id, pass);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isUserLoginSuccess;
	}

	public String getUserPayState(String id) {
		String payState = null;

		Connection con = null;
		try {
			con = getConnection();
			LogDAO logDAO = LogDAO.getInstance();
			logDAO.setConnection(con);
			payState = logDAO.selectUserPayState(id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return payState;
	}

	public Date getUserExpDate(String id) {
		Date expDate = null;
		
		Connection con = null;
		try {
			con = getConnection();
			LogDAO logDAO = LogDAO.getInstance();
			logDAO.setConnection(con);
			expDate = logDAO.selectUserExpDate(id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return expDate;
	}

	public String getUserNick(String id) {
		String uNick = null;

		Connection con = null;
		try {
			con = getConnection();
			LogDAO logDAO = LogDAO.getInstance();
			logDAO.setConnection(con);
			uNick = logDAO.selectUserNick(id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return uNick;
	}

}
