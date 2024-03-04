package book.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import book.svc.BookListService;
import vo.ActionForward;
import vo.BookBean;

public class BookListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		BookListService bookListSvc = new BookListService();
		ArrayList<BookBean> list = bookListSvc.getBookList();
		
		request.setAttribute("bookList", list);
		request.setAttribute("pagefile", "bookList.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		
		return forward;
	}

}
