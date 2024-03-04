package book.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.BookDAO;

public class BookDetailService {

	public double getBookScore(String bID) {
		double score = 0;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			score = bookDAO.selectReviewScore(bID);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return score;
	}

	public int getBookCount(String bID) {
		int count = 0;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			count = bookDAO.selectReviewCount(bID);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return count;
	}

}
