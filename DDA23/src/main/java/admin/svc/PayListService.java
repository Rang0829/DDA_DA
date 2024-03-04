package admin.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.AdminDAO;
import vo.PayBean;

public class PayListService {

	public ArrayList<PayBean> getPayList() {
		ArrayList<PayBean> list = null;
		Connection con = null;
		try {
			con = getConnection();
			AdminDAO adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			list = adminDAO.selectPayList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return list;
	}

}