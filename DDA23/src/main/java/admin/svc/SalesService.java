package admin.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.AdminDAO;

public class SalesService {

	public int[][] countPayList() {
		int[][] list = null;
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			list = adminDAO.selectCountPayList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return list;
	}

}
