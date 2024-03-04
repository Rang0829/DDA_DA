package book.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookBean;

public class BookModFormService {

	public BookBean findBookInfo(String bID) {
		BookBean bookBean = null;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			bookBean = bookDAO.selectBookInfo(bID);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		return bookBean;
	}

}
