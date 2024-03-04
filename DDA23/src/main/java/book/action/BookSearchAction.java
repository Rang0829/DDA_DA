package book.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import book.svc.BookSearchService;
import vo.ActionForward;
import vo.BookBean;

public class BookSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String query = request.getParameter("query").trim();
		ArrayList<BookBean> list = null;
		
		BookSearchService bookSearchSvc = new BookSearchService();
		list = bookSearchSvc.findBookList(query);
		
		if(list != null && list.size() != 0) {
			request.setAttribute("query", query);
			request.setAttribute("bookList", list);
			request.setAttribute("pagefile", "../lib/libList.jsp");
			
			forward = new ActionForward();
			forward.setPath("main/main.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('검색 결과가 존재하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
