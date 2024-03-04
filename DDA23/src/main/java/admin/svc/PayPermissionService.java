package admin.svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.Date;

import dao.AdminDAO;

public class PayPermissionService {

	public boolean getPerDateState(String id, String subType) {
		boolean isUpdateSuccess = false;
		
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			Date expDate = adminDAO.selectExpDate(id);
			int updateCnt = adminDAO.updatePayPermission(id, subType, expDate);
			
			if(updateCnt > 0) {
				commit(con);
				isUpdateSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isUpdateSuccess;
	}

	public boolean changePayState(String uID) {
		boolean isUpdateSuccess = false;
		
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			int updateCnt = adminDAO.updatePayState(uID);
			
			if(updateCnt > 0) {
				commit(con);
				isUpdateSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isUpdateSuccess;
	}

}
