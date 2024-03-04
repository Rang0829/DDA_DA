package controller;

import static common.KeyCheck.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import action.Action;
import book.action.AllLibraryAction;
import book.action.BookDelProAction;
import book.action.BookDetailAction;
import book.action.BookListAction;
import book.action.BookModFormAction;
import book.action.BookModProAction;
import book.action.BookRegProAction;
import book.action.BookSearchAction;
import book.action.MyLibraryAction;
import book.action.NoDataAction;
import book.action.ReadBookAction;
import vo.ActionForward;

/**
 * Servlet implementation class LogFrontController
 */
@WebServlet("*.book")
public class BookFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookFrontController() {
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
		
		if(command.equals("/bookList.book")) {
			action = new BookListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/bookRegForm.book")) {
			if(!check2Grade(request, response)) {
				return;
			}
			request.setAttribute("pagefile", "bookRegForm.jsp");
			forward = new ActionForward();
			forward.setPath("admin/admin.jsp");
		}
		else if(command.equals("/bookRegPro.book")) {
			action = new BookRegProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/bookModPro.book")) {
			action = new BookModProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/bookModForm.book")) {
			if(!check2Grade(request, response)) {
				return;
			}
			action = new BookModFormAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/bookDelPro.book")) {
			if(!check2Grade(request, response)) {
				return;
			}
			action = new BookDelProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/myLibrary.book")) {
			if(!checkUserLogin(request, response)) {
		        return;
		    }
			action = new MyLibraryAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/allLibrary.book")) {
			action = new AllLibraryAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/bookDetail.book")) {
			action = new BookDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/bookSearch.book")) {
			action = new BookSearchAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/noDataBook.book")) {
			action = new NoDataAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/readBook.book")) {
			if(!checkUserState(request, response)) {
				return;
			}
			action = new ReadBookAction();
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
