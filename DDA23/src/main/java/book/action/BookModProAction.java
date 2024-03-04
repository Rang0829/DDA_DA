package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import book.svc.BookModProService;
import vo.ActionForward;
import vo.BookBean;

public class BookModProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isModSuccess = false;
		
		String uploadPath = request.getServletContext().getRealPath(request.getParameter("contents"));
		
		try {
			
			int size = 1024 * 1024 * 1024;
			
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8");
			
			Enumeration<?> files = multi.getFileNames();
			
				while(files.hasMoreElements()) {
					String file = (String) files.nextElement();
					
					System.out.println(multi.getFilesystemName(file));
					System.out.println(multi.getOriginalFileName(file));
				}
			
			BookBean bookBean = new BookBean();
			bookBean.setbID(multi.getParameter("bID"));
			bookBean.setAuthor(multi.getParameter("author"));
			bookBean.setGenre(multi.getParameter("genre"));
			bookBean.setPublisher(multi.getParameter("publisher"));
			bookBean.setPubDate(Date.valueOf(multi.getParameter("pubDate")));
			bookBean.setPage(Integer.parseInt(multi.getParameter("page")));
			bookBean.setCompany(multi.getParameter("company"));
			bookBean.setcAddr(multi.getParameter("cAddr"));
			bookBean.setIBSN(multi.getParameter("IBSN"));
			bookBean.setPrice(Integer.parseInt(multi.getParameter("price")));
			bookBean.setOutline(multi.getParameter("outline"));
			bookBean.setContents("images/" + multi.getParameter("bID"));
			bookBean.setImgPage(Integer.parseInt(multi.getParameter("pageCnt")));
			
			BookModProService bookModProSvc = new BookModProService();
			isModSuccess = bookModProSvc.modBookInfo(bookBean);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (isModSuccess) {
			out.println("<script>");
			out.println("alert('책 수정이 완료되었습니다.')");
			out.println("location.replace('bookList.book')");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('책 수정에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}	
		
		return forward;
	}

}
