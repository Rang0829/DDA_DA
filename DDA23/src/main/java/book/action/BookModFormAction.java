package book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import book.svc.BookModFormService;
import vo.ActionForward;
import vo.BookBean;

public class BookModFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String bID = request.getParameter("bID");
		BookBean book = null;
		
		BookModFormService bookModFormSvc = new BookModFormService();
		book = bookModFormSvc.findBookInfo(bID);
		
		request.setAttribute("bookBean", book);
		request.setAttribute("pagefile", "bookRegForm.jsp");
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		return forward;
	}

}
