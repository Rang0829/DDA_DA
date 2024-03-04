package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.SalesService;
import vo.ActionForward;

public class SalesAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int[][] list = null;
		
		SalesService salesSvc = new SalesService();
		list = salesSvc.countPayList();
		
		request.setAttribute("salesList", list);
		request.setAttribute("pagefile", "payList.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		
		return forward;
	}

}
