package user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import user.svc.UserDeleteService;
import vo.ActionForward;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDelSuccess = false;
		String uID = request.getParameter("uID");
		
		try {
			UserDeleteService userDelSvc = new UserDeleteService();
			isDelSuccess = userDelSvc.deleteUser(uID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isDelSuccess) {
			out.println("<script>");
			out.println("alert('계정 삭제가 완료되었습니다.')");
			out.println("location.replace('index.jsp')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('계정 삭제에 오류가 발생하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
