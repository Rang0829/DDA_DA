package book.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import book.svc.ReadBookService;
import vo.ActionForward;

public class ReadBookAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String bID = request.getParameter("bID");
		String uID = request.getParameter("uID");
		String contents = null;
		
		ReadBookService readBookSvc = new ReadBookService();
		contents = readBookSvc.findBookContents(bID);
		
		boolean isInsertSuccess = readBookSvc.insertLib(uID ,bID);
		
		if(isInsertSuccess) {
			request.setAttribute("bID", bID);
			request.setAttribute("contents", contents);
			
			forward = new ActionForward();
			forward.setPath("lib/libContents.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('책 불러오기에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
