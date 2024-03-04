package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.svc.PayPermissionService;

public class KeyCheck {
	public static boolean check1Grade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean aGradeOk = false;
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null && session.getAttribute("aGrade") != null) {
			int grade = (int) session.getAttribute("aGrade");
			if(grade == 1) {
				aGradeOk = true;
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('접근 권한이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location.href='logoutPro.log';");
			out.println("</script>");
		}
		
		
		return aGradeOk;
	}
	
	public static boolean check2Grade(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean aGradeOk = false;
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null && session.getAttribute("aGrade") != null) {
			int grade = (int) session.getAttribute("aGrade");
			if(grade <= 2) {
				aGradeOk = true;
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('접근 권한이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location.href='logoutPro.log';");
			out.println("</script>");
		}
		
		
		return aGradeOk;
	}
	
	public static boolean checkAdminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean aLoginOk = false;
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null && session.getAttribute("aGrade") != null) {
			aLoginOk = true;
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location.href='logoutPro.log';");
			out.println("</script>");
		}
		
		
		return aLoginOk;
	}
	
	public static boolean checkUserLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean uLoginOk = false;
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null && session.getAttribute("payState") != null) {
			uLoginOk = true;
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location.href='" + request.getContextPath() + "/logoutPro.log';");
			out.println("</script>");
		}
		
		
		return uLoginOk;
	}
	
	public static boolean checkUserState(HttpServletRequest request, HttpServletResponse response) throws IOException {
		boolean stateOk = false;
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(session.getAttribute("id") != null && session.getAttribute("payState") != null) {
			String payState = (String) session.getAttribute("payState");
			Date expDate = (Date) session.getAttribute("expDate");
			Date nowDate = Date.valueOf(LocalDate.now());
			
			if(payState.equals("On") && expDate.after(nowDate)) {
				stateOk = true;
			} 
			else if(payState.equals("On") && !expDate.after(nowDate)) {
				String uID = (String) session.getAttribute("id");
				session.setAttribute("payState", "Off");
				
				PayPermissionService payPerSvc = new PayPermissionService();
				boolean isChangeSuccess = payPerSvc.changePayState(uID);
				
				if (!isChangeSuccess) {
					out.println("<script>");
					out.println("alert('오류가 발생하였습니다.')");
					out.println("location.href='allLibrary.book'");
					out.println("</script>");
				} else {
					out.println("<script>");
					out.println("alert('이용권 구독을 해주세요.');");
					out.println("location.href='payForm.us';");
					out.println("</script>");
				}
				
			}
			else {
				out.println("<script>");
				out.println("alert('이용권 구독을 해주세요.');");
				out.println("location.href='payForm.us';");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location.href='" + request.getContextPath() + "/logoutPro.log';");
			out.println("</script>");
		}
		
		
		return stateOk;
	}
}
