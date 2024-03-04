package user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.UserInfoService;
import vo.ActionForward;
import vo.UserBean;

public class UserInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession sess = request.getSession();
		String uID = (String) sess.getAttribute("id");
		
		UserInfoService userInfoSvc = new UserInfoService();
		UserBean user = userInfoSvc.getUserInfo(uID);
		
		request.setAttribute("user", user);
		request.setAttribute("pagefile", "../user/infoPage.jsp");
		
		forward = new ActionForward();
		forward.setPath("main/main.jsp");
		
		return forward;
	}

}
