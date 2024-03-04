package admin.svc;

import static db.JdbcUtil.*;


import java.sql.Connection;

import dao.AdminDAO;
import vo.AdminBean;

public class AdminJoinProService {

	public boolean joinAdmin(AdminBean adminBean) {
		boolean isJoinSuccess = false;
		
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			int insertCnt = adminDAO.insertAdmin(adminBean);
			
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
