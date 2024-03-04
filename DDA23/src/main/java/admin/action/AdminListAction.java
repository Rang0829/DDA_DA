package admin.action;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import action.Action;
import admin.svc.AdminListService;
import vo.ActionForward;
import vo.AdminBean;

public class AdminListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		AdminListService adminListSvc = new AdminListService();
		ArrayList<AdminBean> list = adminListSvc.getAdminList();
		
		request.setAttribute("adminList", list);
		request.setAttribute("pagefile", "adminList.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		
		return forward;
	}

}
