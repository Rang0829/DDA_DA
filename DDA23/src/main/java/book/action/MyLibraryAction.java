package book.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import book.svc.MyLibraryService;
import vo.ActionForward;
import vo.BookBean;

public class MyLibraryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String uID = (String) session.getAttribute("id");
		
		MyLibraryService myLibSvc = new MyLibraryService();
		ArrayList<BookBean> myLib = myLibSvc.getMyLibrary(uID);
		
		request.setAttribute("myLibrary", myLib);
		request.setAttribute("pagefile", "../lib/libList.jsp");
		
		forward = new ActionForward();
		forward.setPath("main/main.jsp");
		
		return forward;
	}

}
