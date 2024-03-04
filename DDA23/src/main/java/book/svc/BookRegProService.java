package book.svc;

import java.sql.Connection;

import dao.BookDAO;

import static db.JdbcUtil.*;
import vo.BookBean;

public class BookRegProService {

	public boolean uploadBookInfo(BookBean book) {
		boolean isRegSuccess = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			int insertCnt = bookDAO.insertBook(book);
			if(insertCnt > 0) {
				commit(con);
				isRegSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isRegSuccess;
	}

}
