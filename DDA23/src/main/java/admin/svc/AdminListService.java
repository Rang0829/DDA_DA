package admin.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.AdminBean;

public class AdminListService {

	public ArrayList<AdminBean> getAdminList() {
		ArrayList<AdminBean> list = null;
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			list = adminDAO.selectAdminList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return list;
	}

}
