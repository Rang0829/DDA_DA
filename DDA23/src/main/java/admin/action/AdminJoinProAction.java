package admin.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.AdminJoinProService;
import vo.ActionForward;
import vo.AdminBean;

public class AdminJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isAdminJoinSuccess = false;
		
		AdminBean adminBean = new AdminBean();
		adminBean.setaID(request.getParameter("id"));
		adminBean.setaPW(request.getParameter("pass"));
		adminBean.setaName(request.getParameter("name"));
		adminBean.setaBirth(Date.valueOf(request.getParameter("birth")));
		adminBean.setaTel(request.getParameter("tel"));
		adminBean.setaEmail(request.getParameter("email"));
		adminBean.setaGrade(Integer.parseInt(request.getParameter("grade")));
		
		AdminJoinProService adminJoinProSvc = new AdminJoinProService();
		isAdminJoinSuccess = adminJoinProSvc.joinAdmin(adminBean);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isAdminJoinSuccess) {
			out.println("<script>");
			out.println("alert('관리자 계정 생성이 완료되었습니다.')");
			out.println("location.replace('admin/admin.jsp');");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('관리자 계정 생성에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
