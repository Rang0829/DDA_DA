package user.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import user.svc.ReviewRegFormService;
import vo.ActionForward;
import vo.BookBean;

public class ReviewRegFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String uID = (String) session.getAttribute("id");
		
		ReviewRegFormService reviewRegFormSvc = new ReviewRegFormService();
		ArrayList<BookBean> myLibrary = reviewRegFormSvc.findMyLibrary(uID);
		
		request.setAttribute("myLibrary", myLibrary);
		
		forward = new ActionForward();
		request.setAttribute("pagefile", "../review/reviewReg.jsp");
		forward.setPath("main/main.jsp");
		return forward;
	}

}
