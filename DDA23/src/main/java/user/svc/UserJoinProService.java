package user.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class UserJoinProService {

	public boolean joinUser(UserBean userBean) {
		boolean isJoinSuccess = false;
		
		Connection con = null;
		try {
			con = getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int insertCnt = userDAO.insertUser(userBean);
			
			if(insertCnt > 0) {
				commit(con);
				isJoinSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isJoinSuccess;
	}

}
