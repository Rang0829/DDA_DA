package user.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.UserDAO;
import vo.ReviewBean;

public class ReviewRegService {

	public boolean regReview(ReviewBean review) {
		boolean isInsertSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int insertCnt = userDAO.insertReview(review);
			
			if(insertCnt > 0) {
				commit(con);
				isInsertSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isInsertSuccess;
	}

}
