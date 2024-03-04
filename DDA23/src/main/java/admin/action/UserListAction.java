package admin.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.UserListService;
import vo.ActionForward;
import vo.UserBean;

public class UserListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		UserListService userListSvc = new UserListService();
		ArrayList<UserBean> list = userListSvc.getUserList();
		
		request.setAttribute("userList", list);
		request.setAttribute("pagefile", "userList.jsp");
		
		forward = new ActionForward();
		forward.setPath("admin/admin.jsp");
		
		return forward;
	}

}
