package user.svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.UserDAO;

import static db.JdbcUtil.*;

import vo.ReviewBean;

public class ReviewFormService {

	public ArrayList<ReviewBean> getReviewList() {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<ReviewBean> reviewList = userDAO.selectReviewList();
		close(con);
		
		return reviewList;
	}

	public ArrayList<String[]> getAttachList() {
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		ArrayList<String[]> attachList = userDAO.selectAttachList();
		close(con);
		return attachList;
	}

}
