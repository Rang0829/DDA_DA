package admin.svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.AdminDAO;

public class AdminDeleteService {

	public boolean deleteAdmin(String aID) {
		boolean isDeleteSuccess = false;
		
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			int deleteCnt = adminDAO.deleteAdmin(aID);
			
			if(deleteCnt > 0) {
				commit(con);
				isDeleteSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isDeleteSuccess;
	}

}
