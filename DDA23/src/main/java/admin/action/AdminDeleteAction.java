package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.AdminDeleteService;
import vo.ActionForward;

public class AdminDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDelSuccess = false;
		String aID = request.getParameter("aID");
		
		AdminDeleteService adminDelSvc = new AdminDeleteService();
		isDelSuccess = adminDelSvc.deleteAdmin(aID);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isDelSuccess) {
			out.println("<script>");
			out.println("alert('관리자 삭제가 완료되었습니다.')");
			out.println("location.href='adminList.ad'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('관리자 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
