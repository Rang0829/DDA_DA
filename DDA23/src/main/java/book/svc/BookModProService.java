package book.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BookDAO;
import vo.BookBean;

public class BookModProService {

	public boolean modBookInfo(BookBean book) {
		boolean isModSuccess = false;
		
		Connection con = null;
		
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			int updateCnt = bookDAO.updateBook(book);
			if(updateCnt > 0) {
				commit(con);
				isModSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isModSuccess;
	}

}
