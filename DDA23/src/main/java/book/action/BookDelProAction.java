package book.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import book.svc.BookDelProService;
import vo.ActionForward;

public class BookDelProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDelSuccess = false;
		String bID = request.getParameter("bID");
		
		BookDelProService bookDelProSvc = new BookDelProService();
		isDelSuccess = bookDelProSvc.deleteBookInfo(request, bID);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isDelSuccess) {
			out.println("<script>");
			out.println("alert('책 삭제가 완료되었습니다.')");
			out.println("location.replace('bookList.book')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('책 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
