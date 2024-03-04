package user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import user.svc.InfoModService;
import vo.ActionForward;

public class InfoModAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isModSuccess = false;
		
		String uID = request.getParameter("uID");
		String uPW = request.getParameter("uPW");
		String uEmail = request.getParameter("uEmail");
		
		try {
			InfoModService infoModSvc = new InfoModService();
			isModSuccess = infoModSvc.modInfo(uID, uPW, uEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isModSuccess) {
			out.println("<script>");
			out.println("alert('정보 수정이 완료되었습니다.')");
			out.println("location.href='main/main.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('정보 수정에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}	
		
		return forward;
	}

}
