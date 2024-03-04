package user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import user.svc.UserJoinProService;
import vo.ActionForward;
import vo.UserBean;

public class UserJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isUserJoinSuccess = false;
		
		UserBean userBean = new UserBean();
		userBean.setuID(request.getParameter("id"));
		userBean.setuPW(request.getParameter("uPW"));
		userBean.setuName(request.getParameter("uName"));
		userBean.setuNick(request.getParameter("uNick"));
		userBean.setuEmail(request.getParameter("uEmail"));
		
		UserJoinProService userJoinProSvc = new UserJoinProService();
		isUserJoinSuccess = userJoinProSvc.joinUser(userBean);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isUserJoinSuccess) {
			out.println("<script>");
			out.println("alert('회원 가입이 완료되었습니다.')");
			out.println("location.replace('index.jsp')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('계정 생성에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
