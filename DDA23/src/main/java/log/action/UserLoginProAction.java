package log.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import log.svc.UserLoginProService;
import vo.ActionForward;

public class UserLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		UserLoginProService userLoginProSvc = new UserLoginProService();
		boolean isUserLoginSuccess = userLoginProSvc.loginUser(id, pass);
		String uNick = userLoginProSvc.getUserNick(id);
		String payState = userLoginProSvc.getUserPayState(id);
		if(payState == null) {
			payState = "Off";
		}
		Date expDate = userLoginProSvc.getUserExpDate(id);
		
		
		if (isUserLoginSuccess) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("uNick", uNick);
			session.setAttribute("payState", payState);
			session.setAttribute("expDate", expDate);
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main/main.jsp");
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
