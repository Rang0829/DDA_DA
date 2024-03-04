package user.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.UserDAO;

public class ReviewDelService {

	public boolean deleteReview(String uID, String bID) {
		boolean isDelSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int deleteCnt = userDAO.deleteReview(uID, bID);
			
			if(deleteCnt > 0) {
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
