package book.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;
import vo.BookBean;

public class BookListService {

	public ArrayList<BookBean> getBookList() {
		ArrayList<BookBean> list = null;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			list = bookDAO.selectBookList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return list;
	}

}
