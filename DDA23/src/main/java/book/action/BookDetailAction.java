package book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import book.svc.BookDetailService;
import book.svc.BookModFormService;
import vo.ActionForward;
import vo.BookBean;

public class BookDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String bID = request.getParameter("bID");
		BookBean book = null;
		
		BookModFormService bookModFormSvc = new BookModFormService();
		book = bookModFormSvc.findBookInfo(bID);
		BookDetailService bookDetailSvc = new BookDetailService();
		double score = bookDetailSvc.getBookScore(bID);
		int count = bookDetailSvc.getBookCount(bID);
		
		request.setAttribute("BookBean", book);
		request.setAttribute("score", score);
		request.setAttribute("count", count);
		request.setAttribute("pagefile", "../lib/libDetail.jsp");
		forward = new ActionForward();
		forward.setPath("main/main.jsp");
		return forward;
	}

}
