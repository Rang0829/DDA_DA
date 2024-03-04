package book.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookBean;

public class MyLibraryService {

	public ArrayList<BookBean> getMyLibrary(String uID) {
		ArrayList<BookBean> myLib = null;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			myLib = bookDAO.selectmyLibrary(uID);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return myLib;
	}

}
