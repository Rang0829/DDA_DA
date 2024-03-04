package log.svc;

import static db.JdbcUtil.*;
import dao.LogDAO;
import vo.AdminBean;

import java.sql.Connection;

public class AdminLoginProService {

	public boolean loginAdmin(String id, String pass) {
		boolean isAdminLoginSuccess = false;

		Connection con = null;
		try {
			con = getConnection();
			LogDAO logDAO = LogDAO.getInstance();
			logDAO.setConnection(con);
			isAdminLoginSuccess = logDAO.selectAdmin(id, pass);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isAdminLoginSuccess;
	}

	public AdminBean getAdminInfo(String id) {
		AdminBean adminBean = null;
		Connection con = null;
		try {
			con = getConnection();
			LogDAO logDAO = LogDAO.getInstance();
			logDAO.setConnection(con);
			adminBean = logDAO.selectAdminInfo(id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		return adminBean;
	}

}
