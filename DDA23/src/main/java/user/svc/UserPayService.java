package user.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.Date;

import dao.UserDAO;

public class UserPayService {

	public boolean reqPay(String uID, int subType, Date reqDate, String payWay, Date expDate) {
		boolean isReqSuccess = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int insertCnt = userDAO.insertReqPay(uID, subType, reqDate, payWay, expDate);
			
			if(insertCnt > 0) {
				commit(con);
				isReqSuccess = true;
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isReqSuccess;
	}

}
