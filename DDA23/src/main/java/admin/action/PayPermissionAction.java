package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.PayPermissionService;
import vo.ActionForward;

public class PayPermissionAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isPerSuccess = false;
		String id = request.getParameter("uID");
		String subType = request.getParameter("subType");
		
		PayPermissionService payPerSvc = new PayPermissionService();
		isPerSuccess = payPerSvc.getPerDateState(id, subType);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (!isPerSuccess) {
			out.println("<script>");
			out.println("alert('결제 확인에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(isPerSuccess);
			forward.setPath("admin/admin.jsp");
		}
		
		return forward;
	}

}
