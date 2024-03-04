package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.PayListService;
import vo.ActionForward;
import vo.PayBean;

public class PayListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		PayListService payListSvc = new PayListService();
		
		ArrayList<PayBean> payList = payListSvc.getPayList();
		
		request.setAttribute("payList", payList);
		request.setAttribute("pagefile", "payList.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		
		return forward;
	}

}
