package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.PayStateCheckService;
import vo.ActionForward;
import vo.PayBean;

public class PayStateCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		PayStateCheckService payStateCheckSvc = new PayStateCheckService();
		ArrayList<PayBean> checkPayList = payStateCheckSvc.getPayCheck();
		
		request.setAttribute("checkPayList", checkPayList);
		request.setAttribute("pagefile", "payList.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
	
		return forward;
	}

}
