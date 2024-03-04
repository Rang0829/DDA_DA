package user.action;

import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import log.svc.UserLoginProService;
import user.svc.UserPayService;
import vo.ActionForward;

public class UserPayProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isReqSuccess = false;
		
		String uID = request.getParameter("uID");
		int subType = Integer.parseInt(request.getParameter("subType"));
		Date reqDate = Date.valueOf(request.getParameter("reqDate"));
		String payWay = request.getParameter("payWay");
		Date expDate = null;
		
		if(!request.getParameter("expDate").equals(null) && !request.getParameter("expDate").trim().equals("")) {
			try {
				expDate = Date.valueOf(request.getParameter("expDate"));
			} catch (Exception e) {}
		}
		
		UserPayService userPaySvc = new UserPayService();
		isReqSuccess = userPaySvc.reqPay(uID, subType, reqDate, payWay, expDate);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isReqSuccess) {
			UserLoginProService userLoginProSvc = new UserLoginProService();
			Date expDateAfter = userLoginProSvc.getUserExpDate(uID);
			
			HttpSession sess = request.getSession();
			sess.setAttribute("expDate", expDateAfter);
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main/main.jsp");
		} else {
			out.println("<script>");
			out.println("alert('구독권 신청에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
