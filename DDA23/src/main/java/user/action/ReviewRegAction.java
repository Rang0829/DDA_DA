package user.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import user.svc.ReviewRegService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewRegAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isReviewRegSuccess = false;
		ReviewBean review = new ReviewBean();
		review.setuID(request.getParameter("uID"));
		review.setbID(request.getParameter("bID"));
		review.setScore(Integer.parseInt(request.getParameter("score")));
		review.setReview(request.getParameter("review"));
		review.setwDate(Date.valueOf(LocalDate.now()));
		
		ReviewRegService reviewRegSvc = new ReviewRegService();
		isReviewRegSuccess = reviewRegSvc.regReview(review);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isReviewRegSuccess) {
			out.println("<script>");
			out.println("alert('한줄평이 등록 되었습니다.')");
			out.println("location.replace('review.us');");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('이미 등록된 도서입니다. 기존 한줄평 삭제 후, 다시 등록 부탁드립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
