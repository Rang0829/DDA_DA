package log.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import log.svc.AdminLoginProService;
import vo.ActionForward;
import vo.AdminBean;

public class AdminLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		AdminLoginProService adminLoginProSvc = new AdminLoginProService();
		boolean isAdminLoginSuccess = adminLoginProSvc.loginAdmin(id, pass);
		AdminBean adminBean = adminLoginProSvc.getAdminInfo(id);
		
		if (isAdminLoginSuccess) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("aGrade", adminBean.getaGrade());
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("admin/admin.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
			out.println("location.href='index.jsp'");
			out.println("</script>");
		}
		return forward;
	}

}
