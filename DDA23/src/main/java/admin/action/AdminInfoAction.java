package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import log.svc.AdminLoginProService;
import vo.ActionForward;
import vo.AdminBean;

public class AdminInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("id");
		
		AdminLoginProService adminInfoSvc = new AdminLoginProService();
		AdminBean adminBean = adminInfoSvc.getAdminInfo(id);
		
		request.setAttribute("id", id);
		request.setAttribute("adminBean", adminBean);
		request.setAttribute("pagefile", "adminInfo.jsp");
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		
		return forward;
	}

}
