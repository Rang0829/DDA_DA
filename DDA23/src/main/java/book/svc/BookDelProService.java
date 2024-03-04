package book.svc;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;

import dao.BookDAO;

import static db.JdbcUtil.*;

public class BookDelProService {

	public boolean deleteBookInfo(HttpServletRequest request, String bID) {
		boolean isDeleteSuccess = false;
		
		Connection con = null;
		try {
			con = getConnection();
			BookDAO bookDAO = BookDAO.getInstance();
			bookDAO.setConnection(con);
			int deleteCnt = bookDAO.deleteBookInfo(bID);
			
			if(deleteCnt > 0) {
				commit(con);
				
				String path = request.getServletContext().getRealPath("images/" + bID);
				File folder = new File(path);
				
				try {
				    while(folder.exists()) {
					File[] folderList = folder.listFiles();
							
						for (int i = 0; i < folderList.length; i++) {
							folderList[i].delete(); 
							System.out.println("파일이 삭제되었습니다.");
									
						}
								
						if(folderList.length == 0 && folder.isDirectory()){ 
							folder.delete();
							System.out.println("폴더가 삭제되었습니다.");
						}
			        }
				} catch (Exception e) {
					e.getStackTrace();
				}
				
				isDeleteSuccess = true;
			} else {
				rollback(con);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isDeleteSuccess;
	}

}
