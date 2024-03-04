package user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import user.svc.ReviewDelService;
import vo.ActionForward;

public class ReviewDelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDelSuccess = false;
		String bID = request.getParameter("bID");
		
		HttpSession session = request.getSession();
		String uID = (String) session.getAttribute("id");
		
		try {
			ReviewDelService reviewDelSvc = new ReviewDelService();
			isDelSuccess = reviewDelSvc.deleteReview(uID, bID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isDelSuccess) {
			out.println("<script>");
			out.println("alert('리뷰 삭제가 완료되었습니다.')");
			out.println("location.replace('review.us')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('리뷰 삭제에 오류가 발생하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
