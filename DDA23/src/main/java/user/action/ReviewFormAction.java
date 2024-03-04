package user.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import user.svc.ReviewFormService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		ReviewFormService reviewFormSvc = new ReviewFormService();
		ArrayList<ReviewBean> reviewList = reviewFormSvc.getReviewList();
		ArrayList<String[]> attachList = reviewFormSvc.getAttachList();
		
		try {
			if(reviewList != null) {
				if(reviewList.get(0).getuID().equals(attachList.get(0)[2]) && reviewList.get(0).getbID().equals(attachList.get(0)[3])) {
					request.setAttribute("reviewList", reviewList);
					request.setAttribute("attachList", attachList);
					request.setAttribute("pagefile", "../review/reviewList.jsp");
					
					forward = new ActionForward();
					forward.setPath("main/main.jsp");
				} else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					
					out.println("<script>");
					out.println("alert('리뷰 불러오기에 오류가 발생하였습니다. 잠시 후, 다시 이용해주세요.')");
					out.println("location.href='main/main.jsp'");
					out.println("</script>");
				}
			} else {
				request.setAttribute("pagefile", "../review/reviewList.jsp");
				
				forward = new ActionForward();
				forward.setPath("main/main.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
