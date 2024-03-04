package user.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookBean;

import static db.JdbcUtil.*;

public class ReviewRegFormService {

	public ArrayList<BookBean> findMyLibrary(String uID) {
		ArrayList<BookBean> myLib = null;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			myLib = bookDAO.selectmyLibrary(uID);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return myLib;
	}
	
}
