package admin.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.PayBean;

public class PayStateCheckService {

	public ArrayList<PayBean> getPayCheck() {
		ArrayList<PayBean> list = null;
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			list = adminDAO.selectPayCheckList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return list;
	}
	
}
