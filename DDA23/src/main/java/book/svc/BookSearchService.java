package book.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BookDAO;

import static db.JdbcUtil.*;
import vo.BookBean;

public class BookSearchService {

	public ArrayList<BookBean> findBookList(String query) {
		ArrayList<BookBean> list = null;
		Connection con = null;
		
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			list = bookDAO.selectSearchBookList(query);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return list;
	}

}
