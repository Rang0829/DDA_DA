package admin.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.AdminDAO;
import vo.UserBean;

public class UserInfoService {

	public UserBean getUserInfo(String id) {
		UserBean user = null;
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			user = adminDAO.selectUserInfo(id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		return user;
	}

}
