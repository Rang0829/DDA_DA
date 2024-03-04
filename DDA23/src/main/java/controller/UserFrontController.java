package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.action.InfoModAction;
import user.action.ReviewDelAction;
import user.action.UserDeleteAction;
import user.action.UserInfoAction;
import user.action.UserJoinProAction;
import user.action.UserPayProAction;
import user.action.ReviewFormAction;
import user.action.ReviewRegAction;
import user.action.ReviewRegFormAction;
import action.Action;
import vo.ActionForward;
import vo.UserBean;
import static common.KeyCheck.*;

/**
 * Servlet implementation class LogFrontController
 */
@WebServlet("*.us")
public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/userJoinForm.us")) {
			forward = new ActionForward();
			forward.setPath("user/userJoin.jsp");
			
		} 
		else if(command.equals("/userJoinPro.us")) {
			action = new UserJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/payForm.us")) {
			forward = new ActionForward();
			request.setAttribute("pagefile", "../pay/payPage.jsp");
			forward.setPath("main/main.jsp");
		}
		else if(command.equals("/UserPayPro.us")) {
			action = new UserPayProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/personInfo.us")) {
			action = new UserInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/infoModForm.us")) {
			UserBean user = new UserBean();
			user.setuID(request.getParameter("uID"));
			user.setuName(request.getParameter("uName"));
			user.setuNick(request.getParameter("uNick"));
			user.setuEmail(request.getParameter("uEmail"));
			
			forward = new ActionForward();
			if(!checkUserLogin(request, response)) {
		        return;
		    }
			request.setAttribute("user", user);
			request.setAttribute("pagefile", "../user/infoMod.jsp");
			forward.setPath("main/main.jsp");
		}
		else if(command.equals("/infoModPro.us")) {
			action = new InfoModAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/userDelete.us")) {
			action = new UserDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/review.us")) {
			action = new ReviewFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewRegForm.us")) {
			action = new ReviewRegFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewDel.us")) {
			action = new ReviewDelAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/reviewReg.us")) {
			action = new ReviewRegAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
/*		else if(command.equals("")) {
			action = new Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
*/		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
