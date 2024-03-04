package user.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;

public class UserDeleteService {

	public boolean deleteUser(String uID) {
		boolean isDelSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int deleteCnt1 = userDAO.deleteUser(uID);
			int deleteCnt2 = userDAO.deleteAllReview(uID);
			int deleteCnt3 = userDAO.deleteAllLibrary(uID);
			
			if(deleteCnt1 > 0 && deleteCnt2 > 0 && deleteCnt3 > 0) {
				commit(con);
				isDelSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isDelSuccess;
	}

}
