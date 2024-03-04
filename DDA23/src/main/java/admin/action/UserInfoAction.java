package admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.UserInfoService;
import vo.ActionForward;
import vo.UserBean;

public class UserInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("uID");
		
		UserInfoService userInfoSvc = new UserInfoService();
		UserBean user = userInfoSvc.getUserInfo(id);
		
		request.setAttribute("user", user);
		request.setAttribute("pagefile", "userInfo.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		return forward;
	}

}
