package book.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BookDAO;

public class ReadBookService {

	public String findBookContents(String bID) {
		String contents = null;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			contents = bookDAO.selectBookContents(bID);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		return contents;
	}

	public boolean insertLib(String uID, String bID) {
		boolean isInsertLib = false;
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			int selCnt = bookDAO.selectKnownBook(uID, bID);
			
			if(selCnt > 0) {
				int updCnt = bookDAO.updateLib(uID, bID);
				
				if(updCnt > 0) {
					commit(con);
					System.out.println("내 서재 업데이트 완료!");
				} else {
					rollback(con);
					System.out.println("내 서재 업데이트 이상 발생!");
				}
				
				isInsertLib = true;
			} else {
				int insCnt = bookDAO.insertLib(uID, bID);
				
				if(insCnt > 0) {
					commit(con);
					System.out.println("내 서재 업데이트 완료!");
				} else {
					rollback(con);
					System.out.println("내 서재 업데이트 이상 발생!");
				}
				
				isInsertLib = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		return isInsertLib;
	}

}
