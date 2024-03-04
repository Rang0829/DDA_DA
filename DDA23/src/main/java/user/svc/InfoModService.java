package user.svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.UserDAO;

public class InfoModService {

	public boolean modInfo(String uID, String uPW, String uEmail) {
		boolean isModSuccess = false;
		Connection con = null;
		
		try {
			con = getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int updateCnt = userDAO.updateInfo(uID, uPW, uEmail);
			
			if(updateCnt > 0) {
				commit(con);
				isModSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isModSuccess;
	}

}
